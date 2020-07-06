package cn.believeus.controller;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Map.Entry;
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
public class IndexController {
	@Resource
	private MySQLService service;
	@Resource
	private MailService mailService;

	@ResponseBody
	@RequestMapping("/patient/result")
	public PDF findPDF(String barcode, String parent) {
		PDF v = (PDF) service.findObject(PDF.class, "barcode", barcode, "parent", parent);
		return v;
	}

	@ResponseBody
	@RequestMapping("/patient/statis")
	public String statis() {
		Long negative = (Long) service.findObject("select count(*) from  PDF v where positive=0 ");
		Long positive = (Long) service.findObject("select count(*) from  PDF where positive=1 ");
		return negative+"@"+positive;
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
			PDF pview = (PDF) service.findObject(PDF.class, "barcode", well.barcode, "parent", well.parent);
			PDF view = (pview == null) ? pdf : pview;
			String title = pdf.patientname.trim() + "'s diagnosis report.pdf";
			view.setPatientname(pdf.patientname.trim());
			view.setPdf(pdfpath);
			view.setEmail(pdf.email);
			view.setNote(pdf.note);
			view.setPositive(pdf.positive);
			view.setWellname(well.name);
			view.setBarcode(well.barcode);
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
		PDF pdf = (PDF) service.findObject(PDF.class, "parent", barcode, "wellname", wellname);
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", pdf.parent);
		String vm = JSONObject.parseObject(plate.getData()).getString(pdf.wellname);
		Well well = JSONObject.toJavaObject(JSONObject.parseObject(vm), Well.class);
		modelView.addObject("pdf", pdf);
		modelView.addObject("well", well);
		modelView.setViewName("/WEB-INF/front/virus-report.jsp");
		return modelView;
	}

	@ResponseBody
	@RequestMapping("/plate/savewell")
	public String savewell(String barcode, String data) {
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", barcode);
		plate.setData(data);
		service.saveOrUpdate(plate);
		JSONObject jsonObject = JSONObject.parseObject(plate.getData());
		Set<Entry<String, Object>> entrySet = jsonObject.entrySet();
		Iterator<Entry<String, Object>> iterator = entrySet.iterator();
		while (iterator.hasNext()) {
			Entry<String, Object> entry = iterator.next();
			JSONObject value = (JSONObject) entry.getValue();
			Well well = JSONObject.toJavaObject(value, Well.class);
			PDF v = (PDF) service.findObject(PDF.class, "parent", plate.getBarcode(), "wellname", well.name);
			PDF pv = (v == null) ? new PDF() : v;
			PDF pdf = pv.setWellname(well.name).setParent(plate.getBarcode()).setBarcode(well.barcode);
			service.saveOrUpdate(pdf);
		}
		return "success";
	}

	@ResponseBody
	@RequestMapping("/plate/rmcolor")
	public String rmcolor(String barcode, String data) {
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", barcode);
		plate.setBarcode(barcode).setData(data);
		service.saveOrUpdate(plate);
		return "success";
	}

	@ResponseBody
	@RequestMapping("/plate/create")
	public String create(String barcode, String data) {
		Plate pv = new Plate(barcode, data);
		service.saveOrUpdate(pv);
		return "success";
	}

	@ResponseBody
	@RequestMapping("/barcode/update")
	public String updatebarcode(String data) {
		Well well = JSONObject.toJavaObject(JSONObject.parseObject(data), Well.class);
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", well.parent);
		JSONObject jsonObject = JSONObject.parseObject(plate.getData());
		jsonObject.put(well.name, JSONObject.toJSON(well));
		plate.setData(jsonObject.toJSONString());
		service.saveOrUpdate(plate);
		PDF v = (PDF) service.findObject(PDF.class, "parent", plate.getBarcode(), "wellname", well.name);
		PDF pv = (v == null) ? new PDF() : v;
		PDF pdf = pv.setWellname(well.name).setParent(plate.getBarcode()).setBarcode(well.barcode);
		service.saveOrUpdate(pdf);
		return "success";
	}

	@RequestMapping(value = "/plate/findData", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Plate findData(String barcode) {
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", barcode);
		return plate;
	}

	@ResponseBody
	@RequestMapping("/plate/findwell")
	public Well findWell(String barcode) {
		PDF pdf = (PDF) service.findObject(PDF.class, "barcode", barcode);
		if (pdf == null)
			return null;
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", pdf.parent);
		if (plate == null)
			return null;
		String vm = JSONObject.parseObject(plate.getData()).getString(pdf.wellname);
		Well well = JSONObject.toJavaObject(JSONObject.parseObject(vm), Well.class);
		return well;
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
