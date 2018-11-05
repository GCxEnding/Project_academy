package student.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import student.svc.StudentCalendarService;
import student.vo.StudentAttendBean;
import student.vo.StudentBean;
import vo.ActionForward;

public class StudentCalendarAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		forward = new ActionForward();
		
		StudentAttendBean studentAttendBean = new StudentAttendBean();
		studentAttendBean.setAttendance_student_id(request.getParameter("session_student_id"));
		
		String Calender = (String)session.getAttribute("session_student_id");
		StudentCalendarService studentCalendarService = new StudentCalendarService();
		ArrayList<StudentAttendBean> AttendList = studentCalendarService.getAttendList();
		session.setAttribute("AttendList", AttendList);
		//forward.setRedirect(true);
		forward.setPath("student/CalendarExam2.jsp");
		return forward;
	}
} 