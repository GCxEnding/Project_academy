package student.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.StudentDAO;
import student.vo.StudentBean;

public class StudentLoginService {

	public boolean login(StudentBean student) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		studentDAO.setConnection(con);
		boolean loginResult = false;
		String loginId = studentDAO.selectLoginId(student);
		if(loginId != null){
			loginResult = true;
		}
		close(con);
		return loginResult;
	}

}
