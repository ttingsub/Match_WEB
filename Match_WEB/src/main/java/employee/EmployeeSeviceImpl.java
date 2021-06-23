package employee;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EmployeeSeviceImpl implements EmployeeService {
	@Autowired private EmployeeDAO dao;
	
	@Override
	public List<EmployeeVO> employee_list() {
		
		return dao.employee_list();
	}

	@Override
	public List<EmployeeVO> employee_list(String depts) {
		// TODO Auto-generated method stub
		return dao.employee_list(depts);
	}

	@Override
	public EmployeeVO employee_detail(int id) {
		// TODO Auto-generated method stub
		return dao.employee_detail(id);
	}

	@Override
	public List<DepartmentVO> employee_department() {
		// TODO Auto-generated method stub
		return dao.employee_department();
	}

	@Override
	public List<HashMap<String, Object>> department() {
		return dao.department();
	}

	@Override
	public List<HashMap<String, Object>> hirement_year() {
		return dao.hirement_year();
	}

	@Override
	public List<HashMap<String, Object>> hirement_month() {
		return dao.hirement_month();
	}

	@Override
	public List<HashMap<String, Object>> hirement_top3_year() {
		return dao.hirement_top3_year();
	}

	@Override
	public List<HashMap<String, Object>> hirement_top3_month() {
		return dao.hirement_top3_month();
	}

}
