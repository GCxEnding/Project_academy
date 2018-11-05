
package comment.action;


import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import board.svc.BoardWriteProService;
import board.vo.BoardBean;
import comment.svc.CommentWriteProService;
import comment.vo.CommentBean;

import javax.servlet.ServletContext;
public class CommentWriteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		CommentBean commentBean = null;
		String realFolder="";
		String saveFolder="/boardUpload";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		commentBean = new CommentBean();
		commentBean.setCOMMENT_NAME(multi.getParameter("COMMENT_NAME"));
		commentBean.setCOMMENT_CONTENT(multi.getParameter("COMMENT_CONTENT"));
		commentBean.setCOMMENT_BOCONUM(multi.getParameter("COMMENT_BOCONUM"));                                                                                            
		CommentWriteProService commentWriteProService = new CommentWriteProService();
		boolean isWriteSuccess = commentWriteProService.registArticle(commentBean);

		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("javascript:history.go(-1)");
		}

		return forward;
		
	}  	
	
}
