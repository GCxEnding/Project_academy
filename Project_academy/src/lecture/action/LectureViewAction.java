package lecture.action;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import lecture.svc.LectureViewService;
import lecture.vo.LectureBean;
import vo.ActionForward;

public class LectureViewAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		ActionForward forward = null;

		String viewID = (String) request.getParameter("id");
		//이 id는 강의 상세정보 jsp에서 날리는 id임

		forward = new ActionForward();
		LectureViewService lectureViewService = new LectureViewService();
		LectureBean lecture = lectureViewService.getLecture(viewID);
		request.setAttribute("view_lecture", lecture);
		
		//이미지 불러오기
	  	ServletContext context = request.getServletContext();
		String imagePath=context.getRealPath("images");
    	ParameterBlock pb= new ParameterBlock();
    	pb.add(imagePath+"/"+lecture.getLecture_image());
    	
    	File file = new File(imagePath+"/"+lecture.getLecture_image());
    	//이미지
    	
		forward.setPath("/lecture/lec_lectureView.jsp");
		return forward;
	}
}
