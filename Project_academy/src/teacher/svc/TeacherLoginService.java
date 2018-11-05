package teacher.svc;

import static db.JdbcUtil.*;


import java.sql.Connection;

import dao.TeacherDAO;
import teacher.vo.TeacherBean;

public class TeacherLoginService {
	public TeacherBean login(TeacherBean teacher) {
		Connection con = getConnection();
		TeacherDAO teacherDAO = TeacherDAO.getInstance();
		teacherDAO.setConnection(con);
		
		TeacherBean loginInfo=teacherDAO.selectLoginId(teacher);
		//잘못된 아이디나 입력한게 틀렸을 경우 - 빈칸으로 지정하고 넘겨줌.

		close(con);
		return loginInfo;
	}
}
