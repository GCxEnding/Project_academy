package board.action;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import board.svc.BoardWriteProService;
import board.vo.BoardBean;
import vo.ActionForward;

public class BoardWriteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		HttpSession session = request.getSession();
		
		ActionForward forward=null;
		BoardBean boardBean = null;
		String realFolder="";
		String saveFolder="/boardUpload";
		int fileSize=5*1024*1024;
		String filename="";
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		try{
    		Enumeration files=multi.getFileNames();
    		String file = (String)files.nextElement();
    		System.out.println(file);
    		filename=multi.getFilesystemName(file);
    		if(filename == null) {
    			//filename = "no_File.JPG";
    			filename = "";
    		}
    	}catch(Exception e){
    		System.out.println("게시판 파일 오류");
    		e.printStackTrace();
    	}
		
		boardBean = new BoardBean();
	
		String id = (String)session.getAttribute("session_teacher_id");
		String name = (String)session.getAttribute("session_teacher_name");
		System.out.println("WriteAction의 ID와 이름 :" + id +"\n"+ name);
		
		
		boardBean.setBOARD_ID(id);
		boardBean.setBOARD_NAME(name); 
		boardBean.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
		boardBean.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
		boardBean.setBOARD_FILE(filename);
		
		BoardWriteProService boardWriteProService = new BoardWriteProService();
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);

		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓰기 실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/Project_academy/boardList.bo");
		}

		return forward;
		
	}  	
	
}