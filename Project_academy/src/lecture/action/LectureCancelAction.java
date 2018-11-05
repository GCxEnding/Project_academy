package lecture.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import lecture.svc.LectureCancelService;
import vo.ActionForward;

public class LectureCancelAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();


		String session_id = (String) session.getAttribute("session_student_id"); //세션의 학생 아이디를 받아옴
		String cancelCode = request.getParameter("id"); //강의 코드를 받아올것
		// 강의 목록에서 올 ID임.
		
		
		if(request.getParameter("isCancel") != null) {
			forward.setPath("lectureMyLectureAction.lec?id="+session_id);
			return forward;
		} //강의 취소하고 나서 새로고침하면 메시지가 뜨는 문제를 제거하기 위해서
		
		LectureCancelService lecturecancelService = new LectureCancelService();
		boolean cancelResult = lecturecancelService.cancelLecture(session_id, cancelCode);

		//강의 목록으로 넘어갔을때, true일 경우 javascript 메시지로 삭제가 됐거나 안됐음을 추가해줘야됨
		//강의 삭제 됐으면 isCancel에 1을, 실패하면 0을 설정함
		if (cancelResult) {  
			System.out.println("cancel 1임");
			out.println("<script>");
			out.println("alert('강의 취소 되었습니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else { 
			request.setAttribute("isCancel", 0); 
			System.out.println("cancel 0임");
			out.println("<script>");
			out.println("alert('취소에 실패했습니다.')");
			out.println("location.href='index.jsp'");
			out.println("</script>");
		}
		forward.setPath("lectureMyLectureAction.lec?id="+session_id);
		return forward;

	}
}
