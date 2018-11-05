<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="student.vo.StudentBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
var openWin;

function openChild()
{
	// window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    
    openWin = window.open("../lectureMyLectureAction.lec?id=${session_student_id }&attend=true",
            "childForm", "width=570, height=350, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );   

}
</script>
<style>
	#ratingLecture{
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
</head>
<body>

<jsp:include page="/template/template.jsp"/>
	<section id="ratingLecture">
	<form name="ratingLecture" action="../lectureRating.lec" method="post">
		<table class="ratingLecture">
			<tr>
				<td colspan="2">
					<h2>강의 평가 페이지</h2>
				</td>
			</tr>
		<div>
			<tr>
				<td><label for="lecture_code">강의코드 : </label></td>
				<td><input type="text" name="lecture_code" id="lecture_code"
					maxlength="6" required readonly/><input type="button"
					style="width: 100px;" value="강의 찾기" onclick="openChild()"
					required></td>
				<td><input type="hidden" name ="lecture_teacher_id" id="lecture_teacher_id"></td>
			</tr>
			<tr>
				<td><label for="lecture_rating">평점 : </label></td>
				<td>
					<select name="lecture_rating">
						  <option value="5">5</option>
						  <option value="4">4</option>
						  <option value="3">3</option>
						  <option value="2">2</option>
						  <option value="1">1</option>
					</select>
				</td>
			</tr>
		</div>
			<tr>
				<td colspan="2"><input type="submit" value="등록하기"> <input
					type="reset" value="새로 작성"></td>
			</tr>
		</table>
	</form>
	</section>
<jsp:include page="/template/footer.jsp"/>
</body>
</html>