<%@page import="board.vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	BoardBean article=(BoardBean)request.getAttribute("article");
    String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Start 학원</title>
<script language="javascript">
	</script>
<style type="text/css">
#registForm {
	width: 500px;
	height: 610px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: orange;
}

.td_right {
	width: 300px;
	background: skyblue;
}

#commandCell {
	text-align: center;
}

body{
background: url(images/설경.jpg) center no-repeat;
background-size: cover;
}

section id listForm{
background:white;
}
#registForm {
	width: 500px;
	height: 610px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: /*#c9c9b7;*/#3d3d38;
	text-align: center;
	
}
.td_right {
	width: 300px;
	background: #e5e5da;
}

#commandCell {
	text-align: center;
}

{
    font-family: 'Economica', sans-serif;
    font-size: 1.2rem;
}

/*Just giving out page a little space*/

.content-wrapper {
    padding: 3rem 4rem;
    margin: 2rem;
}

.menu {
  position: relative;
  height: 44px;
  background: #2b2f3a;
  width: auto;
}
.menu ul {
  list-style: none;
  padding: 0;
  margin: 0;
  line-height: 1;
}
.menu > ul {
  position: relative;
  display: block;
  background: #2b2f3a;
  width: 100%;
  z-index: 500;
}
.menu:after, .menu > ul:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
.menu.align-right > ul > li {
  float: right;
}
.menu.align-center ul {
  text-align: center;
}
.menu.align-center ul ul {
  text-align: left;
}
.menu > ul > li {
  display: inline-block;
  position: relative;
  margin: 0;
  padding: 0;
}
.menu > ul > #menu-button {
  display: none;
}
.menu ul li a {
  display: block;
  font-family: Helvetica, sans-serif;
  text-decoration: none;
}
.menu > ul > li > a {
  font-size: 14px;
  font-weight: bold;
  padding: 15px 20px;
  color: #fff;
  text-transform: uppercase;
  -webkit-transition: color 0.25s ease-out;
  -moz-transition: color 0.25s ease-out;
  -ms-transition: color 0.25s ease-out;
  -o-transition: color 0.25s ease-out;
  transition: color 0.25s ease-out;
}
.menu > ul > li.sub > a {
  padding-right: 32px;
}
.menu > ul > li:hover > a {
  color: #ffffff;
}
.menu li.sub::after {
  display: block;
  content: "";
  position: absolute;
  width: 0;
  height: 0;
}
.menu > ul > li.sub::after {
  right: 10px;
  top: 20px;
  border: 5px solid transparent;
  border-top-color: #7a8189;
}
.menu > ul > li:hover::after {
  border-top-color: #ffffff;
}
.menu ul ul {
  position: absolute;
  left: -9999px;
  top: 70px;
  opacity: 0;
  -webkit-transition: opacity .3s ease, top .25s ease;
  -moz-transition: opacity .3s ease, top .25s ease;
  -ms-transition: opacity .3s ease, top .25s ease;
  -o-transition: opacity .3s ease, top .25s ease;
  transition: opacity .3s ease, top .25s ease;
  z-index: 1000;
}
.menu ul ul ul {
  top: 37px;
  padding-left: 5px;
}
.menu ul ul li {
  position: relative;
}
.menu > ul > li:hover > ul {
  left: auto;
  top: 44px;
  opacity: 1;
}
.menu.align-right > ul > li:hover > ul {
  left: auto;
  right: 0;
  opacity: 1;
}
.menu ul ul li:hover > ul {
  left: 170px;
  top: 0;
  opacity: 1;
}
.menu.align-right ul ul li:hover > ul {
  left: auto;
  right: 170px;
  top: 0;
  opacity: 1;
  padding-right: 5px;
}
.menu ul ul li a {
  width: 130px;
  border-bottom: 1px solid #eeeeee;
  padding: 10px 20px;
  font-size: 12px;
  color: #9ea2a5;
  background: #ffffff;
  -webkit-transition: all .35s ease;
  -moz-transition: all .35s ease;
  -ms-transition: all .35s ease;
  -o-transition: all .35s ease;
  transition: all .35s ease;
}
.menu.align-right ul ul li a {
  text-align: right;
}
.menu ul ul li:hover > a {
  background: #f2f2f2;
  color: #8c9195;
}
.menu ul ul li:last-child > a, .menu ul ul li.last > a {
  border-bottom: 0;
}
.menu > ul > li > ul::after {
  content: '';
  border: 6px solid transparent;
  width: 0;
  height: 0;
  border-bottom-color: #ffffff;
  position: absolute;
  top: -12px;
  left: 30px;
}
.menu.align-right > ul > li > ul::after {
  left: auto;
  right: 30px;
}
.menu ul ul li.sub::after {
  border: 4px solid transparent;
  border-left-color: #9ea2a5;
  right: 10px;
  top: 12px;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
  -webkit-transition: -webkit-transform 0.2s ease, right 0.2s ease;
}
.menu.align-right ul ul li.sub::after {
  border-left-color: transparent;
  border-right-color: #9ea2a5;
  right: auto;
  left: 10px;
}
.menu ul ul li.sub:hover::after {
  border-left-color: #ffffff;
  right: -5px;
  -webkit-transform: rotateY(180deg);
  -ms-transform: rotateY(180deg);
  -moz-transform: rotateY(180deg);
  -o-transform: rotateY(180deg);
  transform: rotateY(180deg);
}
.menu.align-right ul ul li.sub:hover::after {
  border-right-color: #ffffff;
  border-left-color: transparent;
  left: -5px;
  -webkit-transform: rotateY(180deg);
  -ms-transform: rotateY(180deg);
  -moz-transform: rotateY(180deg);
  -o-transform: rotateY(180deg);
  transform: rotateY(180deg);
}

	footer {
				position: relative;
				width: 100%;
				height: 200px;
				background: green;
				color:white;
				font-size:15px;
			}	
			
		
