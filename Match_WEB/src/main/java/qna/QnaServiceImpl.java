package qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired private QnaDAO dao;
	
	@Override
	public void qna_insert(QnaVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public QnaPage qna_list(QnaPage page) {
		return dao.qna_list(page);
	}

	@Override
	public QnaVO qna_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qna_read(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qna_update(QnaVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qna_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
