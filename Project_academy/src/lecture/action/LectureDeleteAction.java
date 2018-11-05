package lecture.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import lecture.svc.LectureDeleteService;
import vo.ActionForward;

public class LectureDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		String session_id = (String) session.getAttribute("session_teacher_id");

		//where 변수가 없으면 null포인트 오류가 뜨지않게 빈칸으로 바꿈
		String isMain = request.getParameter("where");
		if(isMain == null)
			isMain="";

		// 삭제를 시도하는자가 관리자인지 확인하는 구문
		if (session_id == null || !session_id.equals("admin")) {
			out.println("<script>");
			out.println("alert('관리자만 강의를 관리 할 수 있습니다.')");
			System.out.println("관리자만 강의를 관리 할 수 있습니다.");
			out.println("location.href='./mainPage.main';");
			out.println("</script>");
			/*
			 * forward = new ActionForward(); forward.setRedirect(true);
			 * forward.setPath("./teacherLogin.tea");
			 */
		} else {
			String deleteID = request.getParameter("id");
			//강의 목록에서 올 ID임.
			LectureDeleteService lectureDeleteService = new LectureDeleteService();
			int deleteResult = lectureDeleteService.deleteLecture(deleteID);
			
			if (deleteResult > 0) {
				System.out.println(deleteResult);
				out.println("<script>");
				out.println("alert('강의 삭제 성공')");
				out.println("</script>");
				// 성공하면 메시지 띄워주고 return에서 다른 페이지로 넘김
			} else {
				out.println("<script>");
				out.println("alert('강의 삭제 실패!')");
				out.println("</script>");
				//
			}
			forward = new ActionForward();
			forward.setRedirect(true);
			
			//메인 화면에서 요청한 삭제 명령이라면 다시 메인으로 보냄
			if(isMain.equals("main")) {
				forward.setPath("/Project_academy/index.jsp");
				return forward;
			}
			forward.setPath("/Project_academy/lectureListAction.lec");
		}
		
		return forward;
	}
}