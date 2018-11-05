package teacher.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import teacher.svc.TeacherSelectService;
import teacher.vo.TeacherBean;
import vo.ActionForward;

public class TeacherUpdateFormAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();

		// loginAction에서 설정된 session_teacher_id임. 여기선 관리자 여부를 확인하기 위해 필요.

		ActionForward forward = null;
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
		TeacherSelectService teacherSelectService = new TeacherSelectService();

		String updateID = request.getParameter("id");
		//tea_updateForm.jsp에서 가져온 updateID임.

		TeacherBean teacher = teacherSelectService.getTeacher(updateID);
		//selectservice는 id를 토대로 모든 정보를 가져옴.
		request.setAttribute("update_teacher", teacher);
		forward = new ActionForward("/teacher/tea_updateForm.jsp", false);

		return forward;
	}
}
