package student.action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import student.svc.StudentUpdateService;
import student.vo.StudentBean;
import student.svc.StudentUpdateService;
import student.vo.StudentBean;
import vo.ActionForward;

public class StudentUpdateAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		StudentBean student = new StudentBean();
		boolean updateResult = false;
		
		HttpSession session = request.getSession();
		String session_id = (String) session.getAttribute("session_student_id");
		
		//System.out.println("뭐가나올까:"+(String) session.getAttribute("session_student_id"));
		if (session_id == null) {
			session_id = request.getParameter("student_id");
		}
		
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
    	
    	System.out.println("password : " + multi.getParameter("student_password"));
		student.setStudent_id(session_id);
		student.setStudent_password(multi.getParameter("student_password"));
		student.setStudent_name(multi.getParameter("student_name"));
		student.setStudent_first_address(multi.getParameter("student_first_address"));
		student.setStudent_second_address(multi.getParameter("student_second_address"));
		
		student.setStudent_postcode(multi.getParameter("student_postcode"));
		student.setStudent_phone_number(multi.getParameter("student_phone_number"));
		student.setStudent_gender(multi.getParameter("student_gender"));
		student.setStudent_birthday(multi.getParameter("student_birthday"));
		student.setStudent_email(multi.getParameter("student_email"));
		
		if(filename != null) {
			student.setStudent_image(filename);
		}
		student.setStudent_introduction(multi.getParameter("student_introduction"));
		
		StudentUpdateService studentUpdateService = new StudentUpdateService();
		updateResult = studentUpdateService.updateStudent(student);
		ActionForward forward = null;
		PrintWriter out = response.getWriter();
		if (updateResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			
			out.println("<script>");
			out.println("alert('정보 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			out.println("<script>");
			out.println("alert('정보 수정 완료')");
			out.println("</script>");
			forward.setPath("studentViewAction.st?id=" + session_id);
		}

		return forward;
	}
}
