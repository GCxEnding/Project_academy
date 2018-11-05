package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import lecture.vo.LectureBean;

public class ExamDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	private static ExamDAO examDAO;

	private ExamDAO() {
		// TODO Auto-generated constructor stub
	}

	public static ExamDAO getInstance() {
		if (examDAO == null) {
			examDAO = new ExamDAO();
		}
		return examDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	
	public int insertExamPoint(int point, String student_ID, String lecCode){
		String sql = "INSERT INTO exam_info VALUES " + "(?,?,?,?,?," + "?,?,?,?,?," + "?,?,?,?)";
		int insertCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			//pstmt.setString(1, lecture.getLecture_code());
			//insertCount = pstmt.executeQuery();

		} catch (Exception ex) {
			System.out.println("insertLecture 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
	
	
	public int updatexamPoint(int point, String student_ID, String lecCode){
		String sql = "INSERT INTO lecture_info VALUES " + "(?,?,?,?,?," + "?,?,?,?,?," + "?,?,?,?)";
		int insertCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			//pstmt.setString(1, lecture.getLecture_code());
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("insertLecture 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
}