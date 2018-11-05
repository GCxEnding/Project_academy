package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import board.svc.BoardModifyProService;
import board.vo.BoardBean;
import vo.ActionForward;

public class BoardModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward forward = null;
		boolean isModifySuccess = false;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		
		String page = request.getParameter("page");
		System.out.println("BoardModify의 page: " + page);
		int board_num=Integer.parseInt(request.getParameter("BOARD_NUM")); //게시판 글 번호
		BoardBean article=new BoardBean();
		BoardModifyProService boardModifyProService = new BoardModifyProService();
		//boolean isRightUser=boardModifyProService.isArticleWriter(board_num, request.getParameter("BOARD_PASS"));

		/*
		if(!isRightUser){
			
			out.println("<script>");
			out.println("alert('수정할수 없는 유저입니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		*/

		article.setBOARD_NUM(board_num);
		article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		System.out.println("BoardModifyProAction의 subjecyt: "+(request.getParameter("BOARD_SUBJECT")));
		article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		System.out.println("BoardModifyProAction의 content: "+(request.getParameter("BOARD_CONTENT")));
		isModifySuccess = boardModifyProService.modifyArticle(article);

		if (!isModifySuccess) {
			out.println("<script>");
			out.println("alert('글 수정 실패');");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardDetail.bo?board_num=" + article.getBOARD_NUM()+"&page="+page);
		}

		return forward;
	}

}