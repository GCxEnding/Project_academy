package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import teacher.action.TeacherDeleteAction;
import teacher.action.TeacherJoinAction;
import teacher.action.TeacherJoinFormAction;
import teacher.action.TeacherListAction;
import teacher.action.TeacherLoginAction;
import teacher.action.TeacherLogoutAction;
import teacher.action.TeacherMyStudentAction;
import teacher.action.TeacherUpdateAction;
import teacher.action.TeacherUpdateFormAction;
import teacher.action.TeacherViewAction;
import vo.ActionForward;

/**
 * Servlet implementation class TeacherFrontController
 */
@WebServlet("*.tea")
public class TeacherFrontController extends HttpServlet {
	static int tempIndex = 0;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TeacherFrontController() {
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

		System.out.println("Teacher" + tempIndex + ". " + command);
		tempIndex++;

		if (command.equals("/teacherLogin.tea")) {
			forward = new ActionForward();
			// forward.setRedirect(true);
			forward.setPath("teacher/tea_loginForm.jsp");

		} else if (command.equals("/teacherLoginAction.tea")) {
			action = new TeacherLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		else if (command.equals("/teacherLogoutAction.tea")) {
			action = new TeacherLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();

			}

			// 아래부터 강사 가입 부분
		} else if (command.equals("/teacherJoin.tea")) {
			forward = new ActionForward();
			forward.setPath("teacher/tea_joinForm.jsp");

		} else if (command.equals("/teacherJoinAction.tea")) {
			action = new TeacherJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 아래부터 강사 수정 부분
		} else if (command.equals("/teacherUpdate.tea")) {
			forward = new ActionForward();
			forward.setPath("teacher/tea_updateForm.jsp");

		} else if (command.equals("/teacherUpdateFormAction.tea")) {
			action = new TeacherUpdateFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/teacherUpdateAction.tea")) {
			action = new TeacherUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 아래부터 강사 목록 부분
		else if (command.equals("/teacherList.tea")) {
			forward = new ActionForward();
			forward.setPath("teacher/tea_teacherList.jsp");

		} else if (command.equals("/teacherListAction.tea")) {
			action = new TeacherListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/teacherView.tea")) {
			forward = new ActionForward();
			forward.setPath("teacher/tea_teacherView.jsp");
		}

		else if (command.equals("/teacherViewAction.tea")) {
			action = new TeacherViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/teacherMyStudentAction.tea")) {
			action = new TeacherMyStudentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 아래부터 강사 삭제 부분
		else if (command.equals("/teacherDeleteAction.tea")) {
			action = new TeacherDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
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
