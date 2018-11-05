package student.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import student.svc.StudentSelectService;
import student.vo.StudentBean;
import vo.ActionForward;

public class StudentUpdateFormAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		String session_id = (String) session.getAttribute("session_student_id");
		// loginAction에서 설정된 session_student_id임. 여기선 관리자 여부를 확인하기 위해 필요.

		ActionForward forward = null;

		// 강사 목록에 접속할때 관리자인지 확인을 하므로 아래 구문이 필요가 없을지도?.
		if (session_id == null) { //|| !session_id.equals("admin")  ) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자만 강사를 수정 할 수 있습니다.')");
			out.println("location.href='main.jsp';");
			out.println("</script>");
			/*
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./studentLogin.tea");
			*/
		}
		StudentSelectService studentSelectService = new StudentSelectService();

		String updateID = request.getParameter("id2");
		//tea_updateForm.jsp에서 가져온 updateID임.

		StudentBean student = studentSelectService.getStudent(updateID);
		//selectservice는 id를 토대로 모든 정보를 가져옴.
		request.setAttribute("student", student);

		forward = new ActionForward("studentUpdate.st", false);

		return forward;
	}
}
