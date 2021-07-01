package qna;

public interface QnaService {
	//CRUD 만들기
	void qna_insert(QnaVO vo);	//글쓰기
	QnaPage qna_list(QnaPage page);	//페이지 조회 → QnaPage
	QnaVO qna_detail(int id);	//상세 조회
	int qna_read(int id);	//조회수 증가 처리
	int qna_update(QnaVO vo);	//수정
	int qna_delete(int id);	//삭제
}
