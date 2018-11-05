package lecture.svc;
import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.LectureDAO;
import lecture.vo.LectureBean;
public class LectureViewService {
	public LectureBean getLecture(String viewId) {
		
		Connection con = getConnection();
		
		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		LectureBean lecture = lectureDAO.selectLecture(viewId);
		close(con);
		return lecture;
	}
}
