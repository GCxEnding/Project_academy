package teacher.action;

import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import teacher.svc.TeacherViewService;
import teacher.vo.TeacherBean;
import vo.ActionForward;

public class TeacherViewAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();

		// loginAction에서 설정된 session_teacher_id임. 여기선 관리자 여부를 확인하기 위해 필요.

		ActionForward forward = null;
/*
		String session_id = null;
		// id에 값이 있으면 아래 실행
		// loginAction에서 설정된 session_teacher_id임.
		//관리자인지 아닌지를 확인하는 구간인데 isAdmin.jsp에 있는 내용으로 ㄱ체를 하는게 좋을거 같다
		if ((String) session.getAttribute("session_teacher_id") != null) {
			session_id = (String) session.getAttribute("session_teacher_id");
			System.out.println("TeacherJoinFormAction session_id:" + session_id);
		} else if (session_id == null || !(session_id.equals("admin"))) {
			// 이 아이디가 null이었거나, 관리자가 아니면 실행
			out.println("<script>");
			out.println("alert('관리자만 접속 할 수 있습니다.')");
			out.println("location.href='./mainPage.main';");
			out.println("</script>");
		}
		*/

		String viewID = (String) request.getParameter("id");
		//이 id는 상세정보보기 페이지에서 날리는 id임

		forward = new ActionForward();
		TeacherViewService teacherViewService = new TeacherViewService();
		TeacherBean teacher = teacherViewService.getTeacher(viewID);
		request.setAttribute("view_teacher", teacher);
		
		//이미지 불러오기
	  	ServletContext context = request.getServletContext();
		String imagePath=context.getRealPath("images");
    	ParameterBlock pb= new ParameterBlock();
    	pb.add(imagePath+"/"+teacher.getTeacher_image());
    	File file = new File(imagePath+"/"+teacher.getTeacher_image());
    	//이미지
    	
		forward.setPath("/teacher/tea_teacherView.jsp");
		return forward;
	}
}
