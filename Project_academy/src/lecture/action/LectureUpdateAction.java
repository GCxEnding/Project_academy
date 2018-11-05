package lecture.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import lecture.svc.LectureUpdateService;
import lecture.vo.LectureBean;
import vo.ActionForward;

public class LectureUpdateAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		String isMain = request.getParameter("where");
		//널 포인터 오류 방지
		if(isMain == null)
			isMain="";
		
		LectureBean lecture = new LectureBean();
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
		    	
		lecture.setLecture_code(multi.getParameter("lecture_code"));
		lecture.setLecture_teacher_id(multi.getParameter("lecture_teacher_id"));
		lecture.setLecture_name(multi.getParameter("lecture_name"));
		
		lecture.setLecture_teacher_name(multi.getParameter("lecture_teacher_name"));
		lecture.setLecture_intro(multi.getParameter("lecture_intro"));
		
		lecture.setLecture_student_limit(Integer.parseInt(multi.getParameter("lecture_student_limit")));
		lecture.setLecture_start_period(Date.valueOf(multi.getParameter("lecture_start_period")));
		lecture.setLecture_end_period(Date.valueOf(multi.getParameter("lecture_end_period")));
		if(filename != null) {
			lecture.setLecture_image(filename);
		}
		lecture.setLecture_cost(Integer.parseInt(multi.getParameter("lecture_cost")));
		lecture.setLecture_type(multi.getParameter("lecture_type"));

		String first = multi.getParameter("lecture_start_time");
		String second = multi.getParameter("lecture_end_time");
		System.out.println("first : "+first);
		System.out.println("second : "+second);
		
		try {
			lecture.setLecture_start_time(Time.valueOf(first));
			lecture.setLecture_end_time(Time.valueOf(second));
		}catch (IllegalArgumentException e) {
			first += ":00";
			second += ":00";
			lecture.setLecture_start_time(Time.valueOf(first));
			lecture.setLecture_end_time(Time.valueOf(second));
			System.out.println("first : "+first);
			System.out.println("second : "+second);
		}

		LectureUpdateService lectureUpdateService = new LectureUpdateService();
		updateResult = lectureUpdateService.updateLecture(lecture);

		
		if (updateResult == false) {
			out.println("<script>");
			out.println("alert('강의 수정 실패')");
			System.out.println("강의 수정 실패!");
			out.println("history.back()");
			out.println("</script>");
		} else {
		//수정에 성공했다면
			if (isMain.equals("main")) {
				// 수정에 성공했고, 메인화면에서 왔으면 메인 화면으로 감
				out.println("<script>");
				out.println("alert('정보 수정 완료!')");
				out.println("location.href='./index.jsp';");
				out.println("</script>");
			} else {
				// 수정에 성공했고, 메인에서 온게 아니면 강의 목록 페이지로
				out.println("<script>");
				out.println("alert('정보 수정 완료!')");
				out.println("location.href='./lectureListAction.lec';");
				out.println("</script>");
			}
		}
		// 스크립트 안에 if가 들어가도 되는지 몰라서 일단 따로 구분함

		return forward;
	}
}
