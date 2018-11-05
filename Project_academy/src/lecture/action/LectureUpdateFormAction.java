package lecture.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import lecture.svc.LectureSelectService;
import lecture.vo.LectureBean;
import vo.ActionForward;

public class LectureUpdateFormAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		ActionForward forward = new ActionForward();
		
		// loginAction에서 설정된 session_teacher_id임.
		String session_id = ((String)session.getAttribute("session_teacher_id"));

		//where 변수가 없으면 null포인트 오류가 뜨지않게 빈칸으로 바꿈
		
				
		if (session_id == null || !(session_id.equals("admin"))) { 
			out.println("<script>");
			out.println("alert('관리자만 접속 할 수 있습니다.')");
			out.println("location.href='./mainPage.main';");
			out.println("</script>");
		}
		LectureSelectService lectureSelectService = new LectureSelectService();
		String lecCode = request.getParameter("id");//강의 목록을 누를때 받아올 강의코드임.

		LectureBean lecture = lectureSelectService.selectLecture(lecCode);
		//selectservice는 id를 토대로 모든 정보를 가져옴.
		request.setAttribute("update_lecture", lecture);
		
		
		//메인화면에서 온건지 아닌지 구분함, 메인에서 온거면 where변수를 넘겨줌
		String isMain = request.getParameter("where");
		String path = "/lecture/lec_updateForm.jsp";
		if(isMain != null) {
			path += "?where=main";
		}

		forward.setPath(path);
		return forward;
	}
}
