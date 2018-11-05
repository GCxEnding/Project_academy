/*
 * 학생 ID 또는 강사 ID를 받아서 서로 다른 DAO의 메소드를 실행 시킬것임.
 */

package lecture.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.LectureDAO;
import lecture.vo.LectureBean;

public class LectureMyLectureService {
	public ArrayList<LectureBean> getLectureList(String MyID) {
		Connection con = getConnection();

		LectureDAO lectureDAO = LectureDAO.getInstance();
		lectureDAO.setConnection(con);
		ArrayList<LectureBean> lectureList = lectureDAO.SubmitLectureList(MyID);
		close(con);
		return lectureList;
	}
}
