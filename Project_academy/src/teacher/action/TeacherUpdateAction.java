//teacher/tea_updateForm.jsp에서 입력된 정보를 바탕으로 업데이트를 실행하는 Action


package teacher.action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import teacher.svc.TeacherUpdateService;
import teacher.vo.TeacherBean;
import vo.ActionForward;

public class TeacherUpdateAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		TeacherBean teacher = new TeacherBean();
		boolean updateResult = false;
		
		//이미지 업로드
			ServletContext context = request.getServletContext();
		    String imagePath=context.getRealPath("images");
		    int size = 1*1024*1024;
		    String filename="";
		    MultipartRequest multi = new MultipartRequest(request,
					imagePath, 
					size,
					"UTF-8", 
					new DefaultFileRenamePolicy());
		    try{
		    	Enumeration files=multi.getFileNames();
		    	String file = (String)files.nextElement();
		    	if(multi.getFilesystemName(file) != null) {
		    		filename=multi.getFilesystemName(file);
		    	}
		    }catch(Exception e){
		    	e.printStackTrace();
		    }
		//이미지
		    	
		teacher.setTeacher_id(multi.getParameter("teacher_id"));
		System.out.println("teacher_id : "+teacher.getTeacher_id());
		teacher.setTeacher_password(multi.getParameter("teacher_password"));
		teacher.setTeacher_name(multi.getParameter("teacher_name"));
		teacher.setTeacher_first_address(multi.getParameter("teacher_first_address"));
		teacher.setTeacher_second_address(multi.getParameter("teacher_second_address"));
		teacher.setTeacher_postcode(multi.getParameter("teacher_postcode"));
		teacher.setTeacher_phone_number(multi.getParameter("teacher_phone_number"));
		teacher.setTeacher_gender(multi.getParameter("teacher_gender"));
		teacher.setTeacher_birthday(multi.getParameter("teacher_birthday"));
		teacher.setTeacher_email(multi.getParameter("teacher_email"));
		
		if(filename != null) {
			teacher.setTeacher_image(filename);
		}
		teacher.setTeacher_introduction(multi.getParameter("teacher_introduction"));
		teacher.setTeacher_subject(multi.getParameter("teacher_subject"));
		teacher.setTeacher_position(multi.getParameter("teacher_position"));
		teacher.setTeacher_salary(Integer.parseInt(multi.getParameter("teacher_salary")));

		TeacherUpdateService teacherUpdateService = new TeacherUpdateService();
		updateResult = teacherUpdateService.updateTeacher(teacher);

		ActionForward forward = null;
		PrintWriter out = response.getWriter();
		if (updateResult == false) {
			out.println("<script>");
			out.println("alert('정보 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			//forward.setRedirect(true);
			out.println("<script>");
			out.println("alert('정보 수정 완료!')");
			out.println("location.href='./teacherListAction.tea';");
			out.println("</script>");
			//forward.setPath("/teacherListAction.tea");
		}

		return forward;
	}
}