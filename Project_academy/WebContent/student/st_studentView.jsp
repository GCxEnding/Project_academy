<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");%>
	<%@page import="student.vo.StudentBean"%>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	//StudentBean student = (StudentBean)request.getAttribute("student");
	//TeacherViewAction에 있는 update_teacher를 가져옴
	//System.out.print("id"+student.getStudent_id());
	
	%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Start 학원 - 학생 정보 페이지</title>
<style>
	#studentInfoArea{
		width: 65%;
	  	margin: 10px auto;
	  	padding: 10px;
	  	border: 7px solid #72B372;
	  	border-radius: 10px;
	  	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
		color: #444;
	  	background-color: #F0F0F0;
	  	box-shadow: 0 0 20px 0 #000000;
  	}
  	label {
  		Label.AutoSize = False;
  		width : 115px;
  	}
  	input[type=submit]{
		background-color : #6799FF;
		color : #FFF;
	}
	.input[type=reset]{
		background-color : #F15F5F;
		color : #FFF;
	}
</style>
</head>
<script>
function confirm_leave(){
    if (confirm('탈퇴하시겠습니까	?')) {
         // Yes click
         location.href='./studentDeleteAction.st?id=${session_student_id }';
    }
}
</script>
<body>
<jsp:include page="/template/template.jsp"/>
<section id ="studentInfoArea">
	<table>
			<tr>
				<td><label for = "student_id">아이디 : </label> </td>
				<td>${student.student_id }</td>
			</tr>
			<tr>
				<td><label for = "student_name">이름 : </label></td>
				<td>${student.student_name }</td>
			</tr>
			<tr>
				<td><label>우편번호</label></td>
				<td>${student.student_postcode }</td>
			</tr>
			<tr>
				<td><label>주소</label></td>
				<td>${student.student_first_address }</td>
			</tr>
			<tr>
				<td><label>상세주소</label></td>
				<td>${student.student_second_address }</td>
			</tr>
			<tr>
				<td><label for = "student_phone_number">휴대폰 번호 : </label></td>
				<td>${student.student_phone_number }</td>
			</tr>
			<tr>
				<td><label for = "">성별 : </label></td>
				<td> ${student.student_gender }</td>
			</tr>
			<tr>
				<td><label for = "student_birthday">생년월일 : </label></td>
				<td>${student.student_birthday }</td>
			</tr>
			<tr>
				<td><label for = "student_email">이메일 주소 : </label></td>
				<td>${student.student_email }</td>
			</tr>
			<tr>
				<td class="td_left">
					<label for = "student_image">사진 : </label>
				</td>
				<td class = "td_right">
					<img src="images/${student.student_image }" height="100px" width="100px">
				</td>
			</tr>
			<tr>
				<td><label for ="student_introduction">자기소개 : </label></td>
				<td><textarea name="student_introduction" id="student_introduction" rows="10" cols="23" wrap="off" readonly>${student.student_introduction }</textarea></td>
			</tr>
		
		<c:if test="${session_teacher_id == null }">
		<!--  강사한테는 수정 삭제 못하게 할거임 -->
			<div>
				<tr>
					<td colspan="2">
					<form name="updateform" action="studentUpdateFormAction.st?id2=${student.student_id }" method="post">
						<input type="submit" value="정보 수정"/>
					</form>
					<a href="javascript:confirm_leave()"><span style="color:red">탈퇴 하기</span></a>
				</tr>
			</div>
		</c:if>
	</table>
</section>

<jsp:include page="/template/footer.jsp"/>
</body>
</html>