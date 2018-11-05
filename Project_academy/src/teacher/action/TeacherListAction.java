package teacher.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import teacher.svc.TeacherListService;
import teacher.vo.TeacherBean;
import vo.ActionForward;

public class TeacherListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		ActionForward forward = null;
/*
		String session_id = null;
		// id에 값이 있으면 아래 실행
		// loginAction에서 설정된 session_teacher_id임.
		if ((String) session.getAttribute("session_teacher_id") != null) {
			session_id = (String) session.getAttribute("session_teacher_id");
			System.out.println("TeacherJoinFormAction session_id:" + session_id);
		} else if (session_id == null || !(session_id.equals("admin"))) {
			// 이 아이디가 null이었거나, 관리자가 아니면 실행
			out.println("<script>");
			out.println("alert('관리자만 접속 할 수 있습니다.')");
			out.println("location.href='./mainPage.main';");
			out.println("</script>");
		}
*/
		forward = new ActionForward();
		TeacherListService teacherListService = new TeacherListService();
		ArrayList<TeacherBean> teacherList = teacherListService.getTeacherList();
		request.setAttribute("teacherList", teacherList);
		//forward.setPath("teacher/tea_teacherList.jsp");
		forward.setPath("/teacher/tea_teacherList.jsp");

		return forward;
	}
}
