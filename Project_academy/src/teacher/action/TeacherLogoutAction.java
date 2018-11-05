package teacher.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;

public class TeacherLogoutAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("로그아웃됨");
		ActionForward forward = null;

		forward = new ActionForward();
		forward.setRedirect(true);
		//forward.setPath("/mainPage.main");
		forward.setPath("index.jsp");

		return forward;
	}
}
