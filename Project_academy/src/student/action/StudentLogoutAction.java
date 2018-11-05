package student.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;

public class StudentLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		session.invalidate();
		System.out.println("로그아웃됨");
		ActionForward forward = null;
		String isDelete = request.getParameter("delete");
		System.out.println(isDelete);
		forward = new ActionForward();

		if (isDelete == null) {
			forward.setRedirect(true);
			forward.setPath("index.jsp");
		} else {
			out.println("<script>");
			out.println("alert('탈퇴되었습니다.')");
			out.println("location.href='Project_academy/index.jsp')");
			out.println("<script>");
		}
		forward.setRedirect(true);
		forward.setPath("index.jsp");
		return forward;
	}

}
