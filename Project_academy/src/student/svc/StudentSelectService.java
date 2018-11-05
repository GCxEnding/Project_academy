package student.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.StudentDAO;
import student.vo.StudentBean;

public class StudentSelectService {

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
