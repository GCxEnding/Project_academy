package lecture.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.LectureDAO;
import lecture.vo.LectureBean;

public class LectureUpdateService {
	public boolean updateLecture(LectureBean lecture) {
		boolean updateSuccess = false;
		LectureDAO lectureDAO = LectureDAO.getInstance();
		Connection con = getConnection();
		lectureDAO.setConnection(con);
		int updateCount = lectureDAO.updateLecture(lecture);
		System.out.println("LectureUpdateService's updatecount: "+updateCount);
		
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
