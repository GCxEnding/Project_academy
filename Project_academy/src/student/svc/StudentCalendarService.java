package student.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.StudentDAO;
import student.vo.StudentAttendBean;

public class StudentCalendarService {
	public ArrayList<StudentAttendBean> getAttendList() {
		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		studentDAO.setConnection(con);
		ArrayList<StudentAttendBean> AttendList = studentDAO.selectCalenderList();
		close(con);
		return AttendList;
	}
}
