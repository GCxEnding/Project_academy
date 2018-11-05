<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@page import ="java.util.*" %>
<%@page import = "student.vo.StudentBean" %>
<%@page import = "student.vo.StudentAttendBean" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "dao.StudentDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${session_student_id eq null }">
	<script>
		alert('학생 ID로 로그인이 필요합니다.');
		location.href="index.jsp";
	</script>
</c:if>
<% 
	ArrayList<StudentAttendBean> AttendList = (ArrayList)session.getAttribute("AttendList");
	StudentAttendBean sab = (StudentAttendBean)session.getAttribute("sab");
	String student_id = (String)session.getAttribute("session_student_id");

	%>
<%
Calendar cal = Calendar.getInstance();

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

if(strYear != null)
{
	  year = Integer.parseInt(strYear);
	  month = Integer.parseInt(strMonth);  
}else{

}
//년도/월 셋팅
cal.set(year, month, 1);

int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;

//오늘 날짜 저장.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>
<html lang="ko">
<HEAD>
	<TITLE>캘린더</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script type="text/javaScript" language="javascript">
	</script>
	<style TYPE="text/css">
		body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;	
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		
		}
		#calendarFrm{
			width:1100px;
		  	margin: 10px auto;
		  	padding: 10px;
		  	border-radius: 10px;
		  	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  		}
		form {
			margin-left : 10%;
			margin-right : 10%;
			margin-top : 3%;
			margin-bottom : 3%;
		}
		td {
			font-family: "돋움"; 
			font-size: 12pt; 
			color:#595959;
			
		}
		tr {font-family: "돋움"; font-size: 9pt; color:#000000;}
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}


		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}
		
		#attendformArea{
		width:70%;
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
</HEAD>
<script>
var openWin;
function openChild()
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("/Project_academy/lectureMyLectureAction.lec?attend=true",
            "childForm", "width=570, height=350, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );   
}

</script>
<BODY>
<jsp:include page="/template/template.jsp"/>
<section id = "attendformArea">

<form name="joinform" action="/Project_academy/studentAttendAction.st" method="post">
<table>
	<tr>
		<td><input type="text" id="lecture_code" name="lecture_code" readonly placeholder="강의를 선택해주세요"></td>
		<td><input type="button" style="width: 100px; float: left;" 
		value="강의 선택" onclick="openChild()" ></td>
	</tr>
	<!-- 
	<tr>
		<td><label for = "state">출결 : </label></td>
	</tr>
	 -->
	<tr>
		<td>
			<input type="radio" name="student_state" value="입실"/>입실
			<input type="radio" name="student_state" value="외출"/>외출
			<input type="radio" name="student_state" value="조퇴"/>조퇴
			<input type="radio" name="student_state" value="휴가"/>휴가
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="radio" name="student_state" value="결석"/>결석
			<input type="radio" name="student_state" value="퇴실"/>퇴실
			<input type="radio" name="student_state" value="기타"/>기타
		</td>
	</tr>
	
	<tr>
		<td>
			<label for = "student_attend_reason">사유 : </label>
			<input type="text" name="student_attend_reason" id = "student_attend_reason" 
			placeholder="빈칸으로 남기셔도 됩니다."/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="출결"/>
			<input type="reset" value ="다시작성"/>
		</td>
	</tr>
</table>
</form>
</section>




<form name="calendarFrm" id="calendarFrm" action="" method="post">
<DIV id="content" style="width:1050px;">

<table width="1050px" border="0" cellspacing="1" cellpadding="1">
</table>
<!--날짜 네비게이션  -->
<table width="1050px" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">

