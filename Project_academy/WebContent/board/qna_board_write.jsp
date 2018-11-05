
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
String BOARD_FILE=request.getParameter("BOARD_FILE");
/*
	String id = (String)session.getAttribute("session_teacher_id");
	if (id != null){
		request.setAttribute("teacher_id", id);
	} else {
		System.out.println("board_write 로그인 필요");
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start 학원 - 공지사항 쓰기</title>

<style type="text/css">
.boardform {
	width: 600px;
	margin: 10px auto;
	padding: 10px;
	border: 7px solid #72B372;
	border-radius: 10px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 13px;
	color: #444;
	background-color: #F0F0F0;
	box-shadow: 0 0 20px 0 #000000;
}

#tr_top {
	background: blue;
	text-align: center;
}

#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}

/*Just giving out page a little space*/
.content-wrapper {
	padding: 3rem 4rem;
	margin: 2rem;
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
	<!-- 게시판 등록 -->

	<section id="writeForm">
		<form action="/Project_academy/boardWritePro.bo" method="post"
			enctype="multipart/form-data" name="boardform" class="boardform">
			<table>
				<tr>
					<td class="td_left"><label for="BOARD_SUBJECT">제 목 :&nbsp;</label></td>
					<td class="td_right"><input name="BOARD_SUBJECT" type="text"
						id="BOARD_SUBJECT" required="required" maxlength="50"/></td>
					<td><input type="hidden" id = "teacher_id" name ="teacher_id"
					value ="${session_teacher_id }"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_CONTENT">내 용 :&nbsp;</label></td>
					<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT"
							cols="40" rows="15" required="required"></textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_FILE">파일 첨부 :&nbsp;</label></td>
					<td class="td_right"><input name="BOARD_FILE" type="file"
						id="BOARD_FILE" /></td>
				</tr>

			</table>
			<section id="commandCell">
				<input type="submit" value="등록" class="button-3d">&nbsp;&nbsp;
				 <input type="reset" value="다시쓰기"  class="button-3d"/>
				 	 <a href="javascript:history.go(-1)" class="button-3d">[뒤로]</a>
			</section>
		</form>
	</section>
	<!-- 게시판 등록 -->
<jsp:include page="/template/footer.jsp"/>
</body>
</html>