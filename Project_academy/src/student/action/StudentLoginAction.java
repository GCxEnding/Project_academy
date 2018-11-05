package student.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import student.svc.StudentLoginService;
import student.vo.StudentBean;
import vo.ActionForward;

public class StudentLoginAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		StudentBean studentBean = new StudentBean();

		studentBean.setStudent_id(request.getParameter("student_id"));
		studentBean.setStudent_password(request.getParameter("student_password"));

		StudentLoginService studentLoginService = new StudentLoginService();
		boolean loginResult = studentLoginService.login(studentBean);
		ActionForward forward = null;
		if (loginResult) {
			forward = new ActionForward();
			
			session.setAttribute("session_student_id", studentBean.getStudent_id());
			//request.setAttribute("id2", studentBean.getStudent_id());
			forward.setRedirect(true);
			forward.setPath("index.jsp");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 틀렸습니다.')");
		//	out.println("location.href='studentLogin.st';");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
