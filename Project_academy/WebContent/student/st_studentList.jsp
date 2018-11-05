<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.util.*" %>
    <%@page import="student.vo.StudentBean"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
	//StudentBean student = (StudentBean)request.getAttribute("studentList");
	//TeacherViewAction에 있는 update_teacher를 가져옴
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 목록</title>
</head>

<style>
	#studentListArea{
		width: 1050px;
	  	margin: 10px auto;
	  	padding: 10px;
	  	border: 7px solid #72B372;
	  	border-radius: 10px;
	  	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	  	text-align:center;
		color: #444;
	  	background-color: #F0F0F0;
	  	box-shadow: 0 0 20px 0 #000000;
  	}
  	#studentListAreaTitle{
		width: 60%;
	  	margin: 10px auto;
	  	padding: 10px;
	  	border: 7px solid #72B372;
	  	border-radius: 10px;
	  	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	  	text-align:center;
		color: #444;
	  	background-color: #F0F0F0;
	  	box-shadow: 0 0 20px 0 #000000;
  	}
	.hidden{
		display: inline;
		text-align:center;
	}
</style>
<body>
<jsp:include page="/template/template.jsp"/>
		<table id="studentListAreaTitle">
		<tr><td><h2>학생 목록</h2></td></tr>
		</table>
	
		<c:forEach var = "student" items = "${studentList}">
		<table id="studentListArea">
		<tr>
			<td>ID : ${student.student_id }</td>
			<td>이름 : ${student.student_name }</td>
		</tr>
		<tr>
			<td>전화번호 : ${student.student_phone_number }</td>
			<td>생일 : ${student.student_birthday }</td>
		</tr>
		
		<tr>
			<td><a href="studentViewAction.st?id=${student.student_id }">정보 보기</a></td>
	<!-- 
		<c:if test="${session_teacher_id eq 'admin' }">
			<td><a href="studentDeleteAction.st?id=${student.student_id }"><span style="color:red">탈퇴시키기</span></a></td>
		</c:if>
 -->
		</tr>
		</table>
		</c:forEach>
<jsp:include page="/template/footer.jsp"/>
</body>
</html>