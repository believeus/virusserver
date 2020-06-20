package cn.believeus.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.model.Plate;
import cn.believeus.model.Tuser;
import cn.believeus.service.MySQLService;
import cn.believeus.variables.Variables;

@Controller
public class IndexController {
	@Resource
	private MySQLService service;

	@ResponseBody
	@RequestMapping("/plate/save")
	public String save(String barcode, String data) {
		Plate plate = (Plate) service.findObject(Plate.class, "barcode", barcode);
		plate = (plate == null) ? new Plate(barcode, data) : plate.setBarcode(barcode).setData(data);
		service.saveOrUpdate(plate);
		return "success";
	}

	@RequestMapping(value="/plate/findData",produces = "application/json; charset=utf-8")
	@ResponseBody
	public Plate findData(String barcode) {
		Plate plate= (Plate) service.findObject(Plate.class, "barcode", barcode);
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
