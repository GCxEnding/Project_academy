<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
  font-family: "Lucida Sans Typewriter", "Lucida Console", Monaco, "Bitstream Vera Sans Mono", monospace;
  margin: 0px;
  padding: 50px;
  background: #e1e1e1;
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

body {
    font-family: 'Economica', sans-serif;
    font-size: 1.2rem;
}

/*Just giving out page a little space*/

.content-wrapper {
    padding: 3rem 4rem;
    margin: 2rem;
}

/*We are fixing a menu and pulling them out of the screen by negative 'left'*/

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

/*We need to hide the default input box*/

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
    top: 150px;
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
    width: 110px;
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
    font-size: 1.4rem;
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

body {
background: url(images/설경.jpg) center no-repeat;
background-size: cover;
}
	footer {
				position: relative;
				width: 100%;
				height: 200px;
				background: green;
				color:white;
				font-size:15px;
			}	
.signUp {
   position: relative;
   margin: 50px auto;
   width: 280px;
   padding: 33px 25px 29px;
   background: #FFFFFF;
   border-bottom: 1px solid #C4C4C4;
   border-radius: 5px;
   -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
   box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

.signUp:before,
.signUp:after {
   content: '';
   position: absolute;
   bottom: 1px;
   left: 0;
   right: 0;
   height: 10px;
   background: inherit;
   border-bottom: 1px solid #D2D2D2;
   border-radius: 4px;
}

.signUp:after {
   bottom: 3px;
   border-color: #DCDCDC;
}

.signUpTitle {
   margin: -25px -25px 25px;
   padding: 15px 25px;
   line-height: 35px;
   font-size: 26px;
   font-weight: 300;
   color: #777;
   text-align: center;
   text-shadow: 0 1px rgba(255, 255, 255, 0.75);
   background: #F7F7F7;
}

.signUpTitle:before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 8px;
   background: #C4E17F;
   border-radius: 5px 5px 0 0;
   background-image: -webkit-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #db9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: -moz-linear-gradient(left, #c4e17f, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: -o-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCC 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9DBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: linear-gradient(to right, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #c49cde 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62c2e4 87.5%, #62C2E4);
}

input {
   font-family: inherit;
   color: inherit;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.signUpInput {
   width: 100%;
   height: 50px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #EBEBEB;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #EBEBEB;
   box-shadow: inset 0 -2px #EBEBEB;
}

.signUpInput:focus {
   border-color: #62C2E4;
   outline: none;
   -webkit-box-shadow: inset 0 -2px #62C2E4;
   box-shadow: inset 0 -2px #62C2E4;
}

.lt-ie9 .signUpInput {
   line-height: 48px;
}

.signUpButton {
   position: relative;
   vertical-align: top;
   width: 100%;
   height: 54px;
   padding: 0;
   font-size: 22px;
   color: white;
   text-align: center;
   text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
   background: #F0776C;
   border: 0;
   border-bottom: 2px solid #D76B60;
   border-radius: 5px;
   cursor: pointer;
   -webkit-box-shadow: inset 0 -2px #D76B60;
   box-shadow: inset 0 -2px #D76B60;
}

.signUpButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
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
                    <a class="subset" href="">로그인/로그아웃</a>
                    <a href="login.jsp">로그인</a>
                    <a href="">로그아웃</a>
                </li>
					
				                <li>
                    <a class="subset" href="boardList.bo">HOME</a>

                </li>
            </ul>

        </div>
    </div>
<form action="" class="signUp" id="signupForm">
   <h1 class="signUpTitle">Sign up in seconds</h1>
   <input type="text" class="signUpInput" placeholder="Type your username" autofocus required>
   <input type="password" class="signUpInput" placeholder="Choose a password" required>
   <input type="submit" value="Sign me up!" class="signUpButton">
</form>
<footer>
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