package teacher.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import teacher.svc.TeacherDeleteService;
import vo.ActionForward;

/*강사 삭제는 관리자만 가능함.
 * 과정이 끝나면 강사 목록 페이지로 넘어감
 */
public class TeacherDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String session_id = (String) session.getAttribute("session_teacher_id");
		// loginAction에서 설정된 session_teacher_id임. 여기선 관리자 여부를 확인하기 위해 필요.

		ActionForward forward = null;
		
		//삭제를 시도하는자가 관리자인지 확인하는 구문
		// 강사 목록에 접속할때 관리자인지 확인을 하므로 아래 구문이 필요가 없을지도?.
		if (!session_id.equals("admin") || session_id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자만 강사를 관리 할 수 있습니다.')");
			out.println("location.href='./mainPage.main';");
			out.println("</script>");
			/*
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./teacherLogin.tea");
			*/
		} else {
			String deleteID = request.getParameter("teacherListID");
			TeacherDeleteService teacherDeleteService = new TeacherDeleteService();
			boolean deleteResult = teacherDeleteService.deleteTeacher(deleteID);

			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			if (deleteResult) {
				out.println("<script>");
				out.println("alert('강사 탈퇴 성공')");
				out.println("location.href='./teacherListAction.tea';");
				out.println("</script>");

				//성공하면 메시지 띄워주고 return에서 다른 페이지로 넘김
			} else {
				out.println("<script>");
				out.println("alert('강사 탈퇴 실패')");
				out.println("location.href='./teacherListAction.tea';");
				out.println("</script>");
				//
			}

		}
		return forward;
	}
}