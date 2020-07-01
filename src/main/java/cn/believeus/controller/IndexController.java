package cn.believeus.controller;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Observable;
import java.util.Observer;
import java.util.ResourceBundle;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.believeus.model.PDF;
import cn.believeus.model.Plate;
import cn.believeus.model.Tuser;
import cn.believeus.model.Well;
import cn.believeus.service.MailService;
import cn.believeus.service.MySQLService;
import cn.believeus.variables.Variables;

import com.alibaba.fastjson.JSONObject;

@Controller
public class IndexController extends Observable {
	@Resource
	private MySQLService service;
	@Resource
	private MailService mailService;

	public IndexController() {
		this.addObserver(new Observer() {
			@Override
			public void update(Observable o, Object data) {
				Plate plate = (Plate) data;
				JSONObject jsonObject = JSONObject.parseObject(plate.getData());
				Set<Entry<String, Object>> entrySet = jsonObject.entrySet();
				Iterator<Entry<String, Object>> iterator = entrySet.iterator();
				while (iterator.hasNext()) {
					Entry<String, Object> entry = iterator.next();
					JSONObject value = (JSONObject) entry.getValue();
					Well well = JSONObject.toJavaObject(value, Well.class);
					PDF v = (PDF) service.findObject(PDF.class, "wellname", well.name);
					if (v == null) {
						PDF pdf = new PDF().setWellname(well.name).setParent(plate.getBarcode());
						service.saveOrUpdate(pdf);
					}
				}
			}
		});
	}

	@ResponseBody
	@RequestMapping("/patient/result")
	public PDF findPDF(String wellname) {
		PDF v = (PDF) service.findObject(PDF.class, "wellname", wellname);
		return v;
	}

	@ResponseBody
	@RequestMapping("/patient/build/pdf")
	public String sendPDF(String data) {
		try {
			PDF pdf = JSONObject.toJavaObject(JSONObject.parseObject(data), PDF.class);
			Plate plate = (Plate) service.findObject(Plate.class, "barcode", pdf.parent);
			String vm = JSONObject.parseObject(plate.getData()).getString(pdf.wellname);
			Well well = JSONObject.toJavaObject(JSONObject.parseObject(vm), Well.class);
			ResourceBundle bundle = ResourceBundle.getBundle("project");
			String host = bundle.getString("url");
			String pdfstore = bundle.getString("pdfstore");
			String os = System.getProperty("os.name");
			String phantomjsexe = getClass().getClassLoader().getResource(os.toLowerCase().startsWith("win") ? "window-x64-phantomjs.exe" : "linux-x64-phantomjs.exe").getPath();
			phantomjsexe = os.toLowerCase().startsWith("win") ? phantomjsexe.substring(1) : phantomjsexe;
			String rasterizejs = getClass().getClassLoader().getResource("rasterize.js").getPath();
			rasterizejs = os.toLowerCase().startsWith("win") ? rasterizejs.substring(1) : rasterizejs;
			String url = host + "patient/" + plate.getBarcode() + "/" + well.name + "/pdfview.jhtml";
			String scantime = new SimpleDateFormat("yyyy-MM-dd#hh#mm#ss").format(well.scantime);
			String pdfpath = pdfstore + scantime + "-HKG-Diagnostic-Report.pdf";
			// 保存数据
			PDF pview = (PDF) service.findObject(PDF.class, "wellname", pdf.wellname);
			PDF view = (pview == null) ? pdf : pview;
			String title = pdf.patientname.trim() + "'s diagnosis report.pdf";
			view.setPatientname(pdf.patientname.trim());
			view.setPdf(pdfpath);
			view.setEmail(pdf.email);
			view.setNote(pdf.note);
			view.setPositive(pdf.positive);
			view.setWellname(well.name);
			service.saveOrUpdate(view);
			String cmd = (os.toLowerCase().startsWith("win") ? "cmd /c " : "") + phantomjsexe + " " + rasterizejs + " " + url + " " + pdfpath;
			System.out.println(cmd);
			Process proc = Runtime.getRuntime().exec(cmd);
			int exitVal = proc.waitFor(); // 阻塞当前线程，并等待外部程序中止后获取结果码
			if (exitVal != 0)
				return "error-pdf";
			String message = bundle.getString("emailbody");
			String v = mailService.sendMail(title, message, pdf.getEmail(), pdfpath, title);
			return v;
		} catch (Exception e) {
			e.printStackTrace();
			return "error-pdf";
		}
	}

	@RequestMapping("/patient/{barcode}/{wellname}/pdfview")
	public ModelAndView pdfview(@PathVariable("barcode") String barcode, @PathVariable("wellname") String wellname) {
		ModelAndView modelView = new ModelAndView();
		PDF pdf = (PDF) service.findObjectList(PDF.class, "parent", barcode, "wellname", wellname).get(0);
		Plate plate = (Plate)service.findObject(Plate.class,"barcode", pdf.parent);
		String vm = JSONObject.parseObject(plate.getData()).getString(pdf.wellname);
		Well well = JSONObject.toJavaObject(JSONObject.parseObject(vm), Well.class);
		modelView.addObject("pdf", pdf);
		modelView.addObject("well",well);
		modelView.setViewName("/WEB-INF/front/virus-report.jsp");
		return modelView;
	}

	@ResponseBody
	@RequestMapping("/plate/savewell")
	public String savewell(String barcode, String data) {
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", barcode);
		plate.setData(data);
		service.saveOrUpdate(plate);
		notifyObservers(plate);
		setChanged();
		return "success";
	}

	@ResponseBody
	@RequestMapping("/plate/save")
	public String save(String barcode, String data) {
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", barcode);
		Plate pv = (plate == null) ? new Plate(barcode, data) : plate.setBarcode(barcode).setData(data);
		service.saveOrUpdate(pv);
		notifyObservers(pv);
		setChanged();
		return "success";
	}

	@RequestMapping(value = "/plate/findData", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Plate findData(String barcode) {
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", barcode);
		return plate;
	}

	@ResponseBody
	@RequestMapping("/ulogin")
	public Tuser login(String email, String password, HttpSession session) {
		String hql = "From Tuser u where u.mail='" + email + "' and u.password='" + password + "'";
		Tuser user = (Tuser) service.findObject(hql);
		if (user != null) {
			session.setAttribute(Variables.SESSION_USER, user);
		}
		return user;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