.side-menu {
    padding: 0;
    margin: 0;
    font-size: 0;
    position: fixed;
    left: -120px;
    top: 100px;
    opacity: .95;
    overflow: hidden;
    -webkit-transition: all .3s ease-in-out;
    transition: all .3s ease-in-out;
}	
			
#menu-button {
    display: none;
}

/*if checkbox is checked next sibling's .side menu child slides in*/

#menu-button:checked + .menu-wrap .side-menu {
    left: 0px;
}

/*this is the label for the checkbox which act as a button for our menu*/

.menu-button--label {
    color: black;
    position: fixed;
    top: 100px;
    left: 10px;
    font-size: 3rem;
    text-align: center;
    line-height: 0;
    cursor: pointer;
    -webkit-transition: all 1s;
    transition: all 1s;
}

/*Fancy rotation effect for our menu button. It rotates back when mouse leaves it */

.menu-button--label:hover {
    -webkit-transform: rotateY(180deg);
    transform: rotateY(180deg);
    -webkit-transition: all 1s;
    transition: all 1s;
}

/*We are giving the li item a shorter width to activate 'pop-out' effect when you hover*/

.side-menu--list li {
    font-size: 0;
    width: 100px;
}
.side-menu--list a {
    color: #fff;
    display: block;
    text-decoration: none;
    height: 2rem;
    line-height: 2rem;
    background: #333;
    padding-left: 1rem;
    width: 180px;
    font-size: 1.2rem;
}
.side-menu--list {
    list-style: none;
    padding-left: 0;
}

/*.subset is a sub-menu that we are styling to stand out a bit*/

.side-menu--list li a.subset {
    font-size: 1.0rem;
    height: 2.2rem;
    line-height: 2.2rem;
    padding-left: .5rem;
    background: #222;
}

/*Applying overflow:hidden to get rid of the cluttering when the height is minimized*/

