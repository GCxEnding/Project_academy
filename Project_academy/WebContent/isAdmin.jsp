<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% /*
    	관리자인지 확인할 용도로 쓸 페이지이며 include해서 사용할 예정 
		<jsp:include page = /isAdmin.jsp flush="false"> 로 사용
		*/
		
		//추후 얘를 사용할 페이지
		/*
		tea_joinForm
		academyManage
		teacherList,action
		teacherView,action
		*/
	%>

<%
/*

String session_id = ((String)session.getAttribute("session_student_id"));

if (session_id == null) { 
	out.println("<script>");
	out.println("alert('로그인이 필요합니다.')");
	out.println("location.href='student/st_loginForm.jsp';");
	out.println("</script>");
}

*/




/*
String session_id = ((String)session.getAttribute("session_teacher_id"));

if (session_id == null || !(session_id.equals("admin"))) { 
	out.println("<script>");
	out.println("alert('관리자만 접속 할 수 있습니다.')");
	out.println("location.href='index.jsp';");
	out.println("</script>");
}

// /는 한단계 상위 경로
	//는 최상위 경로



	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	String session_id = ((String)session.getAttribute("session_teacher_id"));

	if (session_id == null || !(session_id.equals("admin"))) { 
		out.println("<script>");
		out.println("alert('관리자만 접속 할 수 있습니다.')");
		//out.println("location.href='../mainPage.main';");
		out.println("location.href='../index.jsp';");
		out.println("</script>");
	}
	*/
	%>