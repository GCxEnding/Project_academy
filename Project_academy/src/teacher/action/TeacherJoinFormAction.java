package teacher.action;

import action.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;

public class TeacherJoinFormAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter(); //자바스크립트용
		HttpSession session = request.getSession();

		
	
		//id에 값이 있으면 아래 실행
		//삭제를 시도하는자가 관리자인지 확인하는 구문
		// loginAction에서 설정된 session_id임. 여기선 관리자 여부를 확인하기 위해 필요.
		String session_id = ((String)session.getAttribute("session_teacher_id"));

		if (session_id == null || !(session_id.equals("admin"))) { 
			out.println("<script>");
			out.println("alert('관리자만 접속 할 수 있습니다.')");
			out.println("location.href='./mainPage.main';");
			out.println("</script>");
		}
		/*
		if((String)session.getAttribute("session_teacher_id") !=null) {
			session_id = (String)session.getAttribute("session_teacher_id");
			System.out.println("TeacherJoinFormAction session_id:" + session_id );
		} else if (session_id==null || !(session_id.equals("admin"))){
			//이 아이디가 null이었거나, 관리자가 아니면 실행
			out.println("<script>");
			out.println("alert('관리자만 접속 할 수 있습니다.')");
			out.println("location.href='./mainPage.main';");
			out.println("</script>");
		}
		*/
		
		ActionForward forward = new ActionForward();
		//forward.setRedirect(true);
		forward.setPath("/teacher/tea_joinForm.jsp");
		
		return forward;
	}
}
