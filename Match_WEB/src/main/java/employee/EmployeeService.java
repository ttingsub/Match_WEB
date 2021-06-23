package employee;

 

import java.util.HashMap;
import java.util.List;

 

public interface EmployeeService {

	List<EmployeeVO> employee_list(); //사원목록조회
	List<EmployeeVO> employee_list(String depts); //사원목록조회(부서목록을선택한경우)	
	EmployeeVO employee_detail(int id);//사원상세조회
	List<DepartmentVO> employee_department(); //부서목록조회
	
	//시각화
	List<HashMap<String, Object>> department(); //부서별사원수 조회
	List<HashMap<String, Object>> hirement_year();   //년도별 채용인원수 조회
	List<HashMap<String, Object>> hirement_month();   //월별 채용인원수 조회
	List<HashMap<String, Object>> hirement_top3_year();   //TOP3부서별 년도별 채용인원수 조회
	List<HashMap<String, Object>> hirement_top3_month();   //TOP3부서별 월별 채용인원수 조회
}