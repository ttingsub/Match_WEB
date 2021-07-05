package com.hanul.match;



import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import member.MemberVO;
import qna.QnaPage;
import qna.QnaServiceImpl;
import qna.QnaVO;

@Controller
public class QnaController {
	@Autowired private QnaServiceImpl service;
	@Autowired private QnaPage page;
	@Autowired private CommonService common;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//controller에서 http 응답처리를 하겠다 .responsebody
	@ResponseBody @RequestMapping("download.qn")
	public void download(int id , HttpSession session , HttpServletResponse response) {
		//해당 공지글에 파일이 있다면 서버로부터 다운로드 처리를 한다.
		QnaVO vo = service.qna_view(id);
		common.fileDownload(vo.getFilename(), vo.getFilepath(), session, response);
		
	}
	
	@RequestMapping("list.qn")
	public String list(Model model , HttpSession session
			, @RequestParam(defaultValue = "1") int curPage,
			String search , String keyword) {
		session.setAttribute("category", "qn");
		
		
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service.qna_list(page));
		/* 과거 전체리스트 그냥 조회용 (테스트)
		 * List<QnaVO> list = service.qna_list(); model.addAttribute("list",
		 * list);
		 */
		
		return "qna/list";
	}
	@RequestMapping("view.qn")
	public String view(int id , Model model) {
		//조회수 증가처리 추가 예정
		//update qna set readcnt = readcnt +1 where ?
		service.qna_read(id);
		
		
		QnaVO vo = service.qna_view(id);
		model.addAttribute("vo", vo  );
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("page" , page);
		return "qna/view";
	}
	@RequestMapping("new.qn")
	public String newWriter() {
		
		return "qna/new";
	}
	@RequestMapping("modify.qn")
	public String modify(int id, Model model) {
	
		model.addAttribute("vo", service.qna_view(id) );
		return "qna/modify";
	}
	@RequestMapping("reply.qn")
	public String reply(int id, Model model) {
		
		model.addAttribute("vo", service.qna_view(id) );
		return "qna/reply";
	}
	@RequestMapping("update.qn")
	public String update(QnaVO vo, MultipartFile file, String filename , HttpSession session) {
		QnaVO qna = service.qna_view(vo.getId());
		//원본 파일 (변경처리 되기전 ) 위치를 알아옴
		String realFile = session.getServletContext().getRealPath("resources") + "/" + qna.getFilepath();
		
		if( !file.isEmpty()) {
			//파일을 첨부한 경우: 원래 없ㄷ었는데 신규 첨부, 원래 있었던거 바꿔서 첨부
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(  common.fileUpload(session, file, "qna"));
			//원래 첨부된 파일이 있다면 물리적영역에서 파일을 삭제
			if(qna.getFilename() != null) {
				File f = new File(realFile);
				if (f.exists() ) f.delete();
			}
		}else {
			//파일을 첨부하지 않은 경우
			if(filename.isEmpty()) {
				//원래 첨부된 파일을 삭제한 경우
				if(qna.getFilename() != null) {
					File f = new File(realFile);
					if (f.exists()) f.delete();
				}
			}else {
				//원래 첨부된 파일을 손대지 않은경우
				vo.setFilename(qna.getFilename());
				vo.setFilepath(qna.getFilepath());
			}
		}
		
		service.qna_update(vo);
		//화면에서 변경입력한 정보들이 정확히 들어왔는지 확인을 위해서 다시 veiw.qn로 간다.
		return "redirect:view.qn?id=" + vo.getId();
	}
	@RequestMapping("delete.qn")
	public String delete(int id) {
		//------프로젝트 참고
		//실제 데이터는 삭제 하는 경우가 거의 없음
		//기존테이블 -> 이력테이블 insert -> delete
		//기존테이블의 구분자를 둬서 사용자에게 안보이게끔 처리 update 보이는데이터 Y -> 삭제된 데이터 N
		//관리자는 삭제 된 데이터들을 조회해서 볼수 있음.
		//-------------------------delete from table_name where 1=1
		service.qna_delete(id);
		return "redirect:list.qn";
	}

	/* reply_insert.qn */
	
	@RequestMapping("reply_insert.qn")
	public String reply_insert(QnaVO vo  ,  MultipartFile file , HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("logininfo");
		vo.setWriter(member.getId());

		//화면에서 입력한 답글정보를 DB에 저장 후 목록화면으로 연결하겠다.
		
		if(! file.isEmpty() ) {
//			logger.info("파일이 있음");
//			logger.info(file.getOriginalFilename());
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath( common.fileUpload(session, file, "qna"));
		}else {
//			logger.info("파일이 없음");
		}
//		logger.info("디버깅 포인트");
		
		service.qna_reply_insert(vo);
		
		return "redirect:list.qn";
	}
	
	@RequestMapping("insert.qn")
	public String insert(QnaVO vo  ,  MultipartFile file , HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("logininfo");
		vo.setWriter(member.getId());
		//세션에 있는 정보는 만약에 정보가 있다면 언제든 session.getAtteribute를 통해 사용가능
		if(! file.isEmpty() ) {
//			logger.info("파일이 있음");
//			logger.info(file.getOriginalFilename());
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath( common.fileUpload(session, file, "qna"));
		}else {
//			logger.info("파일이 없음");
		}
//		logger.info("디버깅 포인트");
		
		service.qna_insert(vo);
		
		return "redirect:list.qn";
	}

}
