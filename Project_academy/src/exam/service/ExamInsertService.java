package exam.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ExamDAO;
import dao.LectureDAO;

public class ExamInsertService {
	public boolean insertExam(int point, String student_ID, String lecCode) {
		boolean insertSuccess = false;
		ExamDAO examDAO = ExamDAO.getInstance();
		Connection con = getConnection();
		examDAO.setConnection(con);
		int updateCount = examDAO.insertExamPoint(point,student_ID,lecCode);
		System.out.println("StudentUpdateService's updatecount: "+updateCount);
		
		
		int insertCount=0;
		
		if (insertCount > 0) {
			insertSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return insertSuccess;
	}
	
	
	public boolean updateExam(int point, String student_ID, String lecCode) {
		boolean updateSuccess = false;
		ExamDAO examDAO = ExamDAO.getInstance();
		Connection con = getConnection();
		examDAO.setConnection(con);
		
		int updateCount = examDAO.insertExamPoint(point,student_ID,lecCode);
		System.out.println("StudentUpdateService's updatecount: "+updateCount);
		
		
		if (updateCount > 0) {
			updateSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return updateSuccess;
	}

}
