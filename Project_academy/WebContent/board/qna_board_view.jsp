
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import ="java.sql.*"%>
<%@ page import ="javax.sql.*"%>
<%@ page import ="javax.naming.*"%>
<%@page import="board.vo.PageInfo"%>
<%@page import="board.vo.BoardBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
Date nowTime = new Date();
Date date = new Date();
	BoardBean article = (BoardBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
    String teacher_id = (String) session.getAttribute("session_teacher_id");
    
    if (teacher_id == null)
    	teacher_id="";
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start 학원 - ${article.BOARD_SUBJECT }</title>

<script>
function confirm_leave(){
    if (confirm('삭제하시겠습니까	?')) {
         location.href='boardDeletePro.bo?board_num=<%=article.getBOARD_NUM() %>&page=<%=nowPage%>';
    }
}
</script>
<style>
	#articleForm{
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
	.button {
		text-align : center;
		font-size: 1em;
  		border-radius: 8px;
	}
	input[type=submit]{
		background-color : #6799FF;
		color : #FFF;
	}
	input[type=reset]{
		background-color : #F15F5F;
		color : #FFF;
	}
	label {
		float : right;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}

	 
</style>
</head>

<body>
<jsp:include page="/template/template.jsp"/>

		
<!-- <div class="section">
	<h2 class="hx">제목</h2>
	<div class="tx">내용</div>
	<a class="section_more" href="#">
<span>?</span> 더보기</a>
-->
	<!-- 게시판 수정 -->
<section id="total">
	<section id="articleForm">
	<div class="section">
		<h4 class="hx">작성자 : <%=article.getBOARD_NAME()%><br>
		제 목 : <%=article.getBOARD_SUBJECT()%></h4><hr>
		
			<section id="basicInfoArea">
				<p align="left"class="tx"></p>
				내용 : <%=article.getBOARD_CONTENT() %>
				<br><hr>
				
				<%if (article.getBOARD_FILE()!=null || !(article.getBOARD_FILE().equals(""))) { %>
				첨부파일 : <a href="file_down.jsp?file_name=<%=article.getBOARD_FILE()%>" class="tx">
				<%=article.getBOARD_FILE() %></a>
				<%} else {%>
					<p>첨부파일이 없습니다.</p>
					<!-- 파일이 없으면 없다고 메시지 띄움 -->
				<%} %>
				
				
			</section>
		</div>
	</section>
</section>

	<section id="review">
		<!-- 글 작성자 또는 관리자일때만 수정,삭제 버튼을 표시함 -->
		<table>
			<tr><td>
			<%if (teacher_id.equals("admin") || article.getBOARD_ID().equals(teacher_id)){%>
				<a href="boardModifyForm.bo?board_num=${article.BOARD_NUM }&page=<%=nowPage%>"
					class="button-3d">[수정]</a>
				<a href="javascript:confirm_leave()">[삭제]</a>
			<%} %>
			<a href="boardList.bo?page=<%=nowPage%>"
			class="button-3d">[목록]</a>&nbsp;&nbsp;
		</td></tr>
		</table>
	</section>

</body>
<jsp:include page="/template/footer.jsp"/>
</html>