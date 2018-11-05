package lecture.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.LectureDAO;

public class LectureDeleteService {
	public int deleteLecture(String deleteId) {
		Connection con = getConnection();
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);

		int deleteCount = lectureDAO.deleteLecture(deleteId);

		// >0을 ==1로 변경함. 하나만 삭제되어야 하니까..
		if (deleteCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return deleteCount;
	}
}
