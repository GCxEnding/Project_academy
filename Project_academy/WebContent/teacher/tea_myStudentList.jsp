<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="student.vo.StudentBean"%>
    <% 
	StudentBean student = (StudentBean)request.getAttribute("student");
	//TeacherViewAction에 있는 update_teacher를 가져옴
	//System.out.print("id"+student.getStudent_id());
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
/*
		st = new StudentBean();
					st.setStudent_id(rs.getString("submit_id"));
					st.setStudent_name(rs.getString("student_name"));
					st.setStudent_phone_number(rs.getString("student_phone_number"));
					st.setStudent_gender(rs.getString("student_gender"));
					
					st.setStudent_birthday(rs.getString("student_birthday"));
					st.setStudent_email(rs.getString("student_email"));
					st.setStudent_image(rs.getString("student_image"));
					st.setStudent_grade_point(rs.getInt("student_grade_point"));
					st.setStudent_teacher_memo(rs.getString("student_teacher_memo"));
*/
	String result = request.getParameter("result");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Start 학원 - 내 강의 학생 목록</title>
</head>
<style>
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
	input[type=number]{
	    width: 50px;
	} 
	.hidden{
		display: inline
	}
</style>
<script>
var trueMsg = function (result) {
    alert(result+'삭제되었습니다.');
}
var falseMsg = function () {
    alert('오류가 발생했습니다.');
}
</script>


<body>	
<!-- st_lectureList를 활요하면 됨  -->
<c:forEach var="student" begin="0" items="${lec_studentList }">
<table id="studentListAreaTitle">
	
	<tr>
		<!-- 
		<td><input type="checkbox" name="status_ID" value="${student.student_id }">
			<input type="hidden" name="status_code" value="${lecCode }"></td>
		 -->
		<td>ID : ${student.student_id }</td>
		<td>이름 : ${student.student_name }</td>
		<td>전화번호 : ${student.student_phone_number }</td>
	</tr>
	<tr>
		<td><a href="studentViewAction.st?id=${student.student_id }">상세보기</a></td>
	</tr>
</table>
<hr>
</c:forEach>
<!-- 관리자일경우 버튼 표시, 이것들은 수강신청 변경을 위해서 사용될 부분임 
<c:if test="${session_teacher_id eq 'admin' }">
	<a href="lectureChangeStatusAction.lec" method="post">전송</a>
		<p>수강 상태를 변경할 학생을 선택하고 전송버튼을 누르세요.</p>
				<select name="status">
				  <option value="수강중">수강중</option>
				  <option value="수강완료">수강완료</option>
				  <option value="취소예정">취소예정</option>
				</select>
			<input type="submit" value="전송">
</c:if>
-->
</body>
</html>
