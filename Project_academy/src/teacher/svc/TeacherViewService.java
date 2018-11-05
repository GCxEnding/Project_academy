package teacher.svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.TeacherDAO;
import teacher.vo.TeacherBean;
public class TeacherViewService {
	public TeacherBean getTeacher(String viewId) {
		
		Connection con = getConnection();
		
		TeacherDAO teacherDAO = TeacherDAO.getInstance();
		teacherDAO.setConnection(con);
		TeacherBean teacher = teacherDAO.selectTeacher(viewId);
		close(con);
		return teacher;
	}
}
