package com.hanul.match;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.QnaServiceImpl;

@Controller
public class QnaController {
	@Autowired private QnaServiceImpl service;
	
	//QnA 목록 화면 요청
	@RequestMapping("/list.qn")
	public String list(HttpSession session) {
		session.setAttribute("category", "qn");
		
		//DB에서 qna 글 정보를 조회해 와 목록 화면에 출력
		return "qna/list";
	}

}
