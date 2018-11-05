<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${session_student_id eq null }">
	<script>
		alert('학생 ID로 로그인이 필요합니다.');
		location.href="index.jsp";
	</script>
</c:if>

<%
	String attend = request.getParameter("attend");
	if(attend == null)
		attend="false";
	System.out.println(attend);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Start 학원 - 내 강의 목록</title>
</head>

<style>
	#lectureListViewArea{
		width: 80%;
	  	margin: 10px auto;
	  	padding: 10px;
	  	border: 7px solid #72B372;
	  	border-radius: 10px;
	  	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	  	text-align : center;
		color: #444;
	  	background-color: #F0F0F0;
	  	box-shadow: 0 0 20px 0 #000000;
  	}

</style>

<script>
function setParentText(f){
     opener.document.getElementById("lecture_code").value = f.Clecture_code.value
     opener.document.getElementById("lecture_teacher_id").value = f.Clecture_teaID.value
    // opener.document.getElementById("lecture_teacher_name").value = document.getElementById("Clecture_teaName").value
}

var trueMsg = function () {
    alert('삭제되었습니다.');
}
var falseMsg = function () {
    alert('오류가 발생했습니다.');
}
function confirm_leave(lecCode){
if (confirm('강의를 취소 하시겠습니까?')) {
	   // Yes click
		  location.href='./lectureCancelLectureAction.lec?id='+lecCode;
	}
}
</script>
<c:if test="${isCancel == '0' }"><script>falseMsg();</script></c:if>
<c:if test="${isCancel == '1' }"><script>trueMsg();</script></c:if>
<!-- 강의를 취소했을때 사용될 스크립트와 조건문 -->

<body>
<%if (attend.equals("false")) { %>
	<jsp:include page="/template/template.jsp"/>
<%} %>
<!-- st_lectureList를 활요하면 됨  -->

	
	<c:forEach var="lecture" items="${st_lectureList }" >
	<table id="lectureListViewArea">
		<tr>
			<td>강의코드 : ${lecture.lecture_code}</td>
		</tr>
		<tr>
			<td>강의명 : ${lecture.lecture_name}</td>
		</tr>
		<tr>
			<td>진행상태 : ${lecture.submit_state}</td>
		</tr>
		<tr>
			<td>현재 신청 인원 : ${lecture.lecture_student_current }/${lecture.lecture_student_limit }</td>
		</tr>
		<tr>
			<td>강의 시작 시간 : ${lecture.lecture_start_time } ~ ${lecture.lecture_end_time }</td>
		</tr>
		<tr>
			<td>강의 기간 : ${lecture.lecture_start_period } ~ ${lecture.lecture_end_period }</td>
		</tr>
		<tr>
		<%if (attend.equals("false")) { %>
			<td><a href="lectureCancelLectureAction.lec?id=${lecture.lecture_code }"><span style="color:red">신청 취소</span></a></td>
		<%} %>
		<%if (attend.equals("true")) { %>
			<td>
				<form class="hidden">
				<input type="hidden" id="Clecture_code" value=${lecture.lecture_code }>
				<input type="hidden" id="Clecture_teaID" value=${lecture.lecture_teacher_id }>
				<input type="hidden" id="Clecture_teaName" value=${lecture.lecture_teacher_name }>
				<input type="button" value="선택" onclick="setParentText(this.form);window.close()"></form>
			</td>
		<%} %>
		</tr>
		
	</table>
	<hr>
	</c:forEach>

<%if (attend.equals("false")) { %>
	<jsp:include page="/template/footer.jsp"/>
<%} %>
</body>
</html>