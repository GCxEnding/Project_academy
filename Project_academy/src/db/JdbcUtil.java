package db;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class JdbcUtil {

	public static Connection getConnection() {
		Connection con = null;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/mySQLDB");
			//DataSource ds = (DataSource)envCtx.lookup("jdbc/myHOME");
			con = ds.getConnection();
			con.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close (Connection con) {
		
		try {
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void close(Statement stmt) {
		
		try {
			stmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void close (ResultSet rs) {
		
		try {
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void commit (Connection con) {
		
		try {
			con.commit();
			System.out.println("commit success");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void rollback(Connection con) {
		
		try {
			con.rollback();
			System.out.println("rollback success");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
















