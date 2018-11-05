package student.svc;

import student.vo.StudentBean;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.StudentDAO;

public class StudentViewService {
	public StudentBean getStudent(String viewId) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		studentDAO.setConnection(con);
		StudentBean student = studentDAO.selectStudent(viewId);
		close(con);
		return student;
	}
}
