package teacher.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.TeacherDAO;
import teacher.vo.TeacherBean;

public class TeacherUpdateService {
	public boolean updateTeacher(TeacherBean teacher) {
		boolean updateSuccess = false;
		TeacherDAO teacherDAO = TeacherDAO.getInstance();
		Connection con = getConnection();
		teacherDAO.setConnection(con);
		int updateCount = teacherDAO.updateTeacher(teacher);
		System.out.println("TeacherUpdateService's updatecount: "+updateCount);
		
		if(updateCount == 1) {
			updateSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return updateSuccess;
	}

}
