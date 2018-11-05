<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.Date" %>
<% String where = request.getParameter("where");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Start 학원 - 강의 수정 폼</title>
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
.updateform{
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
<script>
function checkRqDate(){

    var now = new Date();
    year = now.getYear();          // 현재 년도 가져오기
    month = now.getMonth()+1;        // 현재 월 가져오기 (+1)
    if((month+"").length < 2){         //월이 '7'로 찍히지 않고 '07'로 찍히도록 길이를 받아온다
         month = "0" +month;         //길이가 1이라면 앞에 0을 붙여서 '07'형태로 나오게 한다
    }
   date = now.getDate();       // 현재 날짜 가져오기
    if((date+"").length < 2){         //일이 '7'로 찍히지 않고 '07'로 찍히도록 길이를 받아온다
     date = "0" +date;           //길이가 1이라면 앞에 0을 붙여서 '07'형태로 나오게 한다
    }
    today = year +""+ month +""+ date ;           //오늘 날짜 ex) 20080801

    var InputDate = document.frmWork.txtHpDate.value;    //입력된 날짜 받아오기
    var dateSplit = InputDate.split("-");         //입력값을 '-'을 기준으로 나누어 배열에 저장해 주는 함수 split
	
    year = dateSplit[0];      //첫번째 배열은 년
    month = dateSplit[1];  //월
    day = dateSplit[2];   //일

    InputDate = year +""+ month +""+ day;       //입력된 값을 더해준다.

    if (parseInt(InputDate) < parseInt(today) ){          //int형으로 변환하여 비교한다
         alert("오늘 날짜보다 이전 날짜입니다.");
         document.frmWork.txtHpDate.value = "";         //이전 날짜라면 입력폼 리셋처리
    }

}

function isSame() {
    var pw = document.updateform.lecture_start_period.value;
    var confirmPW = document.updateform.lecture_end_period.value;

        if(document.getElementById('lecture_start_period').value < document.getElementById('lecture_end_period').value) {
            document.getElementById('same').innerHTML='날짜가 정상적으로 입력됨';
            document.getElementById('same').style.color='blue';
        }
        else {
            document.getElementById('same').innerHTML='다시 입력하세요.';
            document.getElementById('same').style.color='red';
        }
}

function openChild()
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    // createForm 전송 변수명을 변경해야되지만 꼬임이 없기위해 그대로 사용
    openWin = window.open("./teacherListAction.tea?createForm=true",
            "childForm", "width=570, height=350, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );   
}
</script>

<body>
<jsp:include page="/template/template.jsp"/>

	<form name="updateform" action="./lectureUpdateAction.lec?where=<%=where %>" method="post" enctype="multipart/form-data">
		<table class="updateform">
			<tr>
				<td colspan="2">
					<h2>강의 수정 페이지</h2>
				</td>
			</tr>
			
			<tr>
				<td><label for="lecture_code">강의코드 : </label></td>
				<td><input type="text" name="lecture_code" id="lecture_code"
					maxlength="10" value=${update_lecture.lecture_code } readonly required /></td>
			</tr>
			<tr>
				<td><label for="lecture_teacher_id">담당 강사 ID : </label></td>
				<td><input type="text" name="lecture_teacher_id" 
					id="lecture_teacher_id" maxlength="15" 
					value=${update_lecture.lecture_teacher_id } required /></td>
				<!-- 강사 ID를 목록에서 보여주고 선택하는 기능을 넣을수도 있음 -->
			</tr>
			<tr>
				<td><label for="lecture_teacher_name">강사명 : </label></td>
				<td><input type="text" name="lecture_teacher_name" id="lecture_teacher_name"
					maxlength="6" required readonly value=${update_lecture.lecture_teacher_name }  />
					<input type="button" style="width: 100px;" value="강사 찾기" onclick="openChild()"
					required></td>
			</tr>
			
			<tr>
				<td><label for="lecture_name">강의 이름 : </label></td>
				<td><input type="text" name="lecture_name" 
					id="lecture_name" maxlength="50" value=${update_lecture.lecture_name } required /></td>
			</tr>
			<tr>
				<td><label for="lecture_intro">강의소개 : </label></td>
				<td><textarea onKeyUp="checkLength(this);"
						onKeyDown="checkLength(this);" name="lecture_intro"
						id="lecture_intro" rows="13" cols="40" wrap="off"
						>${update_lecture.lecture_intro }</textarea></td>
			</tr>
			<tr>
				<td><label for="lecture_student_limit">학생 정원: </label></td>
				<td><input type="number" name="lecture_student_limit"
					id="lecture_student_limit" min="1" max="50" 
					value=${update_lecture.lecture_student_limit } required /></td>
			</tr>
			
			<tr>
				<td><label for="lecture_start_period">강의 시작 날짜: </label></td>
				<td><input type="date" name="lecture_start_period"
					id="lecture_start_period" value=${update_lecture.lecture_start_period } required /></td>
			</tr>

			<tr>
				<td><label for="lecture_end_period">강의 끝나는 날 : </label></td>
				<td><input type="date" name="lecture_end_period"
					id="lecture_end_period" value=${update_lecture.lecture_end_period } required 
					onchange="isSame()"/>&nbsp;&nbsp;<span id="same"></span></td>
			</tr>
			

			<tr>
				<td><label for="lecture_cost">강의 비용 : </label></td>
				<td><input type="number" name="lecture_cost" id="lecture_cost"
					value=${update_lecture.lecture_cost } required /></td>
			</tr>		
			
			<tr>
				<td><label for="lecture_type">강의 종류 : </label></td>
				<td>
				<select name="lecture_type">
					  <option value="선택안함">선택안함</option>
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
				<td><label for="lecture_start_time">강의 시작 시간 : </label></td>
				<td><input type="time" name="lecture_start_time"
					id="lecture_start_time" value=${update_lecture.lecture_start_time } required /></td>
			</tr>

			<tr>
				<td><label for="lecture_end_time">강의 끝나는 시간 : </label></td>
				<td><input type="time" name="lecture_end_time"
					id="lecture_end_time" value=${update_lecture.lecture_end_time } required /></td>
			</tr>
			<tr>
				<td class="td_left">
					<label for = "lecture_image">사진 : </label>
				</td>
				<td class = "td_right">
					<input type = "file" name ="lecture_image" id="lecture_image" value="${update_lecture.lecture_image }"/>
				</td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="등록하기"> <input
					type="reset" value="새로 작성"></td>
			</tr>
		</table>
	</form>
<jsp:include page="/template/footer.jsp"/>
</body>
</html>