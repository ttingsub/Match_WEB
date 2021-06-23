package notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDAO dao;
	@Override
	public void notice_insert(NoticeVO vo) {
		dao.notice_insert(vo);
		
	}

	@Override
	public void notice_reply_insert(NoticeVO vo) {
		dao.notice_reply_insert(vo);
		
	}

	@Override
	public List<NoticeVO> notice_list() {
		// TODO Auto-generated method stub
		return dao.notice_list();
	}

	@Override
	public NoticeVO notice_view(int id) {
		// TODO Auto-generated method stub
		return dao.notice_view(id);
	}

	@Override
	public void notice_read(int id) {
		 dao.notice_read(id);
		
	}

	@Override
	public void notice_update(NoticeVO vo) {
		dao.notice_update(vo);
	}

	@Override
	public void notice_delete(int id) {
		dao.notice_delete(id);
		
	}

	@Override
	public NoticePage notice_list(NoticePage page) {
		// TODO Auto-generated method stub
		return dao.notice_list(page);
	}

}