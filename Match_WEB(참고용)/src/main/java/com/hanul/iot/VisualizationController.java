package com.hanul.iot;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import employee.EmployeeSeviceImpl;

@Controller
public class VisualizationController {
	@Autowired private EmployeeSeviceImpl service;
	
	//TOP3 부서별 년도별채용인원수 조회 요청
	@ResponseBody @RequestMapping("/visual/top3/year")
	public List<HashMap<String, Object>> hirement_year_top3(){
		return service.hirement_top3_year();
	}
	
	//TOP3 부서별 월별채용인원수 조회 요청
	@ResponseBody @RequestMapping("/visual/top3/month")
	public List<HashMap<String, Object>> hirement_month_top3(){
		return service.hirement_top3_month();
	}
	
	
	//년도별채용인원수 조회 요청
	@ResponseBody @RequestMapping("/visual/year")
	public List<HashMap<String, Object>> hirement_year(){
		return service.hirement_year();
	}

	//월별채용인원수 조회 요청
	@ResponseBody @RequestMapping("/visual/month")
	public List<HashMap<String, Object>> hirement_month(){
		return service.hirement_month();
	}
	
	
	//부서원수 조회 요청
	@ResponseBody @RequestMapping("/visual/department")
	public List<HashMap<String, Object>> department() {
		return service.department();
	}
	
	//시각화 화면 요청
	@RequestMapping("/list.vi")
	public String list(HttpSession session) {
		session.setAttribute("category", "vi");
		return "visual/list";
	}
}

