/* 강의 신청 액션
 * session에 있는 학생 ID와 신청링크에 같이 걸려오는 강의코드를 토대로 강의 신청함
 * 강의가 있는지 확인하고(DAO), 없을때를 대비해 예외도 처리 해주고(ACTION) 강의가 있으면 submitList에 필요한것들을 등록한다(DAO).
 */
package lecture.action;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import lecture.svc.LectureSubmitService;
import vo.ActionForward;

public class LectureSubmitAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		String lectureCode = request.getParameter("id"); //강의코드를 의미함
		String student_id = (String) session.getAttribute("session_student_id");
		
		if (student_id == null) {
			out.println("<script>");
			out.println("alert('강의 신청은 학생만 가능합니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		// 강의 목록에서 올 ID임.
		LectureSubmitService lectureSubmitService = new LectureSubmitService();
		
		int submitResult = lectureSubmitService.submitLecture(lectureCode,student_id);
		//0이 반환 : 등록 실패
		//1이 반환 : 등록 성공
		//2가 반환 : 중복 강의 신청
		
		System.out.println("result"+submitResult);
		
		//아래는 연결되는곳은 같으며, 메시지만 다름 
		if (submitResult == 1) { //
			out.println("<script>");
			out.println("alert('강의 신청 성공')");
			out.println("</script>");
		
		}else if (submitResult == 2) {
			out.println("<script>");
			out.println("alert('이미 같은 강의가 신청되어 있습니다.')");
			out.println("</script>");
			
		} else {
			out.println("<script>");
			out.println("alert('강의 신청 실패!')");
			out.println("</script>");
			//
		}
		out.println("<script>");
		out.println("location.href='/Project_academy/lectureListAction.lec?main=true'");
	//	out.println("location.reload()");
	//	out.println("history.back()");
		
		//out.println("Test2.jsp");
		out.println("</script>");
		
		forward = new ActionForward();
		/*
		forward.setRedirect(true);
		forward.setPath("./lectureListAction.lec");
		*/
		return forward;
	}
}
