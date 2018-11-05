<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page import="lecture.vo.LectureBean"%>
<%@page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//	String teacher_id = ((String) session.getAttribute("session_teacher_id"));
//	String student_id = ((String) session.getAttribute("session_student_id"));

%>
<!-- 관리자 전용 페이지 -->
<html lang="ko">

  <head>

    <title>Start 학원</title>

  </head>

  <body>
	<jsp:include page="template/template.jsp"/>

		<a href = "/Project_academy/teacher/tea_joinForm.jsp">강사 가입</a><br>
		<a href="/Project_academy/lecture/lec_createForm.jsp">강의 등록 하기</a><br>
		
		<a href="studentListAction.st">학생 목록 액션</a>		

<jsp:include page="template/footer.jsp"/>

  </body>

</html>
