//회원들이 내 강의가 무엇인지 보는 역할
//학생과 강사 둘 다 쓸 수 있는 공용 액션이며 페이지 연결은 (일단은)따로해줌.
/*
 * 학생과 강사 두개의 세션 아이디를 확인해야되고 받아갈 내용은 똑같고 페이지 내용만 다
 */
package lecture.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import lecture.svc.LectureMyLectureService;
import lecture.vo.LectureBean;
import vo.ActionForward;

public class LectureMyLectureAction implements Action{
	public ActionForward execute (HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		ActionForward forward = new ActionForward();
		
		String MyID = request.getParameter("id"); //학생일경우 ID를 받음
		//session으로 변경해도 상관업을듯
		
		
		String attend = request.getParameter("attend");
		if(attend == null) {
			attend="";
		}
		
		System.out.println(attend);
		
		
		String studentID=(String)session.getAttribute("session_student_id");
		if( studentID != null) {
		//학생이 로그인 되어 있는 경우라면, 
			MyID = studentID;
		}

		if (MyID == null) {
			out.println("<script>");
			out.println("alert('아이디를 받지 못했습니다')");
			System.out.println("아이디를 받지 못했습니다");
			out.println("history.back()");
			out.println("</script>");
		}
		LectureMyLectureService lectureMyLectureService = new LectureMyLectureService();
		ArrayList<LectureBean> lectureList = lectureMyLectureService.getLectureList(MyID);
		request.setAttribute("st_lectureList", lectureList);

		if(lectureList.size() == 0){
			out.println("<script>");
			out.println("alert('신청된 강의가 없습니다.')");
			
			if(attend.equals("true")) //출석 화면에서 클릭한것이면 창을 닫아버림
				out.println("window.close()");
			else //메인에서 요청한 페이지면 다시 메인으로
				out.println("location.href='index.jsp'");
			
			out.println("</script>");
		} else {
			forward.setPath("/student/st_lectureList.jsp");
		}
		//	System.out.println(lectureList.get(1));
		// forward.setPath("lecture/tea_lectureList.jsp");
		
		return forward;
	}
	
}
