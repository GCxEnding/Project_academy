//첫 시험 정보를 입력할때 사용할 액션
package exam.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import exam.service.ExamInsertService;
import exam.vo.ExamBean;
import lecture.svc.LectureCreateService;
import lecture.vo.LectureBean;
import vo.ActionForward;

public class ExamInsertAction implements Action{
	public ActionForward execute (HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		ActionForward forward=new ActionForward();
		ExamBean exam = new ExamBean();
		
		exam.setExamInfo_lec_code(request.getParameter("lecCode")); // 강의 코드
		exam.setExamInfo_teacher_id((String)session.getAttribute("session_teacher_id"));
		exam.setExamInfo_exam_type(request.getParameter("examtype"));
		//exam.setExamInfo_date(examInfo_date);
		//exam.setExamInfo_score(examInfo_score);
		
		
		
		
		
		
		//exam.setExamInfo_student_id(examInfo_student_id);
		
		System.out.println("ExamInsertACtion의 lecCode: " +exam.getExamInfo_lec_code()
				+"\n만약 못받으면 manageexam.jsp에서 코드를 못보내는것임.");
		String point = request.getParameter("point"); //성적
		String student_ID = request.getParameter("status_ID"); // 학생 아이디
		
		
		
		
		
		
	
		boolean isInsert = false; //첫 성적 입력을 구분할 변수
		ExamInsertService examInsertService = new ExamInsertService();
		
	
		
		
		//성적 입력이 처음이면 insertSVC를 호출하게 변경
		if(request.getParameter("point") == null) {
			int point1 = Integer.parseInt(request.getParameter("point"));
			boolean insertResult = examInsertService.insertExam(point1,student_ID,exam.getExamInfo_lec_code());
		}  else {
		//성적 입력이 처음이 아니라면 updateSVC를 호출함
			int point1 = Integer.parseInt(request.getParameter("point"));
			boolean insertResult = examInsertService.updateExam(point1,student_ID,exam.getExamInfo_lec_code());
		}
		

		forward.setPath("시험등록하는페이지로");
		//아마 자바스크립트 새로고침 활용해서 넘기는게 좋을듯
		return forward;
	}
}
