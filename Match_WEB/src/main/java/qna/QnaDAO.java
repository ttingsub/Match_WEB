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
		sql.insert("qna.mapper.insert" , vo);		
	}

	@Override
	public void qna_reply_insert(QnaVO vo) {
		sql.insert("qna.mapper.reply_insert" , vo);		
	}

	@Override
	public List<QnaVO> qna_list() {
		return sql.selectList("qna.mapper.list");
	}

	@Override
	public QnaVO qna_view(int id) {
		return sql.selectOne("qna.mapper.view" , id);
	}

	@Override
	public void qna_read(int id) {
		sql.update("qna.mapper.readcnt" , id);		
	}

	@Override
	public void qna_update(QnaVO vo) {
		sql.update("qna.mapper.update" , vo);		
	}

	@Override
	public void qna_delete(int id) {
		sql.delete("qna.mapper.delete" , id);		
	}

	@Override
	public QnaPage qna_list(QnaPage page) {
		//총 글 갯수를 가져와서 setTotalList
		int pagett = sql.selectOne("qna.mapper.totalList" , page);
		page.setTotalList(pagett );
		//총 글 내용을 가지고 올것
		List<QnaVO> list =  sql.selectList("qna.mapper.list" , page);
		page.setList(list);
		return page;
	}
	
}
