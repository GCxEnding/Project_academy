package lecture.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import lecture.svc.LectureCreateService;
import lecture.vo.LectureBean;
import vo.ActionForward;


public class LectureCreateAction implements Action{
	public ActionForward execute (HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		
		
		
		ActionForward forward=new ActionForward();
		LectureBean lecture = new LectureBean();
		
		PrintWriter out = response.getWriter();
		
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
		 //이미지
		//Date.valueOf("2018-09-10");
	
		lecture.setLecture_code(multi.getParameter("lecture_code"));
		lecture.setLecture_teacher_id(multi.getParameter("lecture_teacher_id"));
		lecture.setLecture_name(multi.getParameter("lecture_name"));
		lecture.setLecture_teacher_name(multi.getParameter("lecture_teacher_name"));
		lecture.setLecture_intro(multi.getParameter("lecture_intro"));
		lecture.setLecture_student_current(0); //현재 학생인원은 생성할때 입력할 필요가 없음
		lecture.setLecture_student_limit(Integer.parseInt(multi.getParameter("lecture_student_limit")));
		
	//	lecture.setLecture_start_period(Date.valueOf((String)multi.getAttribute("lecture_start_period")));
		lecture.setLecture_start_period(Date.valueOf(multi.getParameter("lecture_start_period")));
		lecture.setLecture_end_period(Date.valueOf(multi.getParameter("lecture_end_period")));
		lecture.setLecture_cost(Integer.parseInt(multi.getParameter("lecture_cost")));
		lecture.setLecture_image(filename);
		lecture.setLecture_type(multi.getParameter("lecture_type"));
		
		//파일 업로드

		String first = multi.getParameter("lecture_start_time") + ":00";
		String second = multi.getParameter("lecture_end_time") + ":00";
		System.out.println("first : "+first);
		System.out.println("second : "+second);
		lecture.setLecture_start_time(Time.valueOf(first));
		lecture.setLecture_end_time(Time.valueOf(second));

		if(Date.valueOf(multi.getParameter("lecture_start_period")).compareTo
		  (Date.valueOf(multi.getParameter("lecture_end_period"))) >0) {
         out.println("<script>");
         out.println("alert('강의 날짜를 잘못 입력하셨습니다.')");
         out.println("history.back()");
         out.println("</script>");
      }
      
      else if(first.compareTo(second) >0) {
         out.println("<script>");
         out.println("alert('강의 시간을 잘못 입력하셨습니다.')");
         out.println("history.back()");
         out.println("</script>");
      }
		
		/* 문자열 받아서
		 * 뒤에다가 00 붙이고
		 * 시간으로 변환
		 */

		LectureCreateService lectureCreateService = new LectureCreateService();
		boolean createResult = lectureCreateService.createLecture(lecture);
		
		
		if(createResult == false) {
			out.println("<script>");
			out.println("alert('강의 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward.setRedirect(true);
			forward.setPath("./index.jsp");
		}
		
		return forward;
	}
}
