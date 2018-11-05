package lecture.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import lecture.svc.LectureRatingService;
import lecture.vo.LectureBean;
import lecture.vo.LectureRatingBean;
import vo.ActionForward;

public class LectureRating implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
		boolean ratingResult = false;
		
		LectureRatingBean lecture = new LectureRatingBean();
		
		//코드, 학생ID,강사ID, 점수를 가져옴
		lecture.setLecture_rating_lec_code(request.getParameter("lecture_code"));
		lecture.setLecture_rating_st_id((String)session.getAttribute("session_student_id"));
		lecture.setLecture_rating_teacher_id(request.getParameter("lecture_teacher_id"));
		lecture.setLecture_rating_score(Double.parseDouble(request.getParameter("lecture_rating")));
		
		System.out.println("강의코드 : "+request.getParameter("lecture_code"));
		System.out.println("학생ID : "+(String)session.getAttribute("session_student_id"));
		System.out.println("강사ID : "+request.getParameter("lecture_teacher_id"));
		System.out.println("점수 :"+Double.parseDouble(request.getParameter("lecture_rating")));
		LectureRatingService lectureRatingService = new LectureRatingService();
		
		ratingResult = lectureRatingService.ratingLecture(lecture);
		if(ratingResult) {
			lectureRatingService.updateLectureRating(lecture);
		}
		PrintWriter out = response.getWriter();
		
		if (ratingResult == false) {
			out.println("<script>");
			out.println("alert('강의 평가 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			//forward.setRedirect(true);
			out.println("<script>");
			out.println("alert('정보 평가 완료!')");
			out.println("location.href='index.jsp';");
			out.println("</script>");
		}
		return forward;
	}
}
