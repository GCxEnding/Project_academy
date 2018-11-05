<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="teacher.vo.TeacherBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	`teacher_id` VARCHAR(15) NOT NULL,
  `teacher_password` VARCHAR(15) NOT NULL,
  `teacher_name` VARCHAR(6) NOT NULL,
  `teacher_first_address` VARCHAR(40) NOT NULL,
  `teacher_second_address` VARCHAR(40) NOT NULL,
  `teacher_postcode` MEDIUMINT NOT NULL,
  `teacher_phone_number` VARCHAR(11) NOT NULL,
  `teacher_gender` CHAR(2) NOT NULL,
  `teacher_birthday` VARCHAR(8) NOT NULL,
  `teacher_email` VARCHAR(30) NOT NULL,
  `teacher_image` VARCHAR(20) NULL,
  `teacher_introduction` VARCHAR(1000) NULL,
  `teacher_subject` VARCHAR(30) NULL,
  `teacher_position` VARCHAR(10) NOT NULL COMMENT '직장에서의 계급',
  `teacher_salary` INT NULL COMMENT '강사연봉(월급)',
  
	
	
	
	각각의 인풋 타입의 이름은 DB의 열 이름을 그대로 사용해야 한다.
	수정하기 버튼을 누르면 teacherUpdateAction.tea으로 넘긴다.
	
 -->
 
