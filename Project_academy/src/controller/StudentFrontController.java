package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import student.action.StudentAttendAction;
import student.action.StudentCalendarAction;
import student.action.StudentDeleteAction;
import student.action.StudentJoinAction;
import student.action.StudentJoinFormAction;
import student.action.StudentListAction;
import student.action.StudentLoginAction;
import student.action.StudentLogoutAction;
import student.action.StudentUpdateAction;
import student.action.StudentUpdateFormAction;
import student.action.StudentViewAction;
import vo.ActionForward;

/**
 * Servlet implementation class StudentFrontController
 */
@WebServlet("*.st")

public class StudentFrontController extends HttpServlet {
	static int tempIndex = 0;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("Lecture" + tempIndex + ". " + command);
		tempIndex++;

		if (command.equals("/studentLogin.st")) {
			forward = new ActionForward();
			forward.setPath("student/st_loginForm.jsp");

		} else if (command.equals("/studentJoinAction.st")) {
			action = new StudentJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/studentLoginAction.st")) {
			action = new StudentLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/Calendar.st")) {
			action = new StudentCalendarAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/studentViewAction.st")) {
			action = new StudentViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		else if (command.equals("/studentLogoutAction.st")) {
			action = new StudentLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 아래부터 학생 가입 부분
		} else if (command.equals("/studentJoin.st")) {
			forward = new ActionForward();
			forward.setPath("student/st_joinForm.jsp");

		} else if (command.equals("/studentJoinFormAction.st")) {
			action = new StudentJoinFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/studentJoinAction.st")) {
			action = new StudentJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 아래부터 학생 수정 부분
		} else if (command.equals("/studentUpdate.st")) {
			forward = new ActionForward();
			forward.setPath("student/st_updateForm.jsp");

		} else if (command.equals("/studentUpdateFormAction.st")) {
			action = new StudentUpdateFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/studentUpdateAction.st")) {
			action = new StudentUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/studentUpdateFormAction.st")) {
			action = new StudentUpdateFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/studentAttendAction.st")) {
			action = new StudentAttendAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/studentAttend.st")) {
			forward = new ActionForward();
			forward.setPath("student/st_attendForm.jsp");
		}

		else if (command.equals("/Calendar.st")) {
			action = new StudentCalendarAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 아래부터 강사 목록 부분
		} else if (command.equals("/studentList.st")) {
			forward = new ActionForward();
			forward.setPath("student/st_studentList.jsp");

		} else if (command.equals("/studentListAction.st")) {
			action = new StudentListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/studentView.st")) {
			forward = new ActionForward();
			forward.setPath("student/st_studentView.jsp");
		}

		else if (command.equals("/studentViewAction.st")) {
			action = new StudentViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 아래부터 강사 삭제 부분
		else if (command.equals("/studentDeleteAction.st")) {
			action = new StudentDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/studentDelete.st")) {
			forward = new ActionForward();
			forward.setPath("student/st_deleteForm.jsp");
		}

		try {
			if (forward != null) {
				if (forward.isRedirect()) {
					response.sendRedirect(forward.getPath());
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
		} catch (NullPointerException e) {
			System.out.println("TeaController 에서 nullPointer 오류 (무시해도됨) ");
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
