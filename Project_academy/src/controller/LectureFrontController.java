package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import lecture.action.LectureCancelAction;
import lecture.action.LectureChangeStatusAction;
import lecture.action.LectureCreateAction;
import lecture.action.LectureDeleteAction;
import lecture.action.LectureListAction;
import lecture.action.LectureMyLectureAction;
import lecture.action.LectureRating;
import lecture.action.LectureSubmitAction;
import lecture.action.LectureUpdateAction;
import lecture.action.LectureUpdateFormAction;
import lecture.action.LectureViewAction;
import vo.ActionForward;

/**
 * Servlet implementation class LectureFrontController
 */
@WebServlet("*.lec")
public class LectureFrontController extends HttpServlet {
	static int tempIndex = 0;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LectureFrontController() {
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
		
		if (command.equals("/lectureCancelLectureAction.lec")) {
			action = new LectureCancelAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		else if (command.equals("/lectureCreateAction.lec")) {
			action = new LectureCreateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		else if (command.equals("/lectureDeleteAction.lec")) {
			action = new LectureDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if (command.equals("/lectureListAction.lec")) {
			action = new LectureListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//StudentMyLectureAction
		}else if (command.equals("/lectureMyLectureAction.lec")) {
				action = new LectureMyLectureAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}else if (command.equals("/lectureSubmitAction.lec")) {
			action = new LectureSubmitAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/lectureUpdateAction.lec")) {
			action = new LectureUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if (command.equals("/lectureUpdateFormAction.lec")) {
			action = new LectureUpdateFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if (command.equals("/lectureViewAction.lec")) {
			action = new LectureViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/lectureChangeStatusAction.lec")) {
			action = new LectureChangeStatusAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/lectureRating.lec")) {
			action = new LectureRating();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
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
			System.out.println("LecController 에서 nullPointer 오류 (무시해도됨) ");
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
