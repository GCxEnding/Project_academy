package lecture.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import lecture.svc.LectureListService;
import lecture.vo.LectureBean;
import vo.ActionForward;

public class LectureListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		ActionForward forward = null;

		// id에 값이 있으면 아래 실행
		// loginAction에서 설정된 session_lecture_id임.
		String teacher_id = request.getParameter("id");
		//id가 있으면 강사가 자신의 강의목록을 보여줌
		forward = new ActionForward();
		LectureListService lectureListService = new LectureListService();
		ArrayList<LectureBean> lectureList = lectureListService.getLectureList(teacher_id);
		request.setAttribute("lectureList", lectureList);
		// forward.setPath("lecture/tea_lectureList.jsp");
		
		String link = request.getParameter("main"); //메인에서 요청한건지 강의리스트에서 요청한건지 구분할려고
		
		if(link !=null) {
			forward.setPath("Test2.jsp");
			return forward;
		}
		forward.setPath("/lecture/lec_lectureList.jsp");

		return forward;
	}
}
