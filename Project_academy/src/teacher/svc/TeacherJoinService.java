package teacher.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.TeacherDAO;
import teacher.vo.TeacherBean;

public class TeacherJoinService {
	public boolean joinTeacher(TeacherBean teacher) {
		boolean joinSuccess = false;
		TeacherDAO teacherDAO = TeacherDAO.getInstance();
		Connection con = getConnection();
		teacherDAO.setConnection(con);
		int insertCount = teacherDAO.insertTeacher(teacher);
		System.out.println("TeacherJoinService : ");
		if(insertCount>0) {
			joinSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return joinSuccess;
	}
}
