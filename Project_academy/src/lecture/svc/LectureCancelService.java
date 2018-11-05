package lecture.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.LectureDAO;

public class LectureCancelService {
	public boolean cancelLecture(String sessionID, String cancelCode) {
		boolean cancelResult = false;
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);

		int cancelCount = lectureDAO.cancelLecture(sessionID, cancelCode);

		// >0을 ==1로 변경함. 하나만 삭제되어야 하니까..
		if (cancelCount == 1) {
			cancelResult = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return cancelResult;
	}
}
