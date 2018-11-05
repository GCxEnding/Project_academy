package teacher.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import student.vo.StudentBean;
import teacher.svc.TeacherMyStudentService;
import vo.ActionForward;

public class TeacherMyStudentAction implements Action {
public ActionForward execute (HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		ActionForward forward = new ActionForward();
		
		String lecCode = request.getParameter("lecCode"); //강사가 자신의 강의 목록에서 학생을 보기 위해 강의코드를 가져옴

		if (lecCode == null) {
			out.println("<script>");
			out.println("alert('강의코드를 받지 못했습니다')");
			System.out.println("강의코드를 받지 못했습니다");
			out.println("history.back()");
			out.println("</script>");
		}
		
		TeacherMyStudentService teacherMyStudentService = new TeacherMyStudentService();
		ArrayList<StudentBean> lectureList = teacherMyStudentService.getLectureList(lecCode);
		request.setAttribute("lec_studentList", lectureList);
    	
		//	System.out.println(lectureList.get(1));
		// forward.setPath("lecture/tea_lectureList.jsp");
		if(lectureList.size() == 0) {
			out.println("<script>");
			out.println("alert('신청자가 없습니다.')");
			out.println("window.close()");
			out.println("</script>");
		} else {
			forward.setPath("/teacher/tea_myStudentList.jsp");
		}
		return forward;
	}
	
}
