package student.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import student.svc.StudentListService;
import student.vo.StudentBean;
import vo.ActionForward;

public class StudentListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		String teacherID = ((String)session.getAttribute("session_teacher_id"));
		// 학생만 막으면 되기때문에 관리자나 강사id의 세션을 가져옴.
		
		forward.setPath("./main.jsp");
		/* if~else 구문
		 * #강사나 관리자만 접근할 수 있어야 함.
		 * 만약 학생이 접근하면 script를 띄우고, 윗줄에 설정된 페이지로 넘겨버림.
		 * 또는 세션에 강사아이디가 있을 경우엔 학생목록을 넘겨준다.
		 */
		if (teacherID == null) { 
			out.println("<script>");
			out.println("alert('강사만 학생 목록을 볼 수 있습니다.');");
			out.println("location.href='./index.jsp'");
			out.println("</script>");
		} else {
			StudentListService studentListService = new StudentListService();
			ArrayList<StudentBean> studentList = studentListService.getStudentList();
			request.setAttribute("studentList", studentList);
			forward.setPath("studentList.st");
		}
		return forward;
		
	}
}
