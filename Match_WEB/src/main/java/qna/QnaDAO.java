package qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository
public class QnaDAO implements QnaService {
	@Autowired @Qualifier("hanul") private SqlSession sql;
	
	@Override
	public void qna_insert(QnaVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public QnaPage qna_list(QnaPage page) {
		int paget =  sql.selectOne("qna.mapper.totalList", page) ;
		page.setTotalList(paget);
		
		List<QnaVO> list =  sql.selectList("qna.mapper.list", page) ; 
		return page;
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
