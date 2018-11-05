package student.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.StudentDAO;
import student.vo.StudentBean;

public class StudentListService {

	public ArrayList<StudentBean> getStudentList() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		StudentDAO studentDAO = StudentDAO.getInstance();
		studentDAO.setConnection(con);
		ArrayList<StudentBean> studentList = studentDAO.selectStudentList();
		close(con);
		return studentList;
	}
}
