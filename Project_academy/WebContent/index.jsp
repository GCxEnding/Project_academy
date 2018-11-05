<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page import="java.util.*" %>
<%@ page import="lecture.vo.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${lectureList ==null }">
<% response.sendRedirect("lectureListAction.lec?main=true"); 
	//강의 목록이 없으면 listAction을 가서 불러옴%>	
</c:if>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Start 학원 - 첫 페이지</title>
</head>
<body>

<jsp:include page="template/template.jsp"/>

<jsp:include page="template/lecture_main.jsp"/>

<jsp:include page="template/footer.jsp"/>
</body>
</html>
