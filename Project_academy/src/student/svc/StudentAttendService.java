package student.svc;

import student.vo.StudentAttendBean;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.StudentDAO;
import student.action.StudentAttendAction;

public class StudentAttendService {
	public boolean AttendStudent(StudentAttendBean student, String state) {
		boolean AttendSuccess = false;
		StudentDAO studentDAO = StudentDAO.getInstance();
		Connection con = getConnection();
		studentDAO.setConnection(con);
		int insertCount=0;
		int updateCount=0;
		StudentAttendAction attendAction = new StudentAttendAction();
		
		if(state.equals("입실") || state.equals("결석") || state.equals("휴가") || state.equals("기타")) {
			insertCount = studentDAO.insertAttendStudent(student);
		}else if(state.equals("퇴실") || state.equals("조퇴") || state.equals("외출")){
			updateCount = studentDAO.updateAttendStudent(student);
		}
		
		if(insertCount > 0 || updateCount >0){
			AttendSuccess = true;
			commit(con);
		}
		else{
			rollback(con);
		}
		close(con);
		return AttendSuccess;
	}
}
