package student.action;

import action.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;

public class StudentJoinFormAction implements Action{
	public ActionForward execute (HttpServletRequest request, HttpServletResponse response) throws Exception{

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();

		String session_id = (String) session.getAttribute("session_student_id");
		// loginAction에서 설정된 session_teacher_id임. 여기선 관리자 여부를 확인하기 위해 필요.

		

		// 강사 목록에 접속할때 관리자인지 확인을 하므로 아래 구문이 필요가 없을지도?.
		if (!session_id.equals("admin") || session_id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자만 학생를 등록 할 수 있습니다.')");
			out.println("location.href='./mainPage.main';");
			out.println("</script>");
			/*
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./teacherLogin.tea");
			*/
		}
		ActionForward forward =  new ActionForward();
		forward.setRedirect(true);
		forward.setPath("teacher/tea_joinForm.jsp");
		return forward;
		
	}
}
