<!-- 강사 강의목록의 자식창, 시험 정보를 입력하는 용도 -->
<%@page import="exam.vo.ExamBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<select name="examtype">
	<option value="중간고사">중간고사</option>
	<option value="기말고사">기말고사</option>
	<option value="재시험">재시험</option>
	<option value="기타">기타</option>
</select>

</body>
</html>