.side-menu--list li {
    height: 2.2rem;
    overflow: hidden;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

/*when you hover a li it expands to show all the menu links(and expands itself only)*/

.side-menu--list li:hover {
    height: 8.2rem;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
    cursor: pointer;
    width: 180px;
}

/*We are skipping a sub-menu link and applying transformation to the follow-ups*/

.side-menu--list li a:not(:first-child):hover {
    cursor: pointer;
    background-color: #fff;
    color: #333;
    -webkit-transition: all .3s ease-in-out;
    transition: all .3s ease-in-out;
    -webkit-transform: translateX(10px);
    transform: translateX(10px);
}
/*버튼 스타일 */
.button-3d {
  position:relative;
  width: auto;
  display:inline-block;
  color:white;
  text-decoration:none;
  border-radius:5px;
  border:solid 1px #f39c12;
  background:#1cdcff;
  text-align:center;
  padding:11px 12px 10px;
  margin: 12px;
  
  -webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	
  -webkit-box-shadow: 0px 6px 0px #d35400;
  -moz-box-shadow: 0px 6px 0px #7bc1ce;
  box-shadow: 0px 6px 0px #7bc1ce;
}

.button-3d:active{
    -webkit-box-shadow: 0px 2px 0px #d35400;
    -moz-box-shadow: 0px 2px 0px #d35400;
    box-shadow: 0px 2px 0px #d35400;
    position:relative;
    top:4px;
}
</style>
</head>
<body>

<div class='menu'>
			<ul>
				<li>
					<a href="index.jsp">메인화면</a>
				</li>
				<li>
					<a href='#'>회사 소개</a>
												<ul>
								<li>
									<a href="boardWriteForm.bo">직원소개</a>
								</li>
								<li class='last'>
									<a href="boardList.bo">우리학원모습</a>
								</li>
							</ul>
				</li>
				<li class='active sub'>
					<a href='#'>게시판 메뉴</a>
					<ul>
						<li class='sub'>
							<a href='#'>게시판 메뉴</a>
							<ul>
								<li>
									<a href="boardWriteForm.bo">게시판 글쓰기</a>
								</li>
								<li class='last'>
									<a href="boardList.bo">게시판 리스트</a>
								</li>
							</ul>
						</li>
						<li class='sub'>
							<a href='#'>CSS Tutorials</a>
							<ul>
								<li>
									<a href='#'>CSS Basic</a>
								</li>
								<li class='last'>
									<a href='#'>CSS Advanced</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href='#'>고객센터</a>
												<ul>
								<li>
									<a href="boardWriteForm.bo">찾아오시는길</a>
								</li>
								<li class='last'>
									<a href="boardList.bo">강의정보</a>
								</li>
							</ul>
				</li>
				<li class='last'>
					<a href='#'>강사/학생메뉴</a>
						<ul>
								<li>
									<a href="boardWriteForm.bo">강사메뉴</a>
								</li>
								<li class='last'>
									<a href="boardList.bo">학생메뉴</a>
								</li>
							</ul>
				</li>
			</ul>
		</div>
  <label for="menu-button" class="menu-button--label">▤</label>

    <!--    Checkbox state controls the menu position. When it is checked the menu slides in-->
    <input type="checkbox" id="menu-button">

    <!--    .menu-wrap is a wrapper for all the menu structure for the easier traversing-->
    <div class="menu-wrap">
        <div class="side-menu">
            <ul class="side-menu--list">
                <li>
                    <a class="subset">게시판 메뉴</a>
                    <a href="boardWriteForm.bo"> 게시판 글쓰기</a>
                    <a href="boardList.bo">게시판 리스트</a>
                    <a href=""></a>
                </li>
                <li>
                    <a class="subset" href="">고객센터</a>
                    <a href="">Solar panels</a>
                    <a href="">Electronics</a>
                    <a href="">Utilizers</a>
                </li>
                <li>
                    <a class="subset" href="">사이트정보</a>
                    <a href="">Staff</a>
                    <a href="">Contact</a>
                    <a href="">Media</a>
                </li>

            </ul>

        </div>
    </div>
	<!-- 게시판 답변 -->


	<section id="writeForm">
		<h2>[게시판글등록]</h2>
		<form action="boardReplyPro.bo" method="post" name="boardform">
			<input type="hidden" name="page" value="<%=nowPage %>" /> <input
				type="hidden" name="BOARD_NUM" value="<%=article.getBOARD_NUM() %>">
			<input type="hidden" name="BOARD_RE_REF"
				value="<%=article.getBOARD_RE_REF() %>"> <input
				type="hidden" name="BOARD_RE_LEV"
				value="<%=article.getBOARD_RE_LEV() %>"> <input
				type="hidden" name="BOARD_RE_SEQ"
				value="<%=article.getBOARD_RE_SEQ() %>">
			<table>
				<tr style="color:white";>
					<td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
					<td class="td_right"><input type="text" name="BOARD_NAME"
						id="BOARD_NAME" /></td>
				</tr>
				<tr style="color:white";>
					<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
					<td class="td_right"><input name="BOARD_PASS" type="password"
						id="BOARD_PASS" /></td>
				</tr>
				<tr style="color:white";>
					<td class="td_left"><label for="BOARD_SUBJECT">제 목</label></td>
					<td class="td_right"><input name="BOARD_SUBJECT" type="text"
						id="BOARD_SUBJECT" /></td>
				</tr>
				<tr style="color:white";>
					<td class="td_left"><label for="BOARD_CONTENT">내 용</label></td>
					<td><textarea id="BOARD_CONTENT" name="BOARD_CONTENT"
							cols="40" rows="15"></textarea></td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="답변글등록" class="button-3d"/>&nbsp;&nbsp;
				 <input type="reset" value="다시작성" class="button-3d"/>
				 <a href="javascript:history.go(-1)" class="button-3d">[뒤로]</a>
			</section>
		</form>
	</section>
		<footer>
			<br>
	<p align="center">
	저희 학원을 방문해주셔서 감사합니다.//
	</p>
	<p align="center">
	항상 좋은 강의를 제공하기 위해 노력하겠습니다 .//
	</P>
	<p align="center">
	주소 : 대구시 달서구 OO동 OO번지//</p>
	<p align="center">
	Tel. 053-OOOO-OOOO//
	</p>
	</footer> 
</body>
</html>