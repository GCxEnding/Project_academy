package lecture.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.LectureDAO;
import lecture.vo.LectureBean;

public class LectureCreateService {
	public boolean createLecture(LectureBean lecture) {
		boolean createSuccess = false;
		LectureDAO lectureDAO = LectureDAO.getInstance();
		Connection con = getConnection();
		lectureDAO.setConnection(con);
		int insertCount = lectureDAO.insertLecture(lecture);
		
		if (insertCount > 0) {
			createSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return createSuccess;

	}

}
