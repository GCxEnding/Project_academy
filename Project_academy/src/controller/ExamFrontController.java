package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import exam.action.ExamInsertAction;
import teacher.action.TeacherLoginAction;
import vo.ActionForward;

/**
 * Servlet implementation class ExamFrontController
 */
@WebServlet("*.exam")
public class ExamFrontController extends HttpServlet {
	static int tempIndex = 0;
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public ExamFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("Teacher" + tempIndex + ". " + command);
		tempIndex++;

		if (command.equals("/examInsertAction.exam.exam")) {
			//forward = new ActionForward();
			// forward.setRedirect(true);
			//forward.setPath("teacher/tea_loginForm.jsp");
			action = new ExamInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			
			}

		} else if (command.equals("/teacherLoginAction.tea")) {
			action = new TeacherLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			
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
				System.out.println("ExamController 에서 nullPointer 오류 (무시해도됨) ");
			}
		}
    }

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
