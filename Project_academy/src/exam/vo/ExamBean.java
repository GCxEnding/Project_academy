package exam.vo;

import java.sql.Date;

//학생의 시험 정보를 입력,수정,조회,삭제할떄 쓸 객체
public class ExamBean {
	String examInfo_lec_code;
	String examInfo_teacher_id;
	String examInfo_student_id;
	String examInfo_exam_type;
	Date examInfo_date = null;
	int examInfo_score = 0;
	
	
	public String getExamInfo_lec_code() {
		return examInfo_lec_code;
	}
	public void setExamInfo_lec_code(String examInfo_lec_code) {
		this.examInfo_lec_code = examInfo_lec_code;
	}
	public String getExamInfo_teacher_id() {
		return examInfo_teacher_id;
	}
	public void setExamInfo_teacher_id(String examInfo_teacher_id) {
		this.examInfo_teacher_id = examInfo_teacher_id;
	}
	public String getExamInfo_student_id() {
		return examInfo_student_id;
	}
	public void setExamInfo_student_id(String examInfo_student_id) {
		this.examInfo_student_id = examInfo_student_id;
	}
	public String getExamInfo_exam_type() {
		return examInfo_exam_type;
	}
	public void setExamInfo_exam_type(String examInfo_exam_type) {
		this.examInfo_exam_type = examInfo_exam_type;
	}
	public Date getExamInfo_date() {
		return examInfo_date;
	}
	public void setExamInfo_date(Date examInfo_date) {
		this.examInfo_date = examInfo_date;
	}
	public int getExamInfo_score() {
		return examInfo_score;
	}
	public void setExamInfo_score(int examInfo_score) {
		this.examInfo_score = examInfo_score;
	}

}
