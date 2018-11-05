<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="lecture.vo.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${lectureList ==null }">
<% 
	
	response.sendRedirect("lectureListAction.lec?main=true");

out.println("<script>");
out.println("alert('탈퇴되었습니다.')");
out.println("location.href='./index.jsp')");
out.println("<script>");
	//강의 목록이 없으면 listAction을 가서 불러옴%>	
</c:if>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Start 학원</title>
</head>
<body>

<jsp:include page="template/template.jsp"/>

<jsp:include page="template/lecture_main.jsp"/>

<jsp:include page="template/footer.jsp"/>
<%
/*
//<c:when test="${session_teacher.id != null }">    얘는 안됨
//<c:when test="${session_teacher_id != null }">    얘는 됨


//<c:when test="${session_teacher.id != null }">    얘는 안됨
//<c:when test="${session_teacher_id != null }">    얘는 됨

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>INDEX</title>
<script>
function confirm_leave(){
    if (confirm('탈퇴하시겠습니까	?')) {
         // Yes click
         location.href='./studentDeleteAction.st?id=${session_student_id }';
    }
}
</script>
</head>
<body>
<c:choose>
	<c:when test="${session_student_id != null }">
		<p>학생 ${session_student_id }으로 로그인</p>
		<a href="studentViewAction.st?id=${session_student_id }">내 정보 보기</a>
		<a href="lectureMyLectureAction.lec?id=${session_student_id }">내 강의 보기</a><br>
		<a href="Calendar.st">내 출결 보기</a><br>
		<a href="student/st_attendForm.jsp">출석하기</a><br>

		<a href="javascript:confirm_leave();">학생 탈퇴</a><br>
		<a href="studentLogoutAction.st">학생 로그아웃</a><br>
		<a href="teacherListAction.tea">강사 먹럭 보기</a><br><br>
	</c:when>
	<c:when test="${session_teacher_id eq 'admin'}">
		<p>관리자로 로그인</p>
		<a href = "teacher/tea_joinForm.jsp">강사 가입</a><br>

		<a href="lecture/lec_createForm.jsp">강의 등록 하기</a><br>
		
		<a href="studentListAction.st">학생 목록 액션</a>		
		<a href="teacherLogoutAction.tea">관리자 로그아웃</a><br>
		<a href="teacherListAction.tea">강사 먹럭 보기</a><br><br>
	</c:when>
	<c:when test="${session_teacher_id != null }">
		<p>강사 ${session_teacher_id }으로 로그인</p>
		<a href="lectureListAction.lec?id=${session_teacher_id }">내 강의 보기</a>
		<a href="teacherListAction.tea">강사 먹럭 보기</a><br><br>
		<a href="teacherLogoutAction.tea">강사 로그아웃</a><br>
	</c:when>
	<c:otherwise>
		<a href="teacherListAction.tea">강사 먹럭 보기</a><br><br>
		<a href="student/st_loginForm.jsp">학섕 로그인</a><br>
		<a href="teacher/tea_loginForm.jsp">강사 로그인</a><br>
		<br><br><br>
		<a href="student/st_joinForm.jsp">학생 가입</a>
	</c:otherwise>
</c:choose>
<a href="lectureListAction.lec">강의 목록 보기</a>
</body>
</html>
*/
%>
</body>
</html>

