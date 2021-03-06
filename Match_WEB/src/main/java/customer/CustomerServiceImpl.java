package customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//개발자가 PM이 만들어준 Service.class 받음

//어노테이션 규칙 Service를 implements 받은 (개발자가사용하는class)
//에서 무조건 @Service 어노테이션을 줘야된다.
@Service
public class CustomerServiceImpl  implements CustomerService{
	@Autowired private CustomerDAO dao;
	@Override
	public void customer_insert(CustomerVO vo) {
		dao.customer_insert(vo);
	}

	@Override
	public List<CustomerVO> customer_list() {
		return dao.customer_list();
	}

	@Override
	public CustomerVO customer_detail(String id) {
		return dao.customer_detail(id);
	}

	@Override
	public void costomer_update(CustomerVO vo) {
		 dao.costomer_update(vo);
		
	}

	@Override
	public void customer_delete(String id) {
		dao.customer_delete(id);
		
	}

	@Override
	public void customer_update_password(CustomerVO vo) {
		dao.customer_update_password(vo);
	}

}
