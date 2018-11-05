package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import student.vo.StudentAttendBean;
import student.vo.StudentBean;

public class StudentDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	private static StudentDAO studentDAO;

	private StudentDAO() {
		// TODO Auto-generated constructor stub
	}

	public static StudentDAO getInstance() {
		if (studentDAO == null) {
			studentDAO = new StudentDAO();
		}
		return studentDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 출석상태 집어오기
	public String selectStateAttend(String id, Date date) {
		String state = null;

		String sql = "select attendance_state from attendance_info where attendance_student_id =?, attendance_date=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setDate(2, (java.sql.Date) date);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				state = rs.getString("attendance_state");
			}
		} catch (Exception ex) {
			System.out.println("selectStateAttend 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return state;
	}

	public int insertAttendStudent(StudentAttendBean student) {
		String sql = "insert into attendance_info values " + "(?,?,?,?," + "?,?,?)";
		int insertAttendCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1, (java.sql.Date) student.getAttendance_date());
			pstmt.setString(2, student.getAttendance_student_id());
			pstmt.setString(3, student.getAttendance_lec_code());
			pstmt.setString(4, student.getAttendance_state());
			pstmt.setString(5, student.getAttendance_entrance());
			pstmt.setString(6, student.getAttendance_exit());
			pstmt.setString(7, student.getAttendance_reason());

			insertAttendCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("insertAttendStudent 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return insertAttendCount;
	}

	public int updateAttendStudent(StudentAttendBean student) {
		String sql = "update attendance_info set attendance_state=?, attendance_exit=?"
				+ " where attendance_student_id=? and attendance_date=?";
		int updateAttendCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, student.getAttendance_state());
			pstmt.setString(2, student.getAttendance_exit());
			pstmt.setString(3, student.getAttendance_student_id());
			pstmt.setDate(4, (java.sql.Date) student.getAttendance_date());

			updateAttendCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateAttendStudent 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return updateAttendCount;
	}

	// 달력에 데이터 집어오기
	public StudentAttendBean selectCalender(String id) {
		String sql = "select * from attendance_info where attendance_student_id=?";

		StudentAttendBean sab = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sab = new StudentAttendBean();
				sab.setAttendance_student_id(rs.getString("attendance_student_id"));
				sab.setAttendance_date(rs.getDate("attendance_date"));
				sab.setAttendance_entrance(rs.getString("attendance_entrance"));
				sab.setAttendance_exit(rs.getString("attendance_exit"));
				sab.setAttendance_lec_code(rs.getString("attendance_lec_code"));
				sab.setAttendance_reason(rs.getString("attendance_reason"));
				sab.setAttendance_state(rs.getString("attendance_state"));

			}
		} catch (Exception ex) {
			System.out.println("getCalenderStudent 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return sab;
	}
	
	public ArrayList<StudentAttendBean> selectCalenderList(){
		String sql="SELECT * FROM attendance_info";
		ArrayList<StudentAttendBean> AttendList=new ArrayList<StudentAttendBean>();
		StudentAttendBean st = null;
		try{
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
					st=new StudentAttendBean();
					st.setAttendance_student_id(rs.getString("attendance_student_id"));
					st.setAttendance_date(rs.getDate("attendance_date"));
					st.setAttendance_entrance(rs.getString("attendance_entrance"));
					st.setAttendance_exit(rs.getString("attendance_exit"));
					st.setAttendance_state(rs.getString("attendance_state"));
					
					AttendList.add(st);
				}while(rs.next());
			}
		}catch(Exception ex){
			System.out.println("selectCalenderList 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return AttendList;
	}

	public String selectLoginId(StudentBean student) {
		String loginId = null;
		String sql = "SELECT student_id FROM student_info WHERE student_id=? AND student_password=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, student.getStudent_id());
			pstmt.setString(2, student.getStudent_password());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				loginId = rs.getString("student_id");

			}
		} catch (Exception ex) {
			System.out.println("selectLoginId 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return loginId;
	}

	public int insertStudent(StudentBean student) {
		String sql = "INSERT INTO student_info VALUES " + "(?,?,?,?," + "?,?,?,?," + "?,?,?,?," + "?,?,?)";
		int insertCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(student.getStudent_name());
			pstmt.setString(1, student.getStudent_id());
			pstmt.setString(2, student.getStudent_password());
			pstmt.setString(3, student.getStudent_name());
			pstmt.setString(4, student.getStudent_first_address());

			pstmt.setString(5, student.getStudent_second_address());
			pstmt.setString(6, student.getStudent_postcode());
			pstmt.setString(7, student.getStudent_phone_number());
			pstmt.setString(8, student.getStudent_gender());

			pstmt.setString(9, student.getStudent_birthday());
			pstmt.setString(10, student.getStudent_email());
			pstmt.setString(11, student.getStudent_image());
			pstmt.setString(12, student.getStudent_introduction());
			// 아래부터는 학생이 입력할수 없는 부분이므로 강제 값 삽입
			pstmt.setInt(13, 0); // 수강료
			pstmt.setString(14, "");
			pstmt.setString(15, "");

			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("insertStudent 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}

	// 수정를 눌렀을때 해당 id의 나머지 정보를 받아서 studentBean에 담아서 return 하는 메소드
	// updateFormService에서 사용
	// viewService에서 사용
	public StudentBean selectStudent(String id) {
		String sql = "SELECT * FROM student_info WHERE student_id=?";
		StudentBean st = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				st = new StudentBean();
				st.setStudent_id(rs.getString("student_id"));
				st.setStudent_password(rs.getString("student_password"));
				st.setStudent_name(rs.getString("student_name"));
				st.setStudent_first_address(rs.getString("student_first_address"));
				st.setStudent_second_address(rs.getString("student_second_address"));

				st.setStudent_postcode(rs.getString("student_postcode"));
				st.setStudent_phone_number(rs.getString("student_phone_number"));
				st.setStudent_gender(rs.getString("student_gender"));
				st.setStudent_birthday(rs.getString("student_birthday"));
				st.setStudent_email(rs.getString("student_email"));

				st.setStudent_image(rs.getString("student_image"));
				st.setStudent_introduction(rs.getString("student_introduction"));
				//st.setStudent_grade_point(rs.getInt("student_grade_point"));
				st.isStudent_payment();
				st.setStudent_consult(rs.getString("student_consult"));
				st.setStudent_teacher_memo(rs.getString("student_teacher_memo"));

			}
		} catch (Exception ex) {
			System.out.println("getDetailStudent 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return st;
	}

	public int updateStudent(StudentBean student) {
		String sql = "UPDATE student_info set " + "student_password=?, student_name=?,"
				+ "student_first_address=?,student_second_address=?, student_postcode=?,"
				+ "student_phone_number=?,student_gender=?, student_birthday=?,"
				+ "student_email=?,student_image=?, student_introduction=?,"
				+ "student_payment=?, student_consult=?,student_teacher_memo=?"
				+ " where student_id=?";
		
		String sql2 = "UPDATE student_info set " + "student_password=?, student_name=?,"
				+ "student_first_address=?,student_second_address=?, student_postcode=?,"
				+ "student_phone_number=?,student_gender=?, student_birthday=?,"
				+ "student_email=?, student_introduction=?,"
				+ "student_payment=?, student_consult=?,student_teacher_memo=?"
				+ " where student_id=?";
		
		System.out.println("updateStudent의 학생id" + student.getStudent_id());
		int updateCount = 0;
		try {
			if(student.getStudent_image().equals("")) {
				pstmt = con.prepareStatement(sql2);
				
				pstmt.setString(1, student.getStudent_password());
				pstmt.setString(2, student.getStudent_name());
				pstmt.setString(3, student.getStudent_first_address());
				pstmt.setString(4, student.getStudent_second_address());
	
				pstmt.setString(5, student.getStudent_postcode());
				pstmt.setString(6, student.getStudent_phone_number());
				pstmt.setString(7, student.getStudent_gender());
				pstmt.setString(8, student.getStudent_birthday());
				pstmt.setString(9, student.getStudent_email());
	
				pstmt.setString(10, student.getStudent_introduction());
				pstmt.setBoolean(11, student.isStudent_payment());
				pstmt.setString(12, student.getStudent_consult());
				pstmt.setString(13, student.getStudent_teacher_memo());
	
				pstmt.setString(14, student.getStudent_id());
				
			}
			else {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, student.getStudent_password());
				pstmt.setString(2, student.getStudent_name());
				pstmt.setString(3, student.getStudent_first_address());
				pstmt.setString(4, student.getStudent_second_address());
	
				pstmt.setString(5, student.getStudent_postcode());
				pstmt.setString(6, student.getStudent_phone_number());
				pstmt.setString(7, student.getStudent_gender());
				pstmt.setString(8, student.getStudent_birthday());
				pstmt.setString(9, student.getStudent_email());
	
				pstmt.setString(10, student.getStudent_image());
				pstmt.setString(11, student.getStudent_introduction());
			//	pstmt.setInt(12, student.getStudent_grade_point());
				pstmt.setBoolean(12, student.isStudent_payment());
				pstmt.setString(13, student.getStudent_consult());
				pstmt.setString(14, student.getStudent_teacher_memo());
	
				pstmt.setString(15, student.getStudent_id());
			}

			updateCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateStudent 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return updateCount;
	}
	
	public int updateGrade(String student, int a) {
		return 1;
	}

	/*
	 * 강사 목록 페이지를 불러올 메소드 아이디,이름,전화번호,생일(정확히 나이),이메일.이미지,담당과목,직급만 보여줌. 한개씩 가져와서
	 * ArrayList에 잡아넣고 반환한다
	 */
	public ArrayList<StudentBean> selectStudentList() {
		String sql = "SELECT * FROM student_info";
		ArrayList<StudentBean> studentList = new ArrayList<StudentBean>();
		StudentBean st = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					st = new StudentBean();
					st.setStudent_id(rs.getString("student_id"));
					st.setStudent_name(rs.getString("student_name"));
					st.setStudent_phone_number(rs.getString("student_phone_number"));
					st.setStudent_birthday(rs.getString("student_birthday"));
					st.setStudent_email(rs.getString("student_email"));
					st.setStudent_image(rs.getString("student_image"));

					studentList.add(st);
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("selectStudentList 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return studentList;
	}

	public int deleteStudent(String deleteId) {
		String sql = "DELETE from student_info WHERE student_id=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deleteId);
			deleteCount = pstmt.executeUpdate();
			
			sql = "DELETE from lecture_submit_list WHERE submit_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deleteId);
			deleteCount += pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteStudent 에러: " + ex);
		} finally {
			close(pstmt);
		}

		return deleteCount;
	}
}