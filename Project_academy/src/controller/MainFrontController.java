package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;

/**
 * Servlet implementation class MainFrontController
 */
@WebServlet("*.main")
public class MainFrontController extends HttpServlet {
	static int tempIndex=0;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainFrontController() {
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

		System.out.println("Main" +tempIndex+ ". "+command); tempIndex++;

		if (command.equals("/mainPage.main")) {
			forward = new ActionForward();
			forward.setPath("main.jsp");

		} else if (command.equals("/academyManage.main")) {
			forward = new ActionForward();
			forward.setPath("academyManage.jsp");

			// 경로문제가 방생하면 다이렉트로 넘기지마셈?
		} else if (command.equals("/teacherLogin.main")) {
			forward = new ActionForward();
			forward.setPath("teacher/tea_loginForm.jsp");
		}
		else if (command.equals("/index.main")) {
			forward = new ActionForward();
			forward.setPath("index.jsp");
		}
		if (forward != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);

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
