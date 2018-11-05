
<%@page import="board.vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	String nowPage = request.getParameter("page");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
	<title>Start 학원 - 글 수정</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>

<style type="text/css">
#boardForm{
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

/*We are fixing a menu and pulling them out of the screen by negative 'left'*/
#registForm {
	width: 500px;
	height: 610px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

/*Just giving out page a little space*/

/*버튼 스타일 */
.button {
	text-align: center;
	font-size: 1em;
	border-radius: 8px;
}

input {
	font-family: inherit;
	color: inherit;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

input[type=submit] {
	background-color: #6799FF;
	color: #FFF;
}

input[type=reset] {
	background-color: #F15F5F;
	color: #FFF;
}

label {
	float: right;
	font-size :15px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
</style>


</head>
<body>
<jsp:include page="/template/template.jsp"/>


<h2>글 수정</h2>
<form action="boardModifyPro.bo?page=<%=nowPage%>" method="post" id = "boardForm">
<input type = "hidden" name = "BOARD_NUM" value = "<%=article.getBOARD_NUM()%>"/>
<table>

	<tr>
		<td class="td_left">
			<label for = "BOARD_SUBJECT">제 목&nbsp;</label>
		</td>
		<td class="td_right">
			<input name="BOARD_SUBJECT" type="text" id = "BOARD_SUBJECT" value = "<%=article.getBOARD_SUBJECT()%>"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "BOARD_CONTENT">내 용&nbsp;</label>
		</td>
		<td>
			<textarea id = "BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15"><%=article.getBOARD_CONTENT()%></textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="submit" value="수정하기">
			<input type="reset" value="뒤로 가기" onclick="javascript:history.go(-1)">
		</td>
	</tr>
</table>
</form>

<jsp:include page="/template/footer.jsp"/>
</body>
</html>