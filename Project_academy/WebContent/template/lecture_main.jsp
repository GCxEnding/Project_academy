<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="lecture.vo.LectureBean"%>

<div class="container">
      <!-- 메뉴 폼 끝 -->
      <div class="row">
        <!-- /.col-lg-3 -->
        <div class= "col-lg-12">
          <div class="row">
			<!-- 첫 메뉴 시작 -->
		<c:forEach var="lecture" items="${lectureList }">
            <div class="col-lg-3 col-md-6 mb-4">
              <div class="card h-100">
                <a href="lectureViewAction.lec?id=${lecture.lecture_code }&attend=${attend }"><img class="card-img-top" src="images/${lecture.lecture_image }" alt="images/Koala.jpg" height="300px"></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="lectureViewAction.lec?id=${lecture.lecture_code }&attend=${attend }">${lecture.lecture_name }</a>
                  </h4>
                  <h6>비용 : ${lecture.lecture_cost }원</h6>
                  <h6>기간 : ${lecture.lecture_start_period } 부터</h6>
                  <p class="card-text"></p>
                  <p>정원 : ${lecture.lecture_student_current }/${lecture.lecture_student_limit }</p>

                  <c:if test="${session_student_id != null }">
                  		<!-- 인원수에 여유가 있을땐 신청 버튼 출력 -->
						<c:if test="${lecture.lecture_student_current != lecture.lecture_student_limit }">
							<a class="card_title" href="lectureSubmitAction.lec?id=${lecture.lecture_code }">강의 신청</a></c:if>
						<!-- 인원수가 꽉 차면 메시지 변경 -->
						<c:if test="${lecture.lecture_student_current == lecture.lecture_student_limit }">
							<h6>인원 초과</h6></c:if>
				  </c:if>
				  <c:if test="${session_teacher_id eq 'admin' }">
				  			<a class="card_title" href="lectureUpdateFormAction.lec?id=${lecture.lecture_code }&where=main">[수정]</a>				 
				  			<a class="card_title" href="lectureDeleteAction.lec?id=${lecture.lecture_code }&where=main"><span style="color:red">[삭제]</span></a>
				  </c:if>
                  
                </div>
                <div class="card-footer">
                  <small class="text-muted">평가 : ${lecture.lecture_rating }</small>
                </div>
              </div>
            </div>
            
		</c:forEach>
           </div>
          </div>
         </div>
         
       </div> <!-- container -->