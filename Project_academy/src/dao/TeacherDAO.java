package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import lecture.vo.LectureBean;
import student.vo.StudentBean;
import teacher.vo.TeacherBean;

public class TeacherDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	private static TeacherDAO teacherDAO;

	private TeacherDAO() {
		// TODO Auto-generated constructor stub
	}

	public static TeacherDAO getInstance() {
		if (teacherDAO == null) {
			teacherDAO = new TeacherDAO();
		}
		return teacherDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	//로그인 메소드
	public TeacherBean selectLoginId(TeacherBean teacher){
		TeacherBean loginInfo = new TeacherBean();
		loginInfo.setTeacher_id("");
		String sql="SELECT TEACHER_ID,TEACHER_NAME FROM teacher_info WHERE TEACHER_ID=? AND TEACHER_PASSWORD=?";
		
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, teacher.getTeacher_id());
			pstmt.setString(2, teacher.getTeacher_password());
			rs = pstmt.executeQuery();
			if(rs.next()){
				loginInfo.setTeacher_id(rs.getString("TEACHER_ID"));
				loginInfo.setTeacher_name(rs.getString("TEACHER_NAME"));
				System.out.println(loginInfo.getTeacher_name());
			} 
		}catch(Exception ex){
			System.out.println("selectLoginId 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return loginInfo;
	}
	
	//강사를 등록함.
	public int insertTeacher(TeacherBean teacher){
		String sql="INSERT INTO teacher_info VALUES "
				+ "(?,?,?,?,?,"
				+ "?,?,?,?,?,"
				+ "?,?,?,?,?)";
		int insertCount=0;
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, teacher.getTeacher_id());
			pstmt.setString(2, teacher.getTeacher_password());
			pstmt.setString(3, teacher.getTeacher_name());
			pstmt.setString(4, teacher.getTeacher_first_address());
			pstmt.setString(5, teacher.getTeacher_second_address());
			
			pstmt.setString(6, teacher.getTeacher_postcode());
			pstmt.setString(7, teacher.getTeacher_phone_number());
			pstmt.setString(8, teacher.getTeacher_gender());
			pstmt.setString(9, teacher.getTeacher_birthday());
			pstmt.setString(10, teacher.getTeacher_email());
			
			pstmt.setString(11, teacher.getTeacher_image());
			pstmt.setString(12, teacher.getTeacher_introduction());
			pstmt.setString(13, teacher.getTeacher_subject());
			pstmt.setString(14, teacher.getTeacher_position());
			pstmt.setInt   (15, teacher.getTeacher_salary());
			
			insertCount=pstmt.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("insertTeacher 에러: " + ex);			
		}finally{
			close(pstmt);
		}
		return insertCount;
	}
	
	//강사를 선택
	//updateFormService에서 사용
	//viewService에서 사용
	public TeacherBean selectTeacher(String id){
		String sql="SELECT * FROM teacher_info WHERE teacher_id=?";
		TeacherBean tea = null;
		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
			tea=new TeacherBean();
			tea.setTeacher_id(rs.getString("teacher_id"));
			tea.setTeacher_password(rs.getString("teacher_password"));
			tea.setTeacher_name(rs.getString("teacher_name"));
			tea.setTeacher_first_address(rs.getString("teacher_first_address"));
			tea.setTeacher_second_address(rs.getString("teacher_second_address"));
			
			tea.setTeacher_postcode(rs.getString("teacher_postcode"));
			tea.setTeacher_phone_number(rs.getString("teacher_phone_number"));
			tea.setTeacher_gender(rs.getString("teacher_gender"));
			tea.setTeacher_birthday(rs.getString("teacher_birthday"));
			tea.setTeacher_email(rs.getString("teacher_email"));
			
			tea.setTeacher_image(rs.getString("teacher_image"));
			tea.setTeacher_introduction(rs.getString("teacher_introduction"));
			tea.setTeacher_subject(rs.getString("teacher_subject"));
			tea.setTeacher_position(rs.getString("teacher_position"));
			tea.setTeacher_salary(rs.getInt("teacher_salary"));
	
			}
		}catch(Exception ex){
			System.out.println("getDetailTeacher 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return tea;
	}
	
	//강사 정보 수정
	public int updateTeacher(TeacherBean teacher){

		String sql="UPDATE teacher_info set "
		+ "teacher_password=?, teacher_name=?,teacher_first_address=?,"				
		+ "teacher_second_address=?, teacher_postcode=?,teacher_phone_number=?,"		
		+ "teacher_gender=?, teacher_birthday=?,teacher_email=?,"		
		+ "teacher_image=?, teacher_introduction=?,teacher_subject=?,"
		+ "teacher_position=?, teacher_salary=? WHERE teacher_id=?";
		
		String sql2 = "UPDATE teacher_info set "
				+ "teacher_password=?, teacher_name=?,teacher_first_address=?,"				
				+ "teacher_second_address=?, teacher_postcode=?,teacher_phone_number=?,"		
				+ "teacher_gender=?, teacher_birthday=?,teacher_email=?,"		
				+ "teacher_introduction=?,teacher_subject=?,"
				+ "teacher_position=?, teacher_salary=? WHERE teacher_id=?";
		int updateCount = 0;
		try{
			if(teacher.getTeacher_image().equals("")) {
				System.out.println("TeacherDAO updateTeacher의 이미지 없음 실행");
				pstmt=con.prepareStatement(sql2);
				
				pstmt.setString(1, teacher.getTeacher_password());
				pstmt.setString(2, teacher.getTeacher_name());
				
				pstmt.setString(3, teacher.getTeacher_first_address());
				pstmt.setString(4, teacher.getTeacher_second_address());
				pstmt.setString(5, teacher.getTeacher_postcode());
				
				pstmt.setString(6, teacher.getTeacher_phone_number());
				pstmt.setString(7, teacher.getTeacher_gender());
				pstmt.setString(8, teacher.getTeacher_birthday());
				
				pstmt.setString(9, teacher.getTeacher_email());
				pstmt.setString(10, teacher.getTeacher_introduction());
				
				pstmt.setString(11, teacher.getTeacher_subject());
				pstmt.setString(12, teacher.getTeacher_position());
				pstmt.setInt   (13, teacher.getTeacher_salary());
				
				pstmt.setString(14, teacher.getTeacher_id());
			}
				
			else {
				System.out.println("TeacherDAO updateTeacher의 이미지 있음 실행");
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, teacher.getTeacher_password());
				pstmt.setString(2, teacher.getTeacher_name());
				
				pstmt.setString(3, teacher.getTeacher_first_address());
				pstmt.setString(4, teacher.getTeacher_second_address());
				pstmt.setString(5, teacher.getTeacher_postcode());
				
				pstmt.setString(6, teacher.getTeacher_phone_number());
				pstmt.setString(7, teacher.getTeacher_gender());
				pstmt.setString(8, teacher.getTeacher_birthday());
				
				pstmt.setString(9, teacher.getTeacher_email());
				pstmt.setString(10, teacher.getTeacher_image());
				pstmt.setString(11, teacher.getTeacher_introduction());
				
				pstmt.setString(12, teacher.getTeacher_subject());
				pstmt.setString(13, teacher.getTeacher_position());
				pstmt.setInt   (14, teacher.getTeacher_salary());
				
				pstmt.setString(15, teacher.getTeacher_id());
			}
			updateCount=pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("updateTeacher 에러: " + ex);			
		}finally{
			close(pstmt);
		}
		return updateCount;
	}
	
	
	/* 강사 목록 페이지를 불러올 메소드
	 * 아이디,이름,전화번호,생일(정확히 나이),이메일.이미지,담당과목,직급만 보여줌.
	 * 한개씩 가져와서 ArrayList에 잡아넣고 반환한다
	 */
	public ArrayList<TeacherBean> selectTeacherList(){
		String sql="SELECT * FROM teacher_info";
		ArrayList<TeacherBean> teacherList=new ArrayList<TeacherBean>();
		TeacherBean tea = null;
		try{
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				do{
					tea=new TeacherBean();
					tea.setTeacher_id(rs.getString("teacher_id"));
					tea.setTeacher_name(rs.getString("teacher_name"));
					tea.setTeacher_phone_number(rs.getString("teacher_phone_number"));
					tea.setTeacher_birthday(rs.getString("teacher_birthday"));
					tea.setTeacher_email(rs.getString("teacher_email"));
					tea.setTeacher_image(rs.getString("teacher_image"));
					tea.setTeacher_subject(rs.getString("teacher_subject"));
					tea.setTeacher_position(rs.getString("teacher_position"));
					
					teacherList.add(tea);
				}while(rs.next());
			}
		}catch(Exception ex){
			System.out.println("selectTeacherList 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return teacherList;
	}
	
	//강사 삭제
	public int deleteTeacher(String deleteId){
		String sql="DELETE from teacher_info WHERE teacher_id=?";
		int deleteCount = 0;

		try{
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, deleteId);
			
			deleteCount = pstmt.executeUpdate();
		}catch(Exception ex){
			System.out.println("deleteTeacher 에러: " + ex);	
		}finally{
			close(pstmt);
		}
		
		return deleteCount;
	}
	
	
	/*
	 * 학생에게 필요한 강의정보들을 골라서 담기때문에 다소 길다.
	 * (강사정보 RIGHT JOIN 강의신청리스트) 형태이고 두 테이블에서 강의 코드가 같은것만 가져오며 submit_id의 리스트만 뽑아준다.
	 * right join : 우측에 있는 테이블이 왼쪽에 있는 테이블에게서 필요한 것만 가져옴
	 */

	
	// 강사용 : 강사가 자신의 강의 목록에서 학생을 보기 위해 강의코드를 가져옴
	public ArrayList<StudentBean> lec_selectStudentList(String lecCode) {
		String sql="SELECT submit_id, student_name, student_phone_number,student_gender,student_birthday,"
				+ "student_email,student_image,student_grade_point,student_teacher_memo "
				+ "FROM student_info RIGHT JOIN lecture_submit_list ON "
				+ "student_info.student_id = lecture_submit_list.submit_id WHERE submit_lecture_code=?";
		ArrayList<StudentBean> studentList = new ArrayList<StudentBean>();
		StudentBean st = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lecCode);
			rs = pstmt.executeQuery();
			

			if (rs.next()) {
				do {
					st = new StudentBean();
					st.setStudent_id(rs.getString("submit_id"));
					st.setStudent_name(rs.getString("student_name"));
					st.setStudent_phone_number(rs.getString("student_phone_number"));
					st.setStudent_gender(rs.getString("student_gender"));
					
					st.setStudent_birthday(rs.getString("student_birthday"));
					st.setStudent_email(rs.getString("student_email"));
					st.setStudent_image(rs.getString("student_image"));
					//st.setStudent_grade_point(rs.getInt("student_grade_point"));
					st.setStudent_teacher_memo(rs.getString("student_teacher_memo"));

					studentList.add(st);
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("lec_selectStudentList 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return studentList;
	}
	
}
