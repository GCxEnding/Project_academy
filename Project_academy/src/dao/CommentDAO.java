package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import board.vo.BoardBean;
import comment.vo.CommentBean;

public class CommentDAO {

	DataSource ds;
	Connection con;
	private static CommentDAO commentDAO;

	private CommentDAO() {
		// TODO Auto-generated constructor stub
	}

	public static CommentDAO getInstance() {
		if (commentDAO == null) {
			commentDAO = new CommentDAO();
		}
		return commentDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int selectListCount() {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			// select count(*) from board where BOARD_SUBJECT like 'bosech %';
			pstmt = con.prepareStatement("select count(*) from bocomment");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("selectListCount 실패 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	public CommentBean selectArticle(int commnet_num) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentBean commentBean = null;

		try {
			pstmt = con.prepareStatement("select * from bocomment where COMMENT_NUM = ?");
			pstmt.setInt(1, commnet_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				commentBean = new CommentBean();
				commentBean.setCOMMENT_NUM(rs.getInt("COMMENT_NUM"));
				commentBean.setCOMMENT_NAME(rs.getString("COMMENT_NAME"));
				commentBean.setCOMMENT_CONTENT(rs.getString("COMMENT_CONTENT"));
			}
		} catch (Exception ex) {
			System.out.println("selectArticle 오류 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return commentBean;

	}

	public ArrayList<CommentBean> selectArticleList(int page, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String comment_list_sql = "select * from bocomment order by COMMENT_RE_REF desc,COMMEN_RE_SEQ asc limit ?,10";
		ArrayList<CommentBean> articleList = new ArrayList<CommentBean>();
		CommentBean comment = null;
		int startrow = (page - 1) * 10;

		try {
			pstmt = con.prepareStatement(comment_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				comment = new CommentBean();
				comment.setCOMMENT_NUM(rs.getInt("COMMENT_NUM"));
				comment.setCOMMENT_NAME(rs.getString("COMMENT_NAME"));
				comment.setCOMMENT_CONTENT(rs.getString("COMMENT_CONTENT"));
				comment.setCOMMENT_RE_REF(rs.getInt("COMMENT_RE_REF"));
				comment.setCOMMENT_RE_LEV(rs.getInt("COMMENT_RE_LEV"));
				comment.setCOMMENT_RE_SEQ(rs.getInt("COMMENT_RE_SEQ"));

				articleList.add(comment);
			}

		} catch (Exception ex) {
			System.out.println("selectArticleList 오류 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	public int insertArticle(CommentBean article) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement("select max(comment_num) from bocomment");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into bocomment (COMMENT_NUM, COMMENT_BOCONUM, COMMENT_NAME, COMMENT_PASS, ";
			sql += "COMMENT_CONTENT, COMMENT_RE_REF, COMMENT_RE_LEV, COMMENT_RE_SEQ) values(?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getCOMMENT_BOCONUM());
			pstmt.setString(3, article.getCOMMENT_NAME());
			pstmt.setString(4, article.getCOMMENT_PASS());
			pstmt.setString(5, article.getCOMMENT_CONTENT());
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);

			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("insertArticle 오류 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

}