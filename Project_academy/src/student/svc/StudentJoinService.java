package student.svc;

import student.vo.StudentBean;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.StudentDAO;

public class StudentJoinService {
	public boolean joinStudent(StudentBean student) {
		boolean joinSuccess = false;
		StudentDAO studentDAO = StudentDAO.getInstance();
		Connection con = getConnection();
		studentDAO.setConnection(con);
		int insertCount = studentDAO.insertStudent(student);
		if(insertCount > 0){
			joinSuccess = true;
			commit(con);
		}
		else{
			rollback(con);
		}
		close(con);
		return joinSuccess;
	}
}
