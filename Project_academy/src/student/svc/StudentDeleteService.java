package student.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.StudentDAO;
import dao.TeacherDAO;

public class StudentDeleteService {

	public boolean deleteStudent(String deleteId) {
		// TODO Auto-generated method stub
		boolean deleteResult = false;
		Connection con = getConnection();
		StudentDAO studentDAO = StudentDAO.getInstance();
		studentDAO.setConnection(con);

		int deleteCount = studentDAO.deleteStudent(deleteId);

		// >0을 ==1로 변경함. 하나만 삭제되어야 하니까..
		if (deleteCount > 0) {
			deleteResult = true;
			System.out.println("Student DeleteCount :"+deleteCount+"개");
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return deleteResult;
	}

}
