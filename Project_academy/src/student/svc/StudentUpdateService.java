package student.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.StudentDAO;
import student.vo.StudentBean;

public class StudentUpdateService {

	public boolean updateStudent(StudentBean student) {
		// TODO Auto-generated method stub
		boolean updateSuccess = false;
		StudentDAO studentDAO = StudentDAO.getInstance();
		Connection con = getConnection();
		studentDAO.setConnection(con);
		int updateCount = studentDAO.updateStudent(student);
		System.out.println("StudentUpdateService's updatecount: "+updateCount);
		
		if(updateCount == 1) {
			updateSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return updateSuccess;
	}

}
