<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="teacher.vo.TeacherBean"%>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 
	Teacher 리스트를 보여주는 페이지
	강사가 너무 많으면 페이지 기능을 가져와 목록을 나누어야 한다.
	
	상세보기버튼은...
	
	수정버튼은 teacherUpdateFormAction.tea로 넘긴다.
	id를 넘길때 request이름은 teacherListID로 한다.
	
	삭제버튼은 teacherDeleteAction.tea으로 넘긴다.
	id를 넘길때 request이름은 teacherListID로 한다.
  -->
  <% 
  /*
  String session_id = ((String)session.getAttribute("session_teacher_id"));

  if (session_id == null || !(session_id.equals("admin"))) { 
  	out.println("<script>");
  	out.println("alert('관리자만 접속 할 수 있습니다.')");
  	out.println("location.href='./mainPage.main';");
  	out.println("</script>");
  }
  */
  /*
	TeacherBean teacher = (TeacherBean)request.getAttribute("teacherList");
	//TeacherListAction에 있는 teacherList를 가져옴
	System.out.println(teacher.getTeacher_name());
	*/
	String cf = request.getParameter("createForm");
	
	if(cf == null){ //그냥 강사목록을 볼 경우엔
		cf= "0"; //NullPointer 오류 방지용
	}
	%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 목록 페이지</title>
<style>
#teacherListArea {
	width: 1050px;
	margin: 10px auto;
	padding: 10px;
	border: 7px solid #72B372;
	border-radius: 10px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	color: #444;
	background-color: #F0F0F0;
	box-shadow: 0 0 20px 0 #000000;
}

#teacherListAreaChild {
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

.hidden {
	display: inline
}

#overflow {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 950px;
	height: 20px;
}
</style>
<script>
	function confirm_leave() {
		if (confirm('강사는 삭제되지만 강의 담당 강사에는 그대로 남아있습니다. 진행하시겠습니까 ?')) {
			// Yes click
			location.href = './teacherDeleteAction.tea?id=${teacher.teacher_id }';
		}
	}
</script>
</head>
<script>
function setParentText(f){
    opener.document.getElementById("lecture_teacher_id").value = f.Clecture_teaID.value
    opener.document.getElementById("lecture_teacher_name").value = f.Clecture_teaName.value
}
</script>
<body>
<!-- 강의 생성폼에서 왔는지 안왔는지 구분 하는 코드 -->
<%if(cf.equals("0")) {%>
	<jsp:include page="/template/template.jsp"/>
<%} %>
<c:forEach var="teacher" items="${teacherList }" begin="1">
<%if(cf.equals("0")) {%>
	<table id="teacherListArea">
<%} else{ %>
	<table id="teacherListAreaChild">
<%} %>
	
		<!-- 보기,수정,삭제 필드 -->
			<%if(cf == "0") { //강사 선택에만 사용될부분인지 구분이 필요 %>
		<tr>
			<td rowspan="5"><img src="images/${teacher.teacher_image }" height="160px" width="120px">		
		</tr>
		<c:if test="${session_teacher_id eq 'admin' }">
		<tr>
			<td>아이디 : ${teacher.teacher_id }</td>
		</tr>
		</c:if>
		
		<tr>
			<td>이름 : ${teacher.teacher_name }</td>	
		</tr>
		<tr>
			<td>담당과목 : ${teacher.teacher_subject }</td>		
		</tr>	
		<tr>
			<td>이메일 : ${teacher.teacher_email }</td>
		</tr>
		<tr>
			<td>소개 : ${teacher.teacher_introduction }</td>
		</tr>

		<tr>
			<td><form class="hidden" action = "teacherViewAction.tea?id=${teacher.teacher_id }" method="post">
				<input type="submit" value="상세정보"></form></td>
			<c:if test="${session_teacher_id eq 'admin' }">
				<td><a href = "teacherUpdateFormAction.tea?id=${teacher.teacher_id }">수정</a>&nbsp;
			
				<a href="teacherDeleteAction.tea?teacherListID=${teacher.teacher_id }">
				<span style="color:red">탈퇴시키기</span></a></td>
			</c:if>
		 
		</tr>
			
		<%} else{ //강사 선택에만 사용될부분인지 구분이 필요 %>
		<tr>
			<td>아이디 : ${teacher.teacher_id }</td>
			<td>이름 : ${teacher.teacher_name }</td>
		</tr>
		<tr>
			<td>담당과목 : ${teacher.teacher_subject }</td>
			<td>이메일 : ${teacher.teacher_email }</td>
		</tr>
		<tr>
			<td>전화번호 : ${teacher.teacher_phone_number }</td>
		</tr>
		<tr>
			<td>
				<form class="hidden">
					<input type="hidden" id="Clecture_teaID" name="Clecture_teaID" value=${teacher.teacher_id }>
					<input type="hidden" id="Clecture_teaName" name="Clecture_teaName" value=${teacher.teacher_name }>
					<input type="button" value="선택" onclick="setParentText(this.form);window.close()">
				</form>
			</td>
		</tr>
		<%} %>	

	</table>
</c:forEach>
<%if(cf.equals("0")) {%>
	<jsp:include page="/template/footer.jsp"/>
<%} %>
</body>
</html>
