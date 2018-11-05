<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="teacher.vo.TeacherBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	Teacher에 대한 상세정보를 보여주는 페이지
	 TEACHER VIEW
 -->

<%
	String session_id = ((String) session.getAttribute("session_teacher_id"));
/*
	if (session_id == null || !(session_id.equals("admin"))) {
		out.println("<script>");
		out.println("alert('관리자만 접속 할 수 있습니다.')");
		out.println("location.href='./mainPage.main';");
		out.println("</script>");
	}
*/
	TeacherBean teacher = (TeacherBean) request.getAttribute("view_teacher");
	//TeacherViewAction에 있는 update_teacher를 가져옴
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 상세 정보</title>
</head>
<style>
	#teacherViewArea{
		width: 80%;
	  	margin: 10px auto;
	  	padding: 10px;
	  	border: 7px solid #72B372;
	  	border-radius: 10px;
	  	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
		color: #444;
	  	background-color: #F0F0F0;
	  	box-shadow: 0 0 20px 0 #000000;
  	}
</style>
<jsp:include page="/template/template.jsp"/>
<body>
<section id="teacherViewArea">
	<table>
		<tr>
			<td>강사명 : ${view_teacher.teacher_name }</td>
		</tr>
		
		<c:if test="${session_teacher_id != null }">
		<tr>
			<td>지번주소 : ${view_teacher.teacher_first_address }</td>
		</tr>
		<tr>
			<td>상세주소 : ${view_teacher.teacher_second_address }</td>
		</tr>
		<tr>
			<td>우편번호 : ${view_teacher.teacher_postcode }</td>
		</tr>
		<tr>
			<td>생년월일 : ${view_teacher.teacher_birthday }</td>
		</tr>
		</c:if>
		<tr>
			<td>전화번호 : ${view_teacher.teacher_phone_number }</td>
		</tr>
		<tr>
			<td>성별 : ${view_teacher.teacher_gender }</td>
		</tr>
		<tr>
			<td>이메일 : ${view_teacher.teacher_email }</td>
		</tr>
		<tr>
			<td>사진 : <img src="images/${view_teacher.teacher_image }"></td>
		</tr>
		<tr>
			<td>강사 소개 : ${view_teacher.teacher_introduction }</td>
		</tr>
		<tr>
			<td>담당 과목 : ${view_teacher.teacher_subject }</td>
		</tr>
		<c:if test="${session_teacher_id != null }">
		<tr>
			
			<td><a href = "teacherUpdateFormAction.tea?id=${teacher.teacher_id }">수정</a></td>
		</tr>
		</c:if>
	</table>
</section>
	<jsp:include page="/template/footer.jsp"/>
</body>
</html>