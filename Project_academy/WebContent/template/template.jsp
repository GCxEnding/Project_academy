<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page import="lecture.vo.LectureBean"%>
<%@page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//	String teacher_id = ((String) session.getAttribute("session_teacher_id"));
//	String student_id = ((String) session.getAttribute("session_student_id"));

%>
<!-- 관리자 전용 페이지 -->
<html lang="ko">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Start 학원</title>

    <!-- Bootstrap core CSS -->
    <link href="/Project_academy/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/Project_academy/css/shop-homepage.css" rel="stylesheet">
	<!--  메뉴 폼 스타일 -->
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
  margin-top : 30px;
  width: auto;
  text-align : center;
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
footer {
				position: relative;
				width: 100%;
				height: 150px;
				background: #696969;
				color:white;
				font-size:15px;
			}	
<!--  메뉴 폼 스타일 끝-->
</style>
  </head>

  <body>
	
    <!-- Navigation 상단바-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/Project_academy/index.jsp">Start 학원</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
     
     <!-- 학생 강사 관리자 로그인 현황 구분 시작 -->
     <c:choose>
	     <c:when test="${session_student_id != null }">
	        <p class="navbar-brand">학생 ${session_student_id }로 로그인</p></c:when>
		 <c:when test="${session_teacher_id eq 'admin'}">
	        <p class="navbar-brand">관리자 모드</p></c:when>
		 <c:when test="${session_teacher_id != null }">
			<p class="navbar-brand">강사 ${session_teacher_id }으로 로그인</p></c:when>
    </c:choose>
    <!-- 학생 강사 관리자 로그인 현황 구분 끝-->
	            <li class="nav-item active">
	              <a class="nav-link" href="/Project_academy/index.jsp">홈
	                <span class="sr-only">(current)</span>
	              </a>
	            </li>    
	<!-- 로그인 링크 또는 로그아웃 링크 시작-->
	<c:choose>
	        <c:when test="${session_teacher_id == null && session_student_id == null}">
	        	<li class="nav-item">
	              	<a class="nav-link" href="/Project_academy/student/st_loginForm.jsp">로그인</a>
	            </li>
	            <li class="nav-item">
             	 	<a class="nav-link" href="/Project_academy/teacher/tea_loginForm.jsp">교직원</a>
           		</li>
           		 <li class="nav-item">
              	 	<a class="nav-link" href="/Project_academy/student/st_joinForm.jsp">회원 가입</a>
                </li>

            </c:when>	
        <c:otherwise>
        <!-- 로그인 되어있다면 모든 로그인 버튼 삭제 -->
            <li class="nav-item">
              <a class="nav-link" href="/Project_academy/studentLogoutAction.st">로그아웃</a>
            </li>
        </c:otherwise> 
   	</c:choose>
   	<!-- 로그인 링크 또는 로그아웃 링크 끝-->
                <c:if test="${session_teacher_id eq 'admin'}">
	   				<li class="nav-item">
	              	 	<a class="nav-link" href="/Project_academy/teacher/tea_joinForm.jsp">강사 가입</a>
	                </li>
                </c:if>
          </ul>	
        </div>
      </div>
    </nav>
	
    <!-- Page Content -->
    <div class="container">

		<!-- 메뉴 폼 -->
        <div class='menu'>
			<ul>
				<li>
					<a href="/Project_academy/boardList.bo">공지사항</a>
							<ul>
								<li>
									<a href="/Project_academy/boardList.bo">공지사항</a>
								</li>
							<c:if test="${session_teacher_id != null  }">
								<li>
									<a href="/Project_academy/board/qna_board_write.jsp">글쓰기</a>
								</li>
							</c:if>
							</ul>
				</li>
				<!-- 1 -->
				<li>
					<a href="#">학원 소개</a>
							<ul>
								<li>
									<a href="/Project_academy/teacherListAction.tea">강사 목록</a>
								</li>
							</ul>
				</li>
				<!-- 3 -->
				<c:if test="${session_student_id != null }">
				<li>
					<a href='#'>학생 메뉴</a>
							<ul>
								<li>
									<a href="/Project_academy/lectureMyLectureAction.lec?id=${session_student_id }">내 강의 보기</a>
								</li>
								<li>
									<a href="/Project_academy/studentViewAction.st?id=${session_student_id }">내 정보 보기</a>
								</li>
								<li>
									<a href="/Project_academy/Calendar.st">내 출결 보기</a>
								</li>
								<li>
									<a href="/Project_academy/lecture/lec_rating.jsp">강의 평가</a>
								</li>
								
							</ul>
				</li>
				</c:if>
				<!-- 4 -->
				<c:if test="${session_teacher_id != null }">
				<li class='last'>
					<a href='#'>강사 메뉴</a>
						<ul>
				<!-- 관리자 -->
							<c:if test="${session_teacher_id eq 'admin' }">
								<li>
									<a href="/Project_academy/teacher/tea_joinForm.jsp">강사 등록</a>
								</li>
								<li>
									<a href="/Project_academy/lecture/lec_createForm.jsp">강의 등록</a>
								</li>
								
							</c:if>
				<!-- 강사 -->
								
								<li>
									<a href="/Project_academy/lectureListAction.lec">강의 목록 보기</a>
								</li>
								<li>
									<a href="/Project_academy/studentListAction.st">학생 목록 보기</a>
								</li>
							<c:if test="${session_teacher_id != 'admin'  }">
								<li>
									<a href ="/Project_academy/teacherViewAction.tea?id=
									${session_teacher_id }">내 정보 보기</a>
								</li>
								<li>
									<a href="/Project_academy/lectureListAction.lec?id=${session_teacher_id }">내 강의 목록</a>
								</li>
								<!-- 
								<li class='last'>
									<a href="/Project_academy/miss.jsp">성적 입력</a>
								</li>
							 -->
							</c:if>
						</ul>
				</li>
				</c:if>
				
			</ul>
		</div>

    </div>
    <!-- /.container -->

    <!-- Footer -->

    <!-- Bootstrap core JavaScript -->
    <script src="/Project_academy/vendor/jquery/jquery.min.js"></script>
    <script src="/Project_academy/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
  </body>

</html>
