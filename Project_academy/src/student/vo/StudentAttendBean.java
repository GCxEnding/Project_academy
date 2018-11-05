package student.vo;

import java.util.Date;

public class StudentAttendBean {
	private Date attendance_date;
	private String attendance_student_id;
	private String attendance_lec_code;
	private String attendance_state;
	private String attendance_entrance;
	private String attendance_exit;
	private String attendance_reason;
	public Date getAttendance_date() {
		return attendance_date;
	}
	public void setAttendance_date(Date attendance_date) {
		this.attendance_date = attendance_date;
	}
	public String getAttendance_student_id() {
		return attendance_student_id;
	}
	public void setAttendance_student_id(String attendance_student_id) {
		this.attendance_student_id = attendance_student_id;
	}
	public String getAttendance_lec_code() {
		return attendance_lec_code;
	}
	public void setAttendance_lec_code(String attendance_lec_code) {
		this.attendance_lec_code = attendance_lec_code;
	}
	public String getAttendance_state() {
		return attendance_state;
	}
	public void setAttendance_state(String attendance_state) {
		this.attendance_state = attendance_state;
	}
	public String getAttendance_entrance() {
		return attendance_entrance;
	}
	public void setAttendance_entrance(String attendance_entrance) {
		this.attendance_entrance = attendance_entrance;
	}
	public String getAttendance_exit() {
		return attendance_exit;
	}
	public void setAttendance_exit(String attendance_exit) {
		this.attendance_exit = attendance_exit;
	}
	public String getAttendance_reason() {
		return attendance_reason;
	}
	public void setAttendance_reason(String attendance_reason) {
		this.attendance_reason = attendance_reason;
	}
	
	
	
}
