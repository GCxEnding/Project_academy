package board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import board.svc.BoardListService;
import board.vo.BoardBean;
import board.vo.PageInfo;
import vo.ActionForward;
public class BoardListAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
			ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
		  	int page=1;
			int limit=10;
			String bosech=request.getParameter("bosech");
			
			if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			BoardListService boardListService = new BoardListService();
			int listCount=boardListService.getListCount();
			articleList = boardListService.getSearchList(page,limit,bosech); 
		
	   		int maxPage=(int)((double)listCount/limit+0.95);
	   		
	   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	   
	   	        int endPage = startPage+10-1;

	   		if (endPage> maxPage) endPage= maxPage;

	   		PageInfo pageInfo = new PageInfo();
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("articleList", articleList);
			ActionForward forward= new ActionForward();
	   		forward.setPath("/board/qna_board_list.jsp");
	   		return forward;
	   		
		 }
		 
	 
}