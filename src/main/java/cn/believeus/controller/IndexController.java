package cn.believeus.controller;

import java.util.ResourceBundle;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.believeus.model.PDF;
import cn.believeus.model.Plate;
import cn.believeus.model.Tuser;
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
	@RequestMapping("/patient/build/pdf")
	public String sendPDF(String data) {
		try {
			PDF pdf = JSONObject.toJavaObject(JSONObject.parseObject(data), PDF.class);
			ResourceBundle bundle = ResourceBundle.getBundle("project");
			String host = bundle.getString("url");
			String pdfstore = bundle.getString("pdfstore");
			String os = System.getProperty("os.name");
			String phantomjsexe = getClass().getClassLoader().getResource(os.toLowerCase().startsWith("win") ? "window-x64-phantomjs.exe" : "linux-x64-phantomjs.exe").getPath();
			phantomjsexe = os.toLowerCase().startsWith("win") ? phantomjsexe.substring(1) : phantomjsexe;
			String rasterizejs = getClass().getClassLoader().getResource("rasterize.js").getPath();
			rasterizejs = os.toLowerCase().startsWith("win") ? rasterizejs.substring(1) : rasterizejs;
			String url = host + "patient/pdfview.jhtml?barcode=" + pdf.barcode;
			String pdfpath = pdfstore + "HKG-Diagnostic-Report-" + pdf.createTime + ".pdf";
			// 保存数据
			PDF pview = (PDF) service.findObject(PDF.class, "barcode", pdf.barcode);
			PDF view = (pview == null) ? pdf : pview;
			String title = pdf.name.trim()+ "'s diagnosis report.pdf";
			view.setName(pdf.name.trim());
			view.setCreateTime(pdf.createTime);
			view.setPath(pdfpath);
			view.setBarcode(pdf.barcode);
			view.setEmail(pdf.email);
			view.setNote(pdf.note);
			view.setPositive(pdf.positive);
			service.saveOrUpdate(view);
			String cmd = (os.toLowerCase().startsWith("win") ? "cmd /c " : "") + phantomjsexe + " " + rasterizejs + " " + url + " " + pdfpath;
			System.out.println(cmd);
			Process proc = Runtime.getRuntime().exec(cmd);
			int exitVal = proc.waitFor(); // 阻塞当前线程，并等待外部程序中止后获取结果码
			if (exitVal != 0)return "error-pdf";
			String message = bundle.getString("emailbody");
			mailService.sendMail(title, message, pdf.getEmail(), pdfpath, title);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

	}

	@RequestMapping("/patient/pdfview")
	public ModelAndView pdfview(String barcode) {
		ModelAndView modelView = new ModelAndView();
		PDF pdf = (PDF) service.findObject(PDF.class, "barcode", barcode);
		modelView.addObject("pdf", pdf);
		modelView.setViewName("/WEB-INF/front/virus-report.jsp");
		return modelView;
	}

	@ResponseBody
	@RequestMapping("/plate/save")
	public String save(String barcode, String data) {
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", barcode);
		plate = (plate == null) ? new Plate(barcode, data) : plate.setBarcode(barcode).setData(data);
		service.saveOrUpdate(plate);
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
