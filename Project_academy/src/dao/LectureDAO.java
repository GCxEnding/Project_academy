package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import javax.sql.DataSource;

import lecture.vo.LectureBean;
import lecture.vo.LectureRatingBean;

public class LectureDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	private static LectureDAO lectureDAO;

	private LectureDAO() {
		// TODO Auto-generated constructor stub
	}

	public static LectureDAO getInstance() {
		if (lectureDAO == null) {
			lectureDAO = new LectureDAO();
		}
		return lectureDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//학생용 : 내 강의 리스트에서 내 아이디랑 내가 신청한 강의코드를 삭제시킴.
	public int cancelLecture(String sessionID, String cancelCode) {

		String sql = "DELETE from lecture_submit_list WHERE submit_id=? and submit_lecture_code=?";
		int cancelCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sessionID);
			pstmt.setString(2, cancelCode);
			cancelCount = pstmt.executeUpdate();
			
			//강의가 사라졌으면 학생 수도 업데이트를 함
			if(cancelCount == 1) {
				sql = "UPDATE lecture_info SET lecture_student_current = lecture_student_current-1 where lecture_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cancelCode);
				int temp=pstmt.executeUpdate();
				System.out.println("submitLecture의 temp :" +temp);
			}
		} catch (Exception ex) {
			System.out.println("cancelLecture 에러: " + ex);
		} finally {
			close(pstmt);
		}

		return cancelCount;
	}
	
	//관리자용 : 새로운 강의를 등록
	public int insertLecture(LectureBean lecture) {
		String sql = "INSERT INTO lecture_info VALUES " + "(?,?,?,?,?," + "?,?,?,?,?," + "?,?,?,?,?,?)";
		int insertCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lecture.getLecture_code());
			pstmt.setString(2, lecture.getLecture_teacher_id());
			pstmt.setString(3, lecture.getLecture_name());
			pstmt.setString(4, lecture.getLecture_teacher_name());
			pstmt.setString(5, lecture.getLecture_intro());

			pstmt.setInt(6, lecture.getLecture_student_current());
			pstmt.setInt(7, lecture.getLecture_student_limit());
			pstmt.setDate(8, lecture.getLecture_start_period());
			pstmt.setDate(9, lecture.getLecture_end_period());
			pstmt.setInt(10, lecture.getLecture_cost());

			pstmt.setString(11, lecture.getLecture_type());
			pstmt.setTime(12, lecture.getLecture_start_time());
			pstmt.setTime(13, lecture.getLecture_end_time());
			pstmt.setDouble(14, lecture.getLecture_rating());
			pstmt.setInt(15, 0);
			pstmt.setString(16, lecture.getLecture_image());
			
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("insertLecture 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
	
	//공개 : 강의 정보를 살펴봄.
	public LectureBean selectLecture(String id) {
		String sql = "SELECT * FROM lecture_info WHERE lecture_code=?";
		LectureBean lec = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				lec = new LectureBean();
				lec.setLecture_code(rs.getString("lecture_code"));
				lec.setLecture_teacher_id(rs.getString("lecture_teacher_id"));
				lec.setLecture_name(rs.getString("lecture_name"));
				lec.setLecture_teacher_name(rs.getString("lecture_teacher_name"));
				lec.setLecture_intro(rs.getString("lecture_intro"));

				lec.setLecture_student_current(rs.getInt("lecture_student_current"));
				lec.setLecture_student_limit(rs.getInt("lecture_student_limit"));
				lec.setLecture_start_period(rs.getDate("lecture_start_period"));
				lec.setLecture_end_period(rs.getDate("lecture_end_period"));
				lec.setLecture_cost(rs.getInt("lecture_cost"));

				lec.setLecture_type(rs.getString("lecture_type"));
				lec.setLecture_start_time(rs.getTime("lecture_start_time"));
				lec.setLecture_end_time(rs.getTime("lecture_end_time"));
				lec.setLecture_rating(rs.getDouble("lecture_rating"));
				lec.setLecture_image(rs.getString("lecture_image"));
			}
		} catch (Exception ex) {
			System.out.println("selectLecture 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return lec;
	}
	
	
	//강의 평가, 반환은 무조건 1
	public int ratingLecture(LectureRatingBean lecture) {
		String sql = "INSERT INTO lecture_rating VALUES(?,?,?,?)";
		int ratingCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, lecture.getLecture_rating_lec_code());
			pstmt.setString(2, lecture.getLecture_rating_st_id());
			pstmt.setString(3, lecture.getLecture_rating_teacher_id());
			pstmt.setDouble(4, lecture.getLecture_rating_score());
			
			ratingCount = pstmt.executeUpdate();
		}catch (Exception ex) {
			System.out.println("ratingLecture 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return ratingCount;
	}
	
	//강의 평점 테이블에서 특정 강의에 대한 평균을 구해서 lecture_info를 업데이트한다.
	public int updateLectureRating(LectureRatingBean lecture) {
		int ratingCount = 0;
		String sql = "SELECT AVG (lecture_rating_score) as lecture_rating_score "
				+ "FROM lecture_rating WHERE lecture_rating_lec_code=?";
		//lecture_rating 테이블에서 score의 평균을 구함.
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lecture.getLecture_rating_lec_code());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sql = "update lecture_info SET lecture_rating=? WHERE lecture_code=?";
				//받아온 점수로 강의정보의 점수를 업데이트 한다.
				pstmt = con.prepareStatement(sql);
				pstmt.setDouble(1, rs.getDouble("lecture_rating_score"));
				pstmt.setString(2, lecture.getLecture_rating_lec_code());
				
				ratingCount = pstmt.executeUpdate();
			}
			
			
		}catch (Exception ex) {
			System.out.println("updateLectureRating 에러: " + ex);
		} finally {
			close(pstmt);
			close(rs);
		}
		return ratingCount;
	}
	
	
	
	
	
	

	/*
	 * 강의 목록 페이지를 불러올 메소드 코드,강의명,강사이름,소개, 현재정원,최대정원,시작기간,끝난ㄴ 기간,
	 * 비용,종류,시작시간,끝나는시간,평가도만 보여줌. 한개씩 가져와서 ArrayList에 잡아넣고 반환한다
	 * id의 사용 용도는 강사가 자신의 강의만 집어서 볼때 보여줄 용도로 사용함
	 */
	public ArrayList<LectureBean> selectLectureList(String id) {
		String sql = "SELECT * FROM lecture_info";
		ArrayList<LectureBean> lectureList = new ArrayList<LectureBean>();
		LectureBean lec = null;
		try {
			if (id == null) { //학생이 강의 목록을 볼때
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}else { //강사가 자신의 강의 목록을 볼때
				sql += " where lecture_teacher_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
			}

			if (rs.next()) {
				do {
					lec = new LectureBean();
					lec.setLecture_code(rs.getString("lecture_code"));
					lec.setLecture_name(rs.getString("lecture_name"));
					lec.setLecture_teacher_id(rs.getString("lecture_teacher_id"));
					lec.setLecture_teacher_name(rs.getString("lecture_teacher_name"));
					lec.setLecture_intro(rs.getString("lecture_intro"));

					lec.setLecture_student_current(rs.getInt("lecture_student_current"));
					lec.setLecture_student_limit(rs.getInt("lecture_student_limit"));
					lec.setLecture_start_period(rs.getDate("lecture_start_period"));
					lec.setLecture_end_period(rs.getDate("lecture_end_period"));

					lec.setLecture_cost(rs.getInt("lecture_cost"));
					lec.setLecture_type(rs.getString("lecture_type"));
					lec.setLecture_start_time(rs.getTime("lecture_start_time"));
					lec.setLecture_end_time(rs.getTime("lecture_end_time"));
					lec.setLecture_rating(rs.getDouble("lecture_rating"));
					lec.setLecture_image(rs.getString("lecture_image"));
					lectureList.add(lec);
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("selectLectureList 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return lectureList;
	}

	//강의 정보와 강의 신청 목록에서 같은 강의코드를 가진것을 모두 선택해서 배열에 담는 메소드
	//현재는 중간에 쿼리문이 한번 변경되고 새로운 데이터를 가져와서 담는다	
	
	/*
	 * 학생에게 필요한 강의정보들을 골라서 담기때문에 다소 길다.
	 * (강사정보 RIGHT JOIN 강의신청리스트) 형태이고 두 테이블에서 강의 코드가 같은것만 가져오며 submit_id의 리스트만 뽑아준다.
	 * right join : 우측에 있는 테이블이 왼쪽에 있는 테이블에게서 필요한 것만 가져옴
	 */
	public ArrayList<LectureBean> SubmitLectureList(String id) {
		String sql = "SELECT submit_id, submit_lecture_code, lecture_name, submit_state, submit_payment,"
			+"lecture_teacher_id, lecture_teacher_name, lecture_intro, lecture_student_current,"
			+"lecture_student_limit, lecture_start_period, lecture_end_period,"
			+"lecture_cost, lecture_start_time,lecture_end_time,lecture_image "
			+"FROM lecture_info RIGHT JOIN lecture_submit_list ON "
			+"lecture_info.lecture_code = lecture_submit_list.submit_lecture_code where submit_id=?";
	
		ArrayList<LectureBean> lectureList = new ArrayList<LectureBean>();
		LectureBean lec = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				do {	
					lec = new LectureBean();
					lec.setSubmit_id(rs.getString("submit_id"));//학생 아이디
					lec.setLecture_code(rs.getString("submit_lecture_code"));
					lec.setLecture_name(rs.getString("lecture_name"));
					lec.setSubmit_state(rs.getString("submit_state"));
					lec.setSubmit_payment(rs.getBoolean("submit_payment"));
					
					lec.setLecture_teacher_id(rs.getString("lecture_teacher_id"));
					lec.setLecture_teacher_name(rs.getString("lecture_teacher_name"));
					lec.setLecture_intro(rs.getString("lecture_intro"));
					lec.setLecture_student_current(rs.getInt("lecture_student_current"));
					
					lec.setLecture_student_limit(rs.getInt("lecture_student_limit"));
					lec.setLecture_start_period(rs.getDate("lecture_start_period"));
					lec.setLecture_end_period(rs.getDate("lecture_end_period"));

					lec.setLecture_cost(rs.getInt("lecture_cost"));
					lec.setLecture_start_time(rs.getTime("lecture_start_time"));
					lec.setLecture_end_time(rs.getTime("lecture_end_time"));
					lec.setLecture_image(rs.getString("lecture_image"));
					lectureList.add(lec);
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("SubmitLectureList 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return lectureList;
	}
	
	
	//08.23
	//관리자용 : 학생의 입금을 확인하고 데이터를 수정함
	//ex) 수강신청 -> 수강등록완료 등으로.
	
	//ID와 CODE를 받아서 일괄적으로 업데이트 하는 메소드
	public int changeStatus(String status, String[] status_ID, String status_code) {
		String sql = "UPDATE lecture_submit_list SET submit_state=? "
				   + "WHERE submit_id=? AND submit_lecture_code=?";
		int changeCount = 0;
		System.out.println("LectureDAO의 changeStatus :"+status );
		try {
			pstmt = con.prepareStatement(sql);
			for(int i=0; i<status_ID.length; i++) {
				pstmt.setString(1, status);
				pstmt.setNString(2, status_ID[i]);
				pstmt.setString(3, status_code);
				changeCount = pstmt.executeUpdate();
				} 
		} catch (Exception ex) {
			System.out.println("changeStatus 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return changeCount;
	}
	/*
	lec.setLecture_name(rs.getString("lecture_name"));
	lec.setLecture_name(rs.getString("lecture_teacher_name"));

	lec.setLecture_student_current(rs.getInt("lecture_student_current"));
	lec.setLecture_student_limit(rs.getInt("lecture_student_limit"));
	lec.setLecture_start_period(rs.getDate("lecture_start_period"));
	lec.setLecture_end_period(rs.getDate("lecture_end_period"));

	lec.setLecture_cost(rs.getInt("lecture_cost"));
	lec.setLecture_type(rs.getString("lecture_type"));
	lec.setLecture_start_time(rs.getTime("lecture_start_time"));
	lec.setLecture_end_time(rs.getTime("lecture_end_time"));
	lec.setLecture_rating(rs.getDouble("lecture_rating"));
	
*/
	

	//관리자용 : 강의 정보를 수정
	public int updateLecture(LectureBean lecture) {

		String sql = "UPDATE lecture_info SET " 
				+ "lecture_teacher_id=?, lecture_name=?,lecture_teacher_name=?,"
				+ "lecture_intro=?, lecture_student_limit=?, lecture_start_period=?,"
				+ "lecture_end_period=?,lecture_cost=?,lecture_type=?,"
				+ "lecture_start_time=?,lecture_end_time=? WHERE lecture_code=?";

		String sql2 = "UPDATE lecture_info SET " 
				+ "lecture_teacher_id=?, lecture_name=?,lecture_teacher_name=?,"
				+ "lecture_intro=?, lecture_student_limit=?, lecture_start_period=?,"
				+ "lecture_end_period=?,lecture_cost=?,lecture_type=?,"
				+ "lecture_start_time=?,lecture_end_time=?, lecture_image =? WHERE "
				+ "lecture_code=?";
		int updateCount = 0;
		try {
			if(lecture.getLecture_image().equals("")) {
				pstmt = con.prepareStatement(sql);
				System.out.println("첫번째 sql");
				pstmt.setString(1, lecture.getLecture_teacher_id());
				pstmt.setString(2, lecture.getLecture_name());
				pstmt.setString(3, lecture.getLecture_teacher_name());

				pstmt.setString(4, lecture.getLecture_intro());
				pstmt.setInt(5, lecture.getLecture_student_limit());
				pstmt.setDate(6, lecture.getLecture_start_period());
				
				pstmt.setDate(7, lecture.getLecture_end_period());
				pstmt.setInt(8, lecture.getLecture_cost());
				pstmt.setString(9, lecture.getLecture_type());
				
				pstmt.setTime(10, lecture.getLecture_start_time());
				pstmt.setTime(11, lecture.getLecture_end_time());
				pstmt.setString(12, lecture.getLecture_code());
			}
			else {
				pstmt = con.prepareStatement(sql2);
				System.out.println("두번째 sql");
				pstmt.setString(1, lecture.getLecture_teacher_id());
				pstmt.setString(2, lecture.getLecture_name());
				pstmt.setString(3, lecture.getLecture_teacher_name());
	
				pstmt.setString(4, lecture.getLecture_intro());
				pstmt.setInt(5, lecture.getLecture_student_limit());
				pstmt.setDate(6, lecture.getLecture_start_period());
				
				pstmt.setDate(7, lecture.getLecture_end_period());
				pstmt.setInt(8, lecture.getLecture_cost());
				pstmt.setString(9, lecture.getLecture_type());
				
				pstmt.setTime(10, lecture.getLecture_start_time());
				pstmt.setTime(11, lecture.getLecture_end_time());
				pstmt.setString(12, lecture.getLecture_image());
				pstmt.setString(13, lecture.getLecture_code());
			}
			
			updateCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateLecture 에러: " + ex);
		} finally {

			close(pstmt);
		}
		return updateCount;
	}

	//관리자용 : 강의를 삭제
	public int deleteLecture(String deleteId) {
		String sql = "DELETE from lecture_info WHERE lecture_code=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deleteId);
			deleteCount = pstmt.executeUpdate();
			
			sql = "DELETE from lecture_submit_list WHERE submit_lecture_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deleteId);
			deleteCount += pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteLecture 에러: " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;
	}

	//학생용 : 강의를 신청할때 사용함
	//먼저 강의 정보에 이 코드가 있는지 확인하고 나서 강의 신청 리스트에 데이터를 넣는다.
	public int submitLecture(String lectureCode, String studentId) {
		String sql = "SELECT lecture_code FROM lecture_info WHERE lecture_code = ?";
		int submitCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lectureCode);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				//위에서 수강 코드를 찾았다면 수강신청 테이블에 등록하는 부분
				//수강 신청 리스트 테이블에 코드,학생ID만 넣음. 입금여부나 신청상태는 기본값이 적용됨.
				sql = "INSERT INTO lecture_submit_list (submit_lecture_code, submit_id)"
						+ "VALUES (?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rs.getString("lecture_code"));
				pstmt.setString(2, studentId);
				submitCount = pstmt.executeUpdate(); //true로 사용, 1이 반환되어야 정상
				
				if(submitCount == 1) {
					//강의 정보의 학생수에서 학생수를 1명 증가시킴
					sql = "UPDATE lecture_info SET lecture_student_current = lecture_student_current+1 where lecture_code=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, lectureCode);
					int temp=pstmt.executeUpdate();
					System.out.println("submitLecture의 temp :" +temp);
				}
			}
		} catch (SQLIntegrityConstraintViolationException ex) {
			return 2; //중복 강의 신청 
		} catch (Exception ex) {
			System.out.println("submitLecture 에러: " + ex);
			ex.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return submitCount;
	}
	

 

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
}