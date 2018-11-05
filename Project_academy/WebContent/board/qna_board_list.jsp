<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@page import="board.vo.PageInfo"%>
<%@page import="board.vo.BoardBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="javax.sql.*"%>
<%@ page import ="javax.naming.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Start 학원 - 공지사항</title>
<style>
#board_table {
	width: 75%;
	margin: 10px auto;
	padding: 10px;
	border: 7px solid #72B372;
	border-radius: 10px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	color: #444;
	background-color: #F0F0F0;
	box-shadow: 0 0 20px 0 #000000;
}

#submit {
	width: 50%;
	margin: 10px auto;
	padding: 10px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

#pageList {
	width: 30%;
	margin: 10px auto;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

h2 {
	width: 15%;
	margin: 10px auto;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

input[type=submit] {
	background-color: #6799FF;
	color: #FFF;
}
</style>

</head>

<body>
<jsp:include page="/template/template.jsp"/>

    <section id ="total">
	<section id="listForm">
		<h2>공지사항</h2>
		<hr>
		<table id="board_table" border="1" cellspacing="0.01">
			<%
if(articleList != null && listCount > 0){
%>

			<tr id="tr_top" style = "text-align : center">
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>날짜</td>
				<td>조회</td>
			</tr>

			<%
		for(int i=0;i<articleList.size();i++){
			
	%>
			<tr class="" style = "text-align : center">
			<!-- 글 번호 -->
				<td id="subjectb"><%=articleList.get(i).getBOARD_NUM()%></td>
			<!-- 글 제목 -->
				<td id="subjectb" width="350px">
					<a href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>
					&page=<%=nowPage%>">
						<%=articleList.get(i).getBOARD_SUBJECT()%>
				</a>
				</td>
			<!-- 글 작성자,날짜,조회수 -->
				<td  id="subjectb"><%=articleList.get(i).getBOARD_NAME() %></td>
				<td id="subjectb" ><%=articleList.get(i).getBOARD_DATE() %></td>
				<td id="subjectb"><%=articleList.get(i).getBOARD_READCOUNT() %></td>
			</tr>
			<%} %>
		</table>
	</section>

	<section id="pageList">
	
		<%if(nowPage<=1){ %>
		[이전]&nbsp;
		<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage-1 %>" >[이전]</a>&nbsp;
		<%} %>
		
		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		[<%=a %>]
		<%}else{ %>
		<a href="boardList.bo?page=<%=a %>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		[다음]
		<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage+1 %>">[다음]</a>
		<%} %>
		

	
		</section>
	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
	}
%>

<table id = "submit">
	<tr>
		<td align="center">
			<form class="boardsearch"name ="bosearch" action="boardList.bo" method="post">
			   <input type="text" class="bosearch" name="bosech" id="bosech">
			
			   <input type="submit" value="검색" class="boardsearchButton" name="junsong">
			</form>
		</td>
		
		<c:if test="${session_teacher_id != null }">
			<td>
			<form action="boardWriteForm.bo">
				<input type="submit" value="글 쓰기">
			</form>
			</td>
		</c:if>
	</tr>
</table>
</section>
<jsp:include page="/template/footer.jsp"/> 
</body>
</html>