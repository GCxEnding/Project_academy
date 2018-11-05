<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="lecture.vo.LectureBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//TeacherViewAction에 있는 update_teacher를 가져옴
	String attend = request.getParameter("attend");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Start 학원 - 강의 상세 보기 페이지</title>
</head>
<style>
	#lectureViewArea{
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
<body>

<jsp:include page="/template/template.jsp"/>
<section id = "lectureViewArea" >
<table>
		<tr>
			<td><img src="images/${view_lecture.lecture_image }" height="300px" width="250px"></td>
		</tr>
		<tr>
			<td>강의코드 : ${view_lecture.lecture_code }</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;강의명 : ${view_lecture.lecture_name }</td>
		</tr>
		<tr>
			<td>담당 강사 이름 : ${view_lecture.lecture_teacher_name }</td>
		</tr>
		<tr>
			<td>강의 소개 : ${view_lecture.lecture_intro }</td>
		</tr>
		<tr>
			<td>현재 인원 : ${view_lecture.lecture_student_current }/${view_lecture.lecture_student_limit }</td>
		</tr>
		<tr>
			<td>강의 기간 : ${view_lecture.lecture_start_period } ~ ${view_lecture.lecture_end_period }</td>
		</tr>
		<tr>
			<td>강의 시간 : ${view_lecture.lecture_start_time } ~ ${view_lecture.lecture_end_time }</td>
		</tr>
		<tr>
			<td>비용 : ${view_lecture.lecture_cost }원</td>
		</tr>
		<tr>
			<td>강의 유형 : ${view_lecture.lecture_type }</td>
		</tr>
		<tr>
			<td>강의 평점 : ${view_lecture.lecture_rating }</td>
		</tr>
		<% if(attend.equals("true")){ %>
		<tr>
			<td><a href="javascript:history.back()">뒤로 가기</a></td>
		</tr>
		<% }%>
	</table>
</section>
<jsp:include page="/template/footer.jsp"/>
</body>
</html>