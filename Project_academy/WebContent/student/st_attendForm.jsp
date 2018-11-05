<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${session_student_id eq null }">
	<script>
		alert('로그인이 필요합니다.');
		location.href="index.jsp";
	</script>
</c:if>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#attendformArea{
		width:70%;
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
</head>
<script>
var openWin;
function openChild()
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("../lectureListAction.lec",
            "childForm", "width=570, height=350, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );   
}

</script>
<body>
<jsp:include page="/template/template.jsp"/>
<section id = "attendformArea">
<form name="joinform" action="../studentAttendAction.st" method="post">
<table>
	<tr>
		<td><input type="text" id="lecture_code" name="lecture_code" readonly></td>
		<td><input type="button" style="width: 100px; float: left;" 
		value="강의 선택" onclick="openChild()"></td>
	</tr>
	<tr>
		<td><label for = "state">출결 : </label></td>
	</tr>
	<tr>
		<td>
			<input type="radio" name="student_state" value="입실"/>입실
			<input type="radio" name="student_state" value="외출"/>외출
			<input type="radio" name="student_state" value="조퇴"/>조퇴
			<input type="radio" name="student_state" value="휴가"/>휴가
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="radio" name="student_state" value="결석"/>결석
			<input type="radio" name="student_state" value="퇴실"/>퇴실
			<input type="radio" name="student_state" value="기타"/>기타
		</td>
	</tr>
	
	<tr>
		<td>
			<label for = "student_attend_reason">사유 : </label>
			<input type="text" name="student_attend_reason" id = "student_attend_reason"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="출결"/>
			<input type="reset" value ="다시작성"/>
		</td>
	</tr>
</table>
</form>
</section>
</body>
</html>