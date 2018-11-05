package lecture.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.LectureDAO;
import lecture.vo.LectureRatingBean;

public class LectureRatingService {
	public boolean ratingLecture(LectureRatingBean lecture) {
		boolean ratingSuccess = false;
		LectureDAO lectureDAO = LectureDAO.getInstance();
		Connection con = getConnection();
		lectureDAO.setConnection(con);
		
		//점수를 등록하면 강의에 저장된 평점도 업데이트 시킴
		int ratingCount = lectureDAO.ratingLecture(lecture);
		if((ratingCount) == 1 ) {
			ratingSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return ratingSuccess;
	}
	
	public boolean updateLectureRating(LectureRatingBean lecture) {
		boolean ratingSuccess = false;
		LectureDAO lectureDAO = LectureDAO.getInstance();
		Connection con = getConnection();
		lectureDAO.setConnection(con);
		
		//점수를 등록하면 강의에 저장된 평점도 업데이트 시킴
		int ratingCount = lectureDAO.updateLectureRating(lecture);
		if((ratingCount) >0 ) {
			ratingSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return ratingSuccess;
	}
}
