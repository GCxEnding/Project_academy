<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>main 테스트</p>

<script>
function confirm_leave(){
    if (confirm('탈퇴하시겠습니까	?')) {
         // Yes click
         location.href='./studentDeleteAction.st?id=${session_student_id }';
    }
}

<input type="button" value="선택" onclick="setParentText(this.form);window.close()"><br><br>
</script>
</body>
</html>