<tr>
<td height="60">

	<table width="1050px" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="10">
		</td>
	</tr>
	
	<tr>
		<td align="center" >
			<a href="<c:url value='/Calendar.st' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self">
				<b>&lt;&lt;</b><!-- 이전해 -->
			</a>
			<%if(month > 0 ){ %>
			<a href="<c:url value='/Calendar.st' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self">
				<b>&lt;</b><!-- 이전달 -->
			</a>
			<%} else {%>
				<b>&lt;</b>
			<%} %>
			&nbsp;&nbsp;
			<%=year%>년
			
			<%=month+1%>월
			&nbsp;&nbsp;
			<%if(month < 11 ){ %>
			<a href="<c:url value='/Calendar.st' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
				<!-- 다음달 --><b>&gt;</b>
			</a>
			<%}else{%>
				<b>&gt;</b>
			<%} %>
			<a href="<c:url value='/Calendar.st' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self">
				<!-- 다음해 --><b>&gt;&gt;</b>
			</a>
		</td>
	</tr>
	</table>

</td>
</tr>
</table>
<br>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
<THEAD>
<TR bgcolor="#CECECE">
	<TD width='150px'>
	<DIV align="center"><font color="red">일</font></DIV>
	</TD>
	<TD width='150px'>
	<DIV align="center">월</DIV>
	</TD>
	<TD width='150px'>
	<DIV align="center">화</DIV>
	</TD>
	<TD width='150px'>
	<DIV align="center">수</DIV>
	</TD>
	<TD width='150px'>
	<DIV align="center">목</DIV>
	</TD>
	<TD width='150px'>
	<DIV align="center">금</DIV>
	</TD>
	<TD width='150px'>
	<DIV align="center"><font color="#529dbc">토</font></DIV>
	</TD>	
</TR>
</THEAD>
<TBODY>
<TR id = "calendarmain">
<%
	//처음 빈공란 표시
	for(int index = 1; index < start ; index++ )
	{
	  out.println("<TD >&nbsp;</TD>");
	  newLine++;
	}
	
	int Max = AttendList.size();
	int i =0;
	
	for(int index = 1; index <= endDay; index++)
	{
		String color = "";
	
		if(newLine == 0){			color = "RED";
		}else if(newLine == 6){ 	color = "#529dbc";
		}else{						color = "BLACK"; };
	
		String sUseDate = Integer.toString(year); 

	    sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);

	    sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
		
	    int iUseDate = Integer.parseInt(sUseDate);
		
		String backColor = "#EFEFEF";
		
		out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
%>
		<font color='<%=color%>'>
			<%=index %>        
		</font>
		
	<%  
		SimpleDateFormat a = new SimpleDateFormat("yyyyMMdd");
		String testTime = null;
		for(i = 0; i<=(Max-1); i++){
			if(AttendList.get(i).getAttendance_student_id().equals(student_id) && a.format(AttendList.get(i).getAttendance_date()).equals(String.valueOf(iUseDate))){
				out.println("<BR><B>");
				out.println(AttendList.get(i).getAttendance_state());
				out.println("</B>");
				if(AttendList.get(i).getAttendance_entrance() != null){
					out.println(AttendList.get(i).getAttendance_entrance());
				}else{
					out.println("<BR>");
				}
				if(AttendList.get(i).getAttendance_exit() != null){
					out.println("<BR>");
					out.println("&nbsp;");
					out.println(" ~ ");
					out.println(AttendList.get(i).getAttendance_exit());
				}else{
					out.println("<BR>");
				}
				out.println("<BR>");
				i++;
			}
			else{
				out.println("<BR>");
			}
		}

		//기능 제거	
		out.println("</TD>");
		newLine++;

		if(newLine == 7)
		{
		  out.println("</TR>");
		  if(index <= endDay)
		  {
		    out.println("<TR>");
		  }
		  newLine=0;
		}
	}
//마지막 공란 LOOP
	while(newLine > 0 && newLine < 7)
	{
	  out.println("<TD>&nbsp;</TD>");
	  newLine++;
	}
%>
</TR>

</TBODY>
</TABLE>
</DIV>
</form>
<jsp:include page="/template/footer.jsp"/>
</BODY>
</HTML>