<% 

	TeacherBean teacher = (TeacherBean)request.getAttribute("update_teacher");
	//TeacherUpdateFormAction에 있는 update_teacher를 가져옴
	System.out.print(teacher.getTeacher_id());
	System.out.print(teacher.getTeacher_introduction());
	
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 수정 폼</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function postcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('teacher_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('teacher_first_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('teacher_second_address')
								.focus();
					}
				}).open();
	}

	function checkLength(teacher_introduction) {
		if (teacher_introduction.value.length > 1001) {
			teacher_introduction.blur();
			teacher_introduction.value = teacher_introduction.value.substring(
					0, 1001);
			teacher_introduction.focus();
			return false;
		}
	}
	//비밀번호 확인하는 함수
	function isSame() {
	    var pw = document.joinform.teacher_password.value;
	    var confirmPW = document.joinform.teacher_password_chk.value;

	    if(document.getElementById('teacher_password').value!='' && document.getElementById('teacher_password_chk').value!='') {
	        if(document.getElementById('teacher_password').value==document.getElementById('teacher_password_chk').value) {
	            document.getElementById('same').innerHTML='일치해';
	            document.getElementById('same').style.color='blue';
	        }
	        else {
	            document.getElementById('same').innerHTML='일치안해';
	            document.getElementById('same').style.color='red';
	        }
	    }
	}</script>
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
	input[id=teacher_first_address],input[id=teacher_second_address]{
		background-color : #F15F5F;
		color : #FFF;
		width : 65%;
	}
	label {
		float : right;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
</style>
</head>
<body>
<jsp:include page="/template/template.jsp"/>
	<section id="joinformArea">
	<form name="joinform" action="./teacherUpdateAction.tea" method="post" enctype="multipart/form-data">
		<table class="joinform">
			<tr>
				<td colspan="2">
					<h2>강사 수정 페이지</h2>
				</td>
			</tr>
		<div>
			<tr>
				<td><label for="teacher_id">아이디 :</label></td>
				<td><input type="text" id="teacher_id" name="teacher_id" value=${update_teacher.teacher_id }></td>
			</tr>
			<tr>
				<td><label for="teacher_password">비밀번호 : </label></td>
				<td><input type="password" name="teacher_password"
					id="teacher_password" required/></td>
			</tr>
			<tr>
				<td><label for = "teacher_password_chk">비밀번호 확인 : </label></td>
				<td><input type="password" id ="teacher_password_chk" 
				maxlength="15" required onchange="isSame()"/>&nbsp;&nbsp;<span id="same"></span></td>
			</tr>
			<tr>
				<td><label for="teacher_name">이름 : </label></td>
				<td><input type="text" name="teacher_name" id="teacher_name"
					value=${update_teacher.teacher_name } required /></td>
			</tr>
			<tr>
				<td><label>주소</label></td>
				<td><input type="text" style="width: 30%; float: left;"
					id="teacher_postcode" name="teacher_postcode" value=${update_teacher.teacher_postcode }
					placeholder="우편번호" readonly required> <input type="button"
					style="width: 50px; float: left;" value="찾기" onclick="postcode()"
					 required></td>
			</tr>
			<tr>
				<td></td>
				<td><input style="float: left;" type="text"
					id="teacher_first_address" name="teacher_first_address"
					value="${update_teacher.teacher_first_address }" readonly required></td>
			</tr>
			<tr>
				<td></td>
				<td><input style="float: left;" type="text"
					id="teacher_second_address" name="teacher_second_address"
					value="${update_teacher.teacher_second_address }" placeholder="상세주소" required></td>
			</tr>
			<tr>
				<td><label for="teacher_phone_number">휴대폰 번호 : </label></td>
				<td><input type="text" name="teacher_phone_number" id="teacher_phone_number"
				value=${update_teacher.teacher_phone_number } required /></td>
			</tr>
			<tr>
				<td><label for="teacher_gender">성별 : </label></td>
				<%if (teacher.getTeacher_gender().equals("남")) {%>
				<td><input type="radio" name="teacher_gender" value="남"
					checked="checked" id="teacher_gender" />남자 <input type="radio"
					name="teacher_gender" value="여" />여자</td>
				<%} else {%>
				<td><input type="radio" name="teacher_gender" value="남"
					id="teacher_gender" />남자 <input type="radio" 
					checked="checked" name="teacher_gender" value="여" />여자</td>
				<%} %>
					
			</tr>
			<tr>
				<td><label for="teacher_birthday">생년월일 : </label></td>
				<td><input type="text" name="teacher_birthday"
					value=${update_teacher.teacher_birthday } id="teacher_birthday" required /></td>
			</tr>
			<tr>
				<td><label for="teacher_email">이메일 주소 : </label></td>
				<td><input type="text" name="teacher_email" id="teacher_email"
					value=${update_teacher.teacher_email } required /></td>
			</tr>
			<tr>
				<td class="td_left"><label for="teacher_image">사진 : </label></td>
				<td class="td_right">
				<input type="file" name="teacher_image" id="teacher_image" /></td>
			</tr>
			<tr>
				<td><label for="teacher_introduction">자기소개 : </label></td>
				<td><textarea onKeyUp="checkLength(this);"
						onKeyDown="checkLength(this);" name="teacher_introduction"
						id="teacher_introduction" rows="13" cols="40" wrap="off"
						><%=teacher.getTeacher_introduction()%></textarea></td>
			</tr>
			<tr>
				<td><label for="teacher_subject">담당과목 : </label></td>
				<td><input type="text" name="teacher_subject" id="teacher_subject"
				value=${update_teacher.teacher_subject } readonly/></td>
			</tr>
			<tr>
				<td><label for="teacher_position">직급 : </label></td>
				<td><input type="text" name="teacher_position" id="teacher_position"
				value=${update_teacher.teacher_position } required /></td>
				<!-- 클릭하면 내려오는박스로 -->
			</tr>
			<tr>
				<td><label for="teacher_salary">연봉 : </label></td>
				<td><input type="text" name="teacher_salary" id="teacher_salary"
				value=${update_teacher.teacher_salary } /></td>
			</tr>
					<!-- 연봉 빈칸시 처리할 방법은? -->
		</div>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정하기">
					<input type="reset" value="새로 작성">
				</td>
			</tr>
		</table>
	</form>
	</section>
<jsp:include page="/template/footer.jsp"/>
</body>
</html>