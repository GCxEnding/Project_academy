package student.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import student.svc.StudentDeleteService;
import teacher.svc.TeacherDeleteService;
import vo.ActionForward;

public class StudentDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String session_id = (String) session.getAttribute("session_teacher_id");
		if(session_id == null) {
			session_id = "0";
		}
		
		PrintWriter out = response.getWriter();
		
		// loginAction에서 설정된 session_teacher_id임. 여기선 관리자 여부를 확인하기 위해 필요.

		ActionForward forward = null;
		forward = new ActionForward();
		forward.setRedirect(true);
		
		String deleteID = request.getParameter("id"); //링크로 보내준 id를 받기 위해서
		if(deleteID == null) {
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.')");
			out.println("histroy.go(-1);"); //뒤로가기
			out.println("</script>");
		}
		StudentDeleteService studentDeleteService = new StudentDeleteService();
		boolean deleteResult = studentDeleteService.deleteStudent(deleteID);
		
		if (deleteResult) {
			out.println("<script>");
			out.println("alert('삭제 성공')");
			out.println("</script>");
	
			if(session_id.equals("admin")) {
				forward.setPath("studentListAction.st");
			}else {//학생일 경우 세션을 삭제 시키고 메인 페이지로
				forward.setPath("studentLogoutAction.st?delete=true");
			}
			
		} else if(session_id.equals("admin")) {
			out.println("<script>");
			out.println("alert('학생 삭제실패')");
			out.println("location.href='studentListAction.st';");
			out.println("</script>");
			forward.setPath("Project_academy/studentListAction.st");
		}else { //학생일 경우 다시 삭제 하는 페이지로 이동
			out.println("<script>");
			out.println("alert('학생 삭제실패')");
			out.println("location.href='studentDelete.st';");
			out.println("</script>");
			forward.setPath("Project_academy/studentLogoutAction.st");
		}
		return forward;
	}
}








/*

String deleteID = null;
String session_id = null;


if ((String) session.getAttribute("session_student_id") != null) {
	// 세션의 student id가 없으면 아래 if문에서 오류가나므로 null여부를 미리 확인함
	session_id = ((String) session.getAttribute("session_student_id"));
	if (((String) session.getAttribute("session_student_id"))
		.equals(request.getParameter("id"))) {
		deleteID = request.getParameter("id");
	} else {
		out.print("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("location.href='./index.jsp';");
	}
}

else if (session_id == null) {// 학생의 session id가 없으면 관리자로 로그인했을수 있으므로 관리자인지 확인함
	session_id = ((String) session.getAttribute("session_teacher_id"));
	deleteID = request.getParameter("id");
}

*/

/*  약 학생으로 로그인되어있으면, 주소창에 id를 넘기는것만으로도 삭제가 가능할수 있으므로 학생이 삭제시도를 할 경우엔, 현재 로그인된
  학생과 삭제하려는 id가 같아야 하므로 확인이 필요함 try catch로 요약이 가능할지도?
  */
 
			// 삭제 액션은 다시 생각할 필요가 있음 미완성.
			/*
			 * teacher_id가 equals admin이거나
			 * session student_id equals 이면
			 * deleteID에 id를 넣는다?
			 */

			/*
			 * 8월3일 String deleteID=(String)session.getAttribute("session_student_id");를 변경
			 * 학생이 탈퇴할거면 페이지에서 세션을 볼 필요없이 주소에 학생 아이디를 넘겨주면 되고 강사나 관리자가 학생 정보를 볼거면 목록의 주소에서
			 * 넘어온 id를 사용하면 됨.
			 */
