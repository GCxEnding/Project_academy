package teacher.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.LectureDAO;
import dao.TeacherDAO;
import lecture.vo.LectureBean;
import student.vo.StudentBean;

public class TeacherMyStudentService {
	public ArrayList<StudentBean> getLectureList(String lecCode) {
		Connection con = getConnection();

		//lec_selectStudentList() 
		
		TeacherDAO teacherDAO = TeacherDAO.getInstance();
		teacherDAO.setConnection(con);
		ArrayList<StudentBean> studentList = teacherDAO.lec_selectStudentList(lecCode);
		close(con);
		return studentList;
	}
}
