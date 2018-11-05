package comment.svc;

import java.sql.Connection;
import dao.CommentDAO;
import comment.vo.CommentBean;
import static db.JdbcUtil.*;
public class CommentWriteProService {

	public boolean registArticle(CommentBean commentBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.setConnection(con);
		int insertCount = commentDAO.insertArticle(commentBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}