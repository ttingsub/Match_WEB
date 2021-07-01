package qna;

import java.util.List;

public interface QnaService {
	//CRUD 만들기
	void qna_insert(QnaVO vo); //신규공지글 저장
	void qna_reply_insert(QnaVO vo); //신규 답글 저장
	List<QnaVO> qna_list();//공지글목록조회
	QnaVO qna_view(int id); //공지글 상세조회
	void qna_read(int id); //조회수 증가 처리
	void qna_update(QnaVO vo); //공지글 수정(변경저장)
	void qna_delete(int id); //공지글 삭제
	//페이징 처리하는 notice_list 추가 예정
	QnaPage qna_list(QnaPage page);
}
