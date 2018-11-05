package teacher.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import teacher.svc.TeacherLoginService;
import teacher.vo.TeacherBean;
import vo.ActionForward;

public class TeacherLoginAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TeacherBean teacher = new TeacherBean();
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		teacher.setTeacher_id(request.getParameter("teacher_id"));
		teacher.setTeacher_password(request.getParameter("teacher_password"));
		// 아디 비번 받아서 넘기고 그 결과만 T,F로 받아옴.

		TeacherLoginService teacherLoginService = new TeacherLoginService();
		TeacherBean loginInfo = teacherLoginService.login(teacher);
		// System.out.println("teaLoginAction에서의 ID: " + loginInfo.getTeacher_id());
		ActionForward forward = null;

		// 값이 비어있지 않으면, 즉 아이디와 비밀번호가 맞다면,
		if (loginInfo.getTeacher_id().equals("")) {
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 틀렸습니다.')");
			// out.println("location.href='./teacher/tea_loginForm.jsp';");
			out.println("history.back()");
			out.println("</script>");

		} else {

			forward = new ActionForward();

			// 세션에 강사 ID와 이름을 세팅한다.
			session.setAttribute("session_teacher_id", loginInfo.getTeacher_id());
			session.setAttribute("session_teacher_name", loginInfo.getTeacher_name());

			System.out.println("loginAction의 이름:" + teacher.getTeacher_name());
			System.out.println("teacherLoginAction의 id와 이름 : " + session.getAttribute("session_teacher_id") + " "
					+ session.getAttribute("session_teacher_name"));

			forward.setRedirect(true);
			forward.setPath("index.jsp");
		}
		return forward;
	}

}
