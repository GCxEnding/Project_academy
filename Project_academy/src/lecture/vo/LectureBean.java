package lecture.vo;

import java.sql.Date;
import java.sql.Time;

public class LectureBean {
	String lecture_code;
	String lecture_teacher_id;
	String lecture_name;
	String lecture_teacher_name;
	String lecture_intro = null;
	int lecture_student_current = 0;
	int lecture_student_limit = 0;
	Date lecture_start_period = null;
	Date lecture_end_period = null;
	int lecture_cost = 0;
	String lecture_type = null;
	Time lecture_start_time;
	Time lecture_end_time = null;
	double lecture_rating = 0;

	String submit_id = null;//학생측 ID
	boolean submit_payment=false;
	String submit_state = null;
	String submit_st_memo=null;
	int lecture_num = 0;
	String lecture_image;
	
	public String getLecture_image() {
		return lecture_image;
	}

	public void setLecture_image(String lecture_image) {
		this.lecture_image = lecture_image;
	}

	public String getLecture_code() {
		return lecture_code;
	}

	public void setLecture_code(String lecture_code) {
		this.lecture_code = lecture_code;
	}

	public String getLecture_teacher_id() {
		return lecture_teacher_id;
	}

	public void setLecture_teacher_id(String lecture_teacher_id) {
		this.lecture_teacher_id = lecture_teacher_id;
	}

	public String getLecture_name() {
		return lecture_name;
	}

	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}

	public String getLecture_teacher_name() {
		return lecture_teacher_name;
	}

	public void setLecture_teacher_name(String lecture_teacher_name) {
		this.lecture_teacher_name = lecture_teacher_name;
	}

	public String getLecture_intro() {
		return lecture_intro;
	}

	public void setLecture_intro(String lecture_intro) {
		this.lecture_intro = lecture_intro;
	}

	public int getLecture_student_current() {
		return lecture_student_current;
	}

	public void setLecture_student_current(int lecture_student_current) {
		this.lecture_student_current = lecture_student_current;
	}

	public int getLecture_student_limit() {
		return lecture_student_limit;
	}

	public void setLecture_student_limit(int lecture_student_limit) {
		this.lecture_student_limit = lecture_student_limit;
	}

	public Date getLecture_start_period() {
		return lecture_start_period;
	}

	public void setLecture_start_period(Date lecture_start_period) {
		this.lecture_start_period = lecture_start_period;
	}

	public Date getLecture_end_period() {
		return lecture_end_period;
	}

	public void setLecture_end_period(Date lecture_end_period) {
		this.lecture_end_period = lecture_end_period;
	}

	public int getLecture_cost() {
		return lecture_cost;
	}

	public void setLecture_cost(int lecture_cost) {
		this.lecture_cost = lecture_cost;
	}

	public String getLecture_type() {
		return lecture_type;
	}

	public void setLecture_type(String lecture_type) {
		this.lecture_type = lecture_type;
	}

	public Time getLecture_start_time() {
		return lecture_start_time;
	}

	public void setLecture_start_time(Time lecture_start_time) {
		this.lecture_start_time = lecture_start_time;
	}

	public Time getLecture_end_time() {
		return lecture_end_time;
	}

	public void setLecture_end_time(Time lecture_end_time) {
		this.lecture_end_time = lecture_end_time;
	}

	public double getLecture_rating() {
		return lecture_rating;
	}

	public void setLecture_rating(double lecture_rating) {
		this.lecture_rating = lecture_rating;
	}
	public String getSubmit_id() {
		return submit_id;
	}

	public void setSubmit_id(String submit_id) {
		this.submit_id = submit_id;
	}

	public boolean isSubmit_payment() {
		return submit_payment;
	}

	public void setSubmit_payment(boolean submit_payment) {
		this.submit_payment = submit_payment;
	}

	public String getSubmit_state() {
		return submit_state;
	}

	public void setSubmit_state(String submit_state) {
		this.submit_state = submit_state;
	}

	public String getSubmit_st_memo() {
		return submit_st_memo;
	}
	public void setSubmit_st_memo(String submit_st_memo) {
		this.submit_st_memo = submit_st_memo;
	}
	public int getLecture_num() {
		return lecture_num;
	}

	public void setLecture_num(int lecture_num) {
		this.lecture_num = lecture_num;
	}
}
