<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	String session_id = ((String) session.getAttribute("session_teacher_id"));

	if (session_id == null || !(session_id.equals("admin"))) {
		out.println("<script>");
		out.println("alert('관리자만 접속 할 수 있습니다.')");
		//out.println("location.href='../mainPage.main';");
		out.println("location.href='../index.jsp';");
		out.println("</script>");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>강의 등록 펌</title>
<script>
function checkLength(lecture_intro) {
    if (lecture_intro.value.length > 1001 ) {
    	lecture_intro.blur();
    	lecture_intro.value = lecture_intro.value.substring(0, 1001);
    	lecture_intro.focus();
        return false;
    }
}
var openWin;

function openChild()
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("../teacherListAction.tea?createForm=true",
            "childForm", "width=570, height=350, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );   
}

function isSame() {
    var pw = document.joinform.lecture_start_period.value;
    var confirmPW = document.joinform.lecture_end_period.value;

        if(document.getElementById('lecture_start_period').value < document.getElementById('lecture_end_period').value) {
            document.getElementById('same').innerHTML='날짜 정상 입력';
            document.getElementById('same').style.color='blue';
        }
        else {
            document.getElementById('same').innerHTML='끝나는 날짜가 시작 날짜보다 빠릅니다.';
            document.getElementById('same').style.color='red';
        }
}

function isSameTime() {
    var pw = document.joinform.lecture_start_time.value;
    var confirmPW = document.joinform.lecture_end_time.value;

        if(document.getElementById('lecture_start_time').value < document.getElementById('lecture_end_time').value) {
            document.getElementById('sameTime').innerHTML='시간 정상 입력';
            document.getElementById('sameTime').style.color='blue';
        }
        else {
            document.getElementById('sameTime').innerHTML='끝나는 시간이 시작 시간보다 빠릅니다.';
            document.getElementById('sameTime').style.color='red';
        }
}
</script>

</head>
 <style>


/*Just giving out page a little space*/

.content-wrapper {
    padding: 3rem 4rem;
    margin: 2rem;
}


:-moz-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-placeholder {
   color: #AAAAAA;
   opacity: 1;
   font-weight: 300;
}

::-webkit-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

:-ms-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-focus-inner {
   border: 0;
   padding: 0;
}

input {
   font-family: inherit;
   color: inherit;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}
.joinform{
		width: 600px;
	  	margin: 10px auto;
	  	padding: 10px;
	  	border: 7px solid #72B372;
	  	border-radius: 10px;
	  	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	  	font-size :13px;
		color: #444;
	  	background-color: #F0F0F0;
	  	box-shadow: 0 0 20px 0 #000000;
  	}
  	h2{
	  		margin: 0 15px 20px;
		  	border-bottom: 2px solid #72B372;
		  	padding: 5px 10px 5px 0;
		  	font-size: 1.1em;
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
<body>
<jsp:include page="/template/template.jsp"/>

<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<section id="joinformArea">
	<form name="joinform" action="../lectureCreateAction.lec" method="post" enctype="multipart/form-data">
		<table class="joinform">
			<tr>
				<td colspan="2">
					<h2>강의 등록 페이지</h2>
					<p>&nbsp;&nbsp;&nbsp;<span style="color:red">(*)</span> 항목은 필수 입력사항입니다.</p>
				</td>
			</tr>
		<div>
			<tr>
				<td><label for="lecture_code">강의코드<span style="color:red">(*)</span> : </label></td>
				<td><input type="text" name="lecture_code" id="lecture_code"
					maxlength="10" required/></td>
			</tr>
			<tr>
				<td><label for="lecture_teacher_id">담당 강사 ID : </label></td>
				<td><input type="text" name="lecture_teacher_id" 
					id="lecture_teacher_id" maxlength="15" required readonly/></td>
				<!-- 강사 ID를 목록에서 보여주고 선택하는 기능을 넣을수도 있음 -->
			</tr>
			<tr>
				<td><label for="lecture_teacher_name">강사명<span style="color:red">(*)</span> : </label></td>
				<td><input type="text" name="lecture_teacher_name" id="lecture_teacher_name"
					maxlength="6" required readonly/><input type="button"
					style="width: 100px;" value="강사 찾기" onclick="openChild()"
					required></td>
			</tr>
			<tr>
				<td><label for="lecture_name">강의 이름<span style="color:red">(*)</span> : </label></td>
				<td><input type="text" name="lecture_name" 
					id="lecture_name" maxlength="50" required /></td>
			</tr>
			<tr>
				<td><label for="lecture_intro">강의 소개 : </label></td>
				<td><textarea onKeyUp="checkLength(this);"
						onKeyDown="checkLength(this);" name="lecture_intro"
						id="lecture_intro" rows="13" cols="40" wrap="off"></textarea></td>
			</tr>
			<tr>
				<td><label for="lecture_student_limit">학생 정원<span style="color:red">(*)</span> : </label></td>
				<td><input type="number" name="lecture_student_limit"
					id="lecture_student_limit" min="1" max="50" required /></td>
			</tr>
			
			<tr>
				<td><label for="lecture_start_period">강의 시작 날짜<span style="color:red">(*)</span> : </label></td>
				<td><input type="date" name="lecture_start_period"
					id="lecture_start_period" required /></td>
			</tr>

			<tr>
				<td><label for="lecture_end_period">강의 끝나는 날<span style="color:red">(*)</span> : </label></td>
				<td><input type="date" name="lecture_end_period"
					id="lecture_end_period" onchange="isSame()"required />
					&nbsp;&nbsp;<span id="same"></span></td>
			</tr>

			<tr>
				<td><label for="lecture_cost">강의 비용<span style="color:red">(*)</span> : </label></td>
				<td><input type="number" name="lecture_cost" id="lecture_cost"
					required /></td>
			</tr>

			<tr>
				<td><label for="lecture_type">강의 종류<span style="color:red">(*)</span> : </label></td>
				<td>
				<select name="lecture_type">
					  <option value="기타">기타</option>
					  <option value="전기/전자">전기/전자</option>
					  <option value="기계">기계</option>
					  <option value="토목">토목</option>
					  <option value="보건">보건</option>
					  <option value="자격증">자격증</option>
				</select> 
				</td>
			</tr>

			<tr>

				<td><label for="lecture_start_time">강의 시작 시간<span style="color:red">(*)</span> : </label></td>
				<td><input class="without" type="time" name="lecture_start_time"
					id="lecture_start_time" required /></td>
			</tr>

			<tr>
				<td><label for="lecture_end_time">강의 끝나는 시간<span style="color:red">(*)</span> : </label></td>
				<td><input type="time" name="lecture_end_time"
					id="lecture_end_time" onchange="isSameTime()" required />
					&nbsp;&nbsp;<span id="sameTime"></span></td>
			</tr>
			<tr>
				<td><label for="lecture_image">강의 이미지 : </label></td>
				<td><input type="file" name="lecture_image" id ="lecture_image">
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