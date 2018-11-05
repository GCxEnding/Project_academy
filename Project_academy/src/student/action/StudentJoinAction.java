package student.action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import student.svc.StudentJoinService;
import student.vo.StudentBean;
import vo.ActionForward;


public class StudentJoinAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		StudentBean student = new StudentBean();
		boolean joinResult=false;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ActionForward forward = null;
		
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
    		System.out.println(file);
    		filename=multi.getFilesystemName(file);
    		if(filename == null) {
    			filename = "Koala.jpg";
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}
		
		student.setStudent_id(multi.getParameter("student_id"));
		System.out.println(multi.getParameter("student_id"));
		student.setStudent_password(multi.getParameter("student_password"));
		student.setStudent_name(multi.getParameter("student_name"));
		student.setStudent_first_address(multi.getParameter("student_first_address"));
		student.setStudent_second_address(multi.getParameter("student_second_address"));
		student.setStudent_image(filename);
		student.setStudent_postcode(multi.getParameter("student_postcode"));
		student.setStudent_phone_number(multi.getParameter("student_phone_number"));
		student.setStudent_gender(multi.getParameter("student_gender"));
		student.setStudent_birthday(multi.getParameter("student_birthday"));
		student.setStudent_email(multi.getParameter("student_email"));
		student.setStudent_introduction(multi.getParameter("student_introduction"));
		
		StudentJoinService studentJoinService = new StudentJoinService();
		joinResult=studentJoinService.joinStudent(student);
		PrintWriter out = response.getWriter();
		
		if(joinResult == false) {
   			out.println("<script>");
   			out.println("alert('가입에 실패했습니다.')");
   			out.println("history.back()");
   			out.println("</script>");
		}else{
			out.println("<script>");
   			out.println("alert('가입되었습니다.')");
   			out.println("location.href='./index.jsp'");
   			out.println("</script>");
	   	}
	   	return forward;		
	}
}
