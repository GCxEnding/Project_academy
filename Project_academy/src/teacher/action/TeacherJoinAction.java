package teacher.action;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import teacher.svc.TeacherJoinService;
import teacher.vo.TeacherBean;
import vo.ActionForward;

public class TeacherJoinAction implements Action	{
	public ActionForward execute (HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		
		TeacherBean teacher = new TeacherBean();
		boolean joinResult = false;
		ActionForward forward= new ActionForward();
		
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
    	
		teacher.setTeacher_id(multi.getParameter("teacher_id"));
		teacher.setTeacher_password(multi.getParameter("teacher_password"));
		teacher.setTeacher_name(multi.getParameter("teacher_name"));
		teacher.setTeacher_first_address(multi.getParameter("teacher_first_address"));
		teacher.setTeacher_second_address(multi.getParameter("teacher_second_address"));

		teacher.setTeacher_postcode(multi.getParameter("teacher_postcode"));
		teacher.setTeacher_phone_number(multi.getParameter("teacher_phone_number"));
		teacher.setTeacher_gender(multi.getParameter("teacher_gender"));
		teacher.setTeacher_birthday(multi.getParameter("teacher_birthday"));
		teacher.setTeacher_email(multi.getParameter("teacher_email"));
		
		teacher.setTeacher_image(filename);
		teacher.setTeacher_introduction(multi.getParameter("teacher_introduction"));
		teacher.setTeacher_subject(multi.getParameter("teacher_subject"));
		teacher.setTeacher_position(multi.getParameter("teacher_position"));
		System.out.println("직급이 문제다" + multi.getParameter("teacher_position"));
		System.out.println("샐러리가 문제다" + multi.getParameter("teacher_salary"));
		
		//연봉에 미 입력시의 오류를 해결하기위해 0을 강제 삽입하는 구문
		if(multi.getParameter("teacher_salary").equals(""))
			teacher.setTeacher_salary(0);
		else
			teacher.setTeacher_salary(Integer.parseInt(multi.getParameter("teacher_salary")));
		
		TeacherJoinService teacherJoinService = new TeacherJoinService();
		joinResult = teacherJoinService.joinTeacher(teacher);
		PrintWriter out = response.getWriter();
		
		if(joinResult == false) {
			out.println("<script>");
			out.println("alert('강사 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('강사 등록 성공')");
			out.println("location.href='/Project_academy/index.jsp';");
			out.println("</script>");
		}
		return forward;
	}
}
