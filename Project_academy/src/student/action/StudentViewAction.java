package student.action;

import java.awt.image.renderable.ParameterBlock;
import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import student.svc.StudentViewService;
import vo.ActionForward;
import student.vo.StudentBean;
import action.Action;

public class StudentViewAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 	throws Exception{
			 	
		   		ActionForward forward = null;
		   		forward = new ActionForward();
		   		/*
		   		 * 8월3일 
		   		 * String viewID=(String)session.getAttribute("session_student_id");를 변경
		   		 * 학생이 내 정보를 볼거면 페이지에서  주소에 학생 아이디를 넘겨주면 되고
		   		 * 강사나 관리자가 학생 정보를 볼거면 목록의 주소에서 넘어온 id를  사용하면 됨.
		   		 * viewID 한줄로 둘다 해결하기 위해서 변경함
		   		 */
		   		
		   		String viewID = request.getParameter("id");
		   		System.out.println("viewID"+viewID);
			   	StudentViewService studentViewService = new StudentViewService();
			  	StudentBean student=studentViewService.getStudent(viewID);
			  	request.setAttribute("student", student);
			  	
			  	//이미지 불러오기
			  	ServletContext context = request.getServletContext();
				String imagePath=context.getRealPath("images");
		    	ParameterBlock pb= new ParameterBlock();
		    	pb.add(imagePath+"/"+student.getStudent_image());
		    	
		    	File file = new File(imagePath+"/"+student.getStudent_image());
		    	//이미지
			    forward.setPath("student/st_studentView.jsp");
		   		return forward;
		}
}



