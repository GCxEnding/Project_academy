package teacher.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.TeacherDAO;

public class TeacherDeleteService {
	public boolean deleteTeacher(String deleteId) {
		boolean deleteResult = false;
		Connection con = getConnection();
		TeacherDAO teacherDAO = TeacherDAO.getInstance();
		teacherDAO.setConnection(con);

		int deleteCount = teacherDAO.deleteTeacher(deleteId);

		//여러 데이터들이 삭제 될 수 있음.
		if (deleteCount > 0) {
			deleteResult = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return deleteResult;
	}
}
