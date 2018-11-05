package lecture.vo;

public class LectureRatingBean {

	String lecture_rating_lec_code = null;
	String lecture_rating_st_id = null;
	String lecture_rating_teacher_id = null;
	double lecture_rating_score;
	
	public String getLecture_rating_lec_code() {
		return lecture_rating_lec_code;
	}
	public void setLecture_rating_lec_code(String lecture_rating_lec_code) {
		this.lecture_rating_lec_code = lecture_rating_lec_code;
	}
	public String getLecture_rating_st_id() {
		return lecture_rating_st_id;
	}
	public void setLecture_rating_st_id(String lecture_rating_st_id) {
		this.lecture_rating_st_id = lecture_rating_st_id;
	}
	public String getLecture_rating_teacher_id() {
		return lecture_rating_teacher_id;
	}
	public void setLecture_rating_teacher_id(String lecture_rating_teacher_id) {
		this.lecture_rating_teacher_id = lecture_rating_teacher_id;
	}
	public double getLecture_rating_score() {
		return lecture_rating_score;
	}
	public void setLecture_rating_score(double lecture_rating_score) {
		this.lecture_rating_score = lecture_rating_score;
	}
}
