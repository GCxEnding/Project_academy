package teacher.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TeacherDAO;
import teacher.vo.TeacherBean;

public class TeacherListService {
	public ArrayList<TeacherBean> getTeacherList(){
		Connection con = getConnection();
		
		TeacherDAO teacherDAO = TeacherDAO.getInstance();
		teacherDAO.setConnection(con);
		ArrayList<TeacherBean> teacherList = teacherDAO.selectTeacherList();
		close(con);
		return teacherList;
	}
}
