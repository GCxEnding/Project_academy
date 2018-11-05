<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
//id에 값이 있으면 아래 실행
//삭제를 시도하는자가 관리자인지 확인하는 구문
// loginAction에서 설정된 session_id임. 여기선 관리자 여부를 확인하기 위해 필요.
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	String session_id = ((String)session.getAttribute("session_teacher_id"));

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
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Start 학원 - 강사 가입 페이지</title>
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
	            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('same').style.color='blue';
	        }
	        else {
	            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('same').style.color='red';
	        }
	    }
	}
</script>
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
	<form name="joinform" action="../teacherJoinAction.tea" method="post" enctype="multipart/form-data">
		<table class = "joinform">
			<tr>
				<td colspan="2">
					<h2>강사가입 페이지</h2>
					<p>&nbsp;&nbsp;&nbsp;<span style="color:red">(*)</span> 항목은 필수 입력사항입니다.</p>
				</td>
			</tr>
		<div>
			<tr>
				<td><label for="teacher_id">아이디<span style="color:red">(*)</span> : </label></td>
				<td><input type="text" name="teacher_id" id="teacher_id"
					required /></td>
			</tr>
			<tr>
				<td><label for="teacher_password">비밀번호<span style="color:red">(*)</span> : </label></td>
				<td><input type="password" name="teacher_password"
					id="teacher_password" required /></td>
			</tr>
			<tr>
				<td><label for = "teacher_password_chk">비밀번호 확인<span style="color:red">(*)</span> : </label></td>
				<td><input type="password" id ="teacher_password_chk" 
				maxlength="15" required onchange="isSame()"/>&nbsp;&nbsp;<span id="same"></span></td>
			</tr>
					
			<tr>
				<td><label for="teacher_name">이름<span style="color:red">(*)</span> : </label></td>
				<td><input type="text" name="teacher_name" id="teacher_name"
					required /></td>
			</tr>
			<tr>
				<td><label>주소<span style="color:red">(*)</span> :</label></td>
				<td><input type="text" style="width: 30%; float: left;"
					id="teacher_postcode" name="teacher_postcode" placeholder="우편번호"
					required readonly> <input type="button"
					style="width: 50px; float: left;" value="찾기" onclick="postcode()"
					required></td>
			</tr>
			<tr>
				<td></td>
				<td><input style="float: left;" type="text"
					id="teacher_first_address" name="teacher_first_address"
					placeholder="주소" readonly required></td>
			</tr>
			<tr>
				<td></td>
				<td><span style="color:red">(*)</span><input style="float: left;" type="text"
					id="teacher_second_address" name="teacher_second_address"
					placeholder="상세주소" required></td>
			</tr>
			<tr>
				<td><label for="teacher_phone_number">휴대폰 번호<span style="color:red">(*)</span> : </label></td>
				<td><input type="text" name="teacher_phone_number"
					id="teacher_phone_number" maxlength="11" required /></td>
			</tr>
			<tr>
				<td><label for="">성별<span style="color:red">(*)</span> : </label></td>
				<td><input type="radio" name="teacher_gender" value="남"
					checked="checked" id="teacher_gender" />남자&nbsp;&nbsp;<input type="radio"
					name="teacher_gender" value="여" />여자</td>
			</tr>
			<tr>
				<td><label for="teacher_birthday">생년월일<span style="color:red">(*)</span> : </label></td>
				<td><input type="text" name="teacher_birthday"
					id="teacher_birthday" placeholder="ex)19880101 형태" minlength ="8" maxlength="8" required  /></td>
			</tr>
			<tr>
				<td><label for="teacher_email">이메일 주소<span style="color:red">(*)</span> : </label></td>
				<td><input type="text" name="teacher_email" id="teacher_email"
					required /></td>
			</tr>
			<tr>
				<td class="td_left"><label for="teacher_image">사진 : </label></td>
				<td class="td_right"><input type="file" name="teacher_image"
					id="teacher_image" /></td>
			</tr>
			<tr>
				<td><label for="teacher_introduction">자기소개 : </label></td>
				<td><textarea onKeyUp="checkLength(this);"
						onKeyDown="checkLength(this);" name="teacher_introduction"
						id="teacher_introduction" rows="13" cols="40" wrap="off"></textarea></td>
			</tr>
			<tr>
				<td><label for="teacher_subject">담당과목<span style="color:red">(*)</span> : </label></td>
				<td><select name="teacher_subject">
					  <option value="기타" selected>기타</option>
					  <option value="전기/전자">전기/전자</option>
					  <option value="기계">기계</option>
					  <option value="토목">토목</option>
					  <option value="의료">의료</option>
				</select> 
				</td>
			</tr>

			<tr>
				<td><label for="teacher_position">직급<span style="color:red">(*)</span> : </label></td>
				<td><select name="teacher_position">
					  <option value="사원" selected="selected">사원</option>
					  <option value="대리">대리</option>
					  <option value="차장">차장</option>
					  <option value="과장">과장</option>
				</select> 
				</td>
				<!-- 클릭하면 내려오는박스로 -->
			</tr>
			<tr>
				<td><label for="teacher_salary">연봉 : </label></td>
				<td><input type="text" name="teacher_salary" id="teacher_salary" /></td>
			</tr>
					<!-- 연봉 빈칸시 처리할 방법은? -->
		</div>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입하기">
					<input type="reset" value="새로 작성">
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="/template/footer.jsp"/>
</body>
</html>