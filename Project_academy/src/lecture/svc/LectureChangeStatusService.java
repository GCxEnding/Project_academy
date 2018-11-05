package lecture.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.LectureDAO;

public class LectureChangeStatusService {
	public int changeStatus(String status, String[] status_ID, String status_code) {
		boolean changeResult = false;
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);

		int changeCount = lectureDAO.changeStatus(status, status_ID, status_code);

		// >0을 ==1로 변경함. 하나만 삭제되어야 하니까..
		if (changeCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return changeCount;
	}
}
