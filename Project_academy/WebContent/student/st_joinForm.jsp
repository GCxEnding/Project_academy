<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Start 학원 - 회원가입 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	 var fullAddr = ''; // 최종 주소 변수
             var extraAddr = ''; // 조합형 주소 변수

             // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 fullAddr = data.roadAddress;

             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 fullAddr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
             if(data.userSelectedType === 'R'){
                 //법정동명이 있을 경우 추가한다.
                 if(data.bname !== ''){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있을 경우 추가한다.
                 if(data.buildingName !== ''){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('student_postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('student_first_address').value = fullAddr;

             // 커서를 상세주소 필드로 이동한다.
             document.getElementById('student_second_address').focus();
         }
    }).open();
}

function checkLength(student_introduction) {
    if (student_introduction.value.length > 1001 ) {
    	student_introduction.blur();
    	student_introduction.value = student_introduction.value.substring(0, 1001);
    	student_introduction.focus();
        return false;
    }
}
//비밀번호 확인하는 함수
function isSame() {
    var pw = document.joinform.student_password.value;
    var confirmPW = document.joinform.student_password_chk.value;

    if(document.getElementById('student_password').value!='' && document.getElementById('student_password_chk').value!='') {
        if(document.getElementById('student_password').value==document.getElementById('student_password_chk').value) {
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
	input[id=student_first_address],input[id=student_second_address]{
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
<section id = "joinformArea">
<form name="joinform" action="../studentJoinAction.st" method="post" enctype="multipart/form-data">
<table class = "joinform">
	<tr>
		<td colspan="2">
			<h2>회원가입 페이지</h2>
			<p>&nbsp;&nbsp;&nbsp;<span style="color:red">(*)</span> 항목은 필수 입력사항입니다.</p>
		</td>
	</tr>
	<div class = "a">
	<tr>
		<td><label for = "student_id">아이디<span style="color:red">(*)</span> : </label> </td>
		<td><input type="text" name="student_id" id = "student_id" 
		minlength="2" maxlength="15" required /></td>
	</tr>
	<tr>
		<td><label for = "student_password">비밀번호<span style="color:red">(*)</span> : </label></td>
		<td><input type="password" name="student_password" 
		id = "student_password"  maxlength="15" required/></td>
	</tr>
	<tr>
		<td><label for = "student_password_chk">비밀번호 확인<span style="color:red">(*)</span> : </label></td>
		<td><input type="password" id ="student_password_chk" 
		maxlength="15" required onchange="isSame()"/>&nbsp;&nbsp;<span id="same"></span></td>
	</tr>
	
	<tr>
		<td><label for = "student_name">이름<span style="color:red">(*)</span> : </label></td>
		<td><input type="text" name="student_name" id = "student_name" 
		 maxlength="6" required/></td>
	</tr>
	<tr>
		<td><label>주소<span style="color:red">(*)</span> : </label></td>
		<td>
			<input type="text" style="width: 30%; float: left;" id="student_postcode" 
			name="student_postcode" placeholder="우편번호" required readonly>
			<input type="button" style="width: 50px; float: left;" value="찾기" 
			onclick="postcode()" required>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><input style="float: left;" type="text" id="student_first_address" 
		name="student_first_address" placeholder="주소" readonly required></td>
	</tr>
	<tr>
		<td></td>
		<td><input style="float: left;" type="text" id="student_second_address" 
		name="student_second_address" placeholder="상세주소" required></td>
	</tr>
	<tr>
		<td><label for = "student_phone_number">휴대폰 번호<span style="color:red">(*)</span> : </label></td>
		<td><input type="text" name="student_phone_number" id = "student_phone_number" 
		 maxlength="11" required/></td>
	</tr>
	<tr>
		<td><label for = "">성별<span style="color:red">(*)</span> : </label></td>
		<td>
			<input type="radio" name="student_gender" value="남" checked="checked" id = "student_gender"/>남자
			<input type="radio" name="student_gender" value="여"/>여자
		</td>
	</tr>
	<tr>
		<td><label for = "student_birthday">생년월일<span style="color:red">(*)</span> : </label></td>
		<td><input type="text" name="student_birthday" id = "student_birthday" placeholder="ex)19880101형식"
		 maxlength="8" required/></td>
	</tr>
	<tr>
		<td><label for = "student_email">이메일 주소<span style="color:red">(*)</span> : </label></td>
		<td><input type="text" name="student_email" id = "student_email" required/></td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "student_image">사진 : </label>
		</td>
		<td class = "td_right">
			<input type = "file" name ="student_image" id="student_image"/>
		</td>
	</tr>
	<tr>
		<td><label for ="student_introduction">자기소개 : </label></td>
		<td><textarea onKeyUp="checkLength(this);" onKeyDown="checkLength(this);" name="student_introduction" id="student_introduction" rows="13" cols="40" wrap="off"></textarea></td>
	</tr>
	<tr>	
	</div>
	<tr>
		<td class = "button" colspan="2">
			<input type="submit" value="회원가입"/>&nbsp;&nbsp;
			<input type="reset" value ="다시작성"/>
		</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="../template/footer.jsp"/>
</body>
</html>


<% /*

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	 var fullAddr = ''; // 최종 주소 변수
             var extraAddr = ''; // 조합형 주소 변수

             // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 fullAddr = data.roadAddress;

             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 fullAddr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
             if(data.userSelectedType === 'R'){
                 //법정동명이 있을 경우 추가한다.
                 if(data.bname !== ''){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있을 경우 추가한다.
                 if(data.buildingName !== ''){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('student_postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('student_first_address').value = fullAddr;

             // 커서를 상세주소 필드로 이동한다.
             document.getElementById('student_second_address').focus();
         }
    }).open();
}

function checkLength(student_introduction) {
    if (student_introduction.value.length > 1001 ) {
    	student_introduction.blur();
    	student_introduction.value = student_introduction.value.substring(0, 1001);
    	student_introduction.focus();
        return false;
    }
}
//비밀번호 확인하는 함수
function isSame() {
    var pw = document.joinform.student_password.value;
    var confirmPW = document.joinform.student_password_chk.value;

    if(document.getElementById('student_password').value!='' && document.getElementById('student_password_chk').value!='') {
        if(document.getElementById('student_password').value==document.getElementById('student_password_chk').value) {
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
</head>
<body>
<section id = "joinformArea">
<form name="joinform" action="../studentJoinAction.st" method="post">
<table>
	<tr>
		<td colspan="2">
			<h1>학생 가입 페이지</h1>
		</td>
	</tr>
	<tr>
		<td><label for = "student_id">아이디 : </label> </td>
		<td><input type="text" name="student_id" id = "student_id" 
		maxlength="15" required /></td>
	</tr>
	<tr>
		<td><label for = "student_password">비밀번호 : </label></td>
		<td><input type="password" name="student_password" 
		id = "student_password"  maxlength="15" required/></td>
	</tr>
	<tr>
		<td><label for = "student_password_chk">비밀번호 확인 : </label></td>
		<td><input type="password" id ="student_password_chk" 
		maxlength="15" required onchange="isSame()"/>&nbsp;&nbsp;<span id="same"></span></td>
	</tr>
	
	<tr>
		<td><label for = "student_name">이름 : </label></td>
		<td><input type="text" name="student_name" id = "student_name" 
		 maxlength="6" required/></td>
	</tr>
	<tr>
		<td><label>주소</label></td>
		<td>
			<input type="text" style="width: 30%; float: left;" id="student_postcode" 
			name="student_postcode" placeholder="우편번호" required>
			<input type="button" style="width: 50px; float: left;" value="찾기" 
			onclick="postcode()" required>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><input style="float: left;" type="text" id="student_first_address" 
		name="student_first_address" placeholder="주소" readonly required></td>
	</tr>
	<tr>
		<td></td>
		<td><input style="float: left;" type="text" id="student_second_address" 
		name="student_second_address" placeholder="상세주소" required></td>
	</tr>
	<tr>
		<td><label for = "student_phone_number">휴대폰 번호 : </label></td>
		<td><input type="number" name="student_phone_number" id = "student_phone_number" 
		 maxlength="11" required/></td>
	</tr>
	<tr>
		<td><label for = "">성별 : </label></td>
		<td>
			<input type="radio" name="student_gender" value="남" checked="checked" id = "student_gender"/>남자
			<input type="radio" name="student_gender" value="여"/>여자
		</td>
	</tr>
	<tr>
		<td><label for = "student_birthday">생년월일 : </label></td>
		<td><input type="text" name="student_birthday" id = "student_birthday" 
		 maxlength="8" required/></td>
	</tr>
	<tr>
		<td><label for = "student_email">이메일 주소 : </label></td>
		<td><input type="text" name="student_email" id = "student_email" required/></td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "student_image">사진 : </label>
		</td>
		<td class = "td_right">
			<input type = "file" name ="student_image" id="student_image"/>
		</td>
	</tr>
	<tr>
		<td><label for ="student_introduction">자기소개 : </label></td>
		<td><textarea onKeyUp="checkLength(this);" onKeyDown="checkLength(this);" name="student_introduction" id="student_introduction" rows="13" cols="40" wrap="off"></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="회원가입"/>&nbsp;&nbsp;
			<input type="reset" value ="다시작성"/>
		</td>
	</tr>
</table>
</form>
</section>
</body>
</html>

*/
 %>