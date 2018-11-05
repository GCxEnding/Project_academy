package lecture.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.LectureDAO;

public class LectureSubmitService {
	public int submitLecture(String lectureCode, String studentId) {
		
		Connection con = getConnection();
		int submitCount=0;
		
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		submitCount = lectureDAO.submitLecture(lectureCode,studentId);
	
		
		
		if(submitCount == 1) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return submitCount;
	}
}
