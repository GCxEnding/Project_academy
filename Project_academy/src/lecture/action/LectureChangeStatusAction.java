//학생의 수강 상태를 변경해주는 ACtion

package lecture.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import lecture.svc.LectureChangeStatusService;
import vo.ActionForward;

public class LectureChangeStatusAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		//tea_myStudentList.jsp에서 가져올 변수들
		String status = request.getParameter("status");
		String[] status_ID = request.getParameterValues("status_ID");
		String status_code = request.getParameter("status_code");
		
		LectureChangeStatusService lectureChangeStatusService = new LectureChangeStatusService();
		int changeResult = lectureChangeStatusService.changeStatus(status, status_ID, status_code);
		
		if (changeResult == 0) { 
			request.setAttribute("result", 0); 
			System.out.println("cancel 0임");} 
		else { 
			request.setAttribute("result", changeResult); 
			System.out.println("cancel "+changeResult+"임");}
		forward.setPath("/Project_academy/teacherMyStudentAction.tea?lecCode="+status_code);
		return forward;
	}
}
