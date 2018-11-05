<!-- 학생 또는 강사의 강의 목록을 보여주는 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page import="lecture.vo.LectureBean"%>
<%@page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String teacher_id = ((String) session.getAttribute("session_teacher_id"));
	String student_id = ((String) session.getAttribute("session_student_id"));
	
	String id = request.getParameter("id");
	System.out.println(id);
	
	String attend = request.getParameter("attend");
	if(attend == null)
		attend="false";

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 리스트</title>
</head>
<script type="text/javascript">
var trueMsg = function () {
    alert('삭제되었습니다.');
}
var falseMsg = function () {
    alert('오류가 발생했습니다.');
}
var nullListMsg = function () {
	alert('등록된 강의가 없습니다.');
}

function setParentText(f){
     opener.document.getElementById("lecture_code").value = document.getElementById("Clecture_code").value
     opener.document.getElementById("lecture_teacher_id").value = document.getElementById("Clecture_teaID").value
     opener.document.getElementById("lecture_teacher_name").value = document.getElementById("Clecture_teaName").value
}

var openSt;
function openStList(lecCode)
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openSt = window.open("/Project_academy/teacherMyStudentAction.tea?lecCode="+lecCode,
            "childForm", "width=570, height=350, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );   
}

var openEx;
function openStList(lecCode)
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openEx = window.open("/Project_academy/teacherMyStudentAction.tea?lecCode="+lecCode,
            "childForm", "width=570, height=350, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );   
}
</script>
<style>
	#lectureListArea{
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
  	.hidden{
		display: inline
	}
</style>
<body>

<c:if test="${isCancel == '0' }"><script>falseMsg();</script></c:if>
<c:if test="${isCancel == '1' }"><script>trueMsg();</script></c:if>
<c:if test="${lectureList == null }"><script>nullListMsg();</script></c:if>
<%if (attend.equals("false")) { %>
	<jsp:include page="/template/template.jsp"/>
<%} %>
	<c:forEach var="lecture" items="${lectureList }">
	<table id="lectureListArea">
		<tr>
			<td>강의 코드 : ${lecture.lecture_code }</td>
			<td>강의명 : ${lecture.lecture_name }</td>
			
		</tr>
		<tr>
			<td>강사명 : ${lecture.lecture_teacher_name }</td>
		</tr>
		<!-- 보기,수정,삭제 필드 -->
		<tr>
				<td><a href="lectureViewAction.lec?id=${lecture.lecture_code }&attend=${attend }">강의 정보 보기</a></td>	
					
			<!-- 강사로그인이 되어있을때만 아래 항목을 보여준다. (수정,삭제,학생 목록,시험 추가) -->
			<c:if test="${session_teacher_id != null }">
			<!-- 관리자 또는 자기 강의일때 강의 수정,삭제 버튼을 보여줌 -->
			<%if (teacher_id.equals("admin")){ %>
				<td><a href="lectureUpdateFormAction.lec?id=${lecture.lecture_code }">수정</a>&nbsp;</td>
				<td><a href="/Project_academy/lectureDeleteAction.lec?id=${lecture.lecture_code }"><span style="color:red">강의 삭제</span></a></td>
			<%} %>
				<td><input type="button" value="학생 목록" 
				onclick="openStList('${lecture.lecture_code }');" id="st_button" name="st_button">
				</td>
				<%
				//<td><input type="button" style="width: 100px;" value="시험 등록" 
				//onclick="openStList('${lecture.lecture_code }');" id="st_button" name="st_button" required></td>
				 %>
			</c:if>
			
			<%if (attend.equals("true")) { %>
			
				<td>
					<form class="hidden">
					<input type="hidden" id="Clecture_code" value=${lecture.lecture_code }>
					<input type="hidden" id="Clecture_teaID" value=${lecture.lecture_teacher_id }>
					<input type="hidden" id="Clecture_teaName" value=${lecture.lecture_teacher_name }>
					<input type="button" value="선택" onclick="setParentText(this.form);window.close()">
					</form>
				<%} %></td>
			
		</tr>
	</table>
	</c:forEach>

<%if (attend.equals("false")) { %>
	<jsp:include page="/template/footer.jsp"/>
<%} %>
</body>

<% 
/*


		<!-- 인원이 꽉 차면 강의신청 버튼을 지워버림 -->
			<c:if test="${session_student_id != null || attend != true} ">
					<c:if test="${lecture.lecture_student_current != lecture.lecture_student_limit }">
						<a href="lectureSubmitAction.lec?id=${lecture.lecture_code }">강의 신청</a></c:if>
					<c:if test="${lecture.lecture_student_current == lecture.lecture_student_limit }">
						<p>수강 가능 인원을 초과했습니다.</p>
					</c:if>
			</c:if><br><br>	
*/

%>
</html>
