package student.action;


import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.StudentDAO;
import student.svc.StudentAttendService;

import student.vo.StudentAttendBean;
import vo.ActionForward;

public class StudentAttendAction implements Action {
	String state;
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StudentAttendBean st_attend = new StudentAttendBean();
		boolean joinResult=false;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		/* 시간 설정하는 부분 */
		Date today = new Date();
		java.sql.Date sqltoday = new java.sql.Date(today.getTime()); //오늘날짜를 가져옴
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("HH:mm:ss");
		String str = dayTime.format(new Date(time));
		System.out.println(str);
		
		/* 강의 코드와 선택한 상태 가져오는 부분 */
		HttpSession session = request.getSession();
		state = request.getParameter("student_state");
		
		String session_id = (String) session.getAttribute("session_student_id");
		session.setAttribute("session_student_attend", st_attend);
		
		//출석은 두 조건문으로 구분됨
		//입실, 휴가, 기타, 결석을 할 경우
		if(request.getParameter("student_state").equals("입실") ||
				request.getParameter("student_state").equals("휴가") ||
				request.getParameter("student_state").equals("기타") ||
				request.getParameter("student_state").equals("결석")) {
			st_attend.setAttendance_date(sqltoday);
			st_attend.setAttendance_student_id(session_id);
			st_attend.setAttendance_lec_code(request.getParameter("lecture_code"));
			st_attend.setAttendance_state(request.getParameter("student_state"));
			st_attend.setAttendance_entrance(str);
			st_attend.setAttendance_exit("");
			if(request.getParameter("student_state").equals("기타")) {
				st_attend.setAttendance_reason(request.getParameter("student_attend_reason"));
			}else {
				st_attend.setAttendance_reason(request.getParameter(""));
			}
		}
		//퇴실, 조퇴, 외출을 할 경우
		else if(request.getParameter("student_state").equals("퇴실") || 
				request.getParameter("student_state").equals("조퇴") ||
				request.getParameter("student_state").equals("외출")) 
		{
			st_attend.setAttendance_state(request.getParameter("student_state"));
			st_attend.setAttendance_exit(str);
			st_attend.setAttendance_student_id(session_id);
			st_attend.setAttendance_date(sqltoday);
		}

		StudentAttendService studentAttendService = new StudentAttendService();
		joinResult=studentAttendService.AttendStudent(st_attend, state);
		ActionForward forward = null;
		if(joinResult == false) {
			response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out = response.getWriter();
   			out.println("<script>");
   			out.println("alert('출결실패')");
   			out.println("history.back()");
   			out.println("</script>");
		}else{
	   	    forward = new ActionForward();
	   		forward.setRedirect(true);
	   		forward.setPath("index.jsp");
	   	}
	   	return forward;	
	}
}
