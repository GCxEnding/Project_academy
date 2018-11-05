package lecture.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.LectureDAO;
import lecture.vo.LectureBean;

public class LectureListService {
	public ArrayList<LectureBean> getLectureList(String id) {
		Connection con = getConnection();

		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		ArrayList<LectureBean> lectureList = lectureDAO.selectLectureList(id);
		close(con);
		return lectureList;
	}
}
