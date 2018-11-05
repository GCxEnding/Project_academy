INSERT INTO student_info values ('first', 'first', '첫빠따', '임ㅅ주소', '두번째임시', '10346', '01055885588', '남', '19275848', 'hoho@fucq.com', '12.jpg', '처음임', '1', '상담내용', '강사메모');
,('second', 'second', '첫빠따', '임ㅅ주소', '두번째임시', '10346', '01055885588', '남',
'19275848', 'hoho@fucq.com', '12.jpg', '처음임', '100', '1', '상담내용', '강사메모')
,('third', 'third', '첫빠따', '임ㅅ주소', '두번째임시', '10346', '01055885588', '남',
'19275848', 'hoho@fucq.com', '12.jpg', '처음임', '100', '1', '상담내용', '강사메모');


테스트용 

관리자 삽입
insert into teacher_info values ('admin','admin','관리자','','','00000','','','','','','','','','0');
학생 삽입
INSERT INTO student_info values ('first', 'first', '첫빠따', '임ㅅ주소', '두번째임시', '10346', '01055885588', '남', '19275848', 'hoho@fucq.com', '12.jpg', '처음임', '1', '상담내용', '강사메모');
강사 삽입
insert into teacher_info values ('gangtest1230', 'gangtest1230', '테스트강사', '서울 강남구 압구정로 102 (신사동, 형지제2빌딩)', '두번째상세주소', '12345', '01012345678', '남', '19881022', 'email@jcjc.com', '', '', '토목', '사원', 0);
강의 삽입
INSERT INTO lecture_info (lecture_code,lecture_teacher_id,lecture_name, lecture_teacher_name,lecture_intro,lecture_student_current,lecture_student_limit)values ('codetest1', 'teacherId1', 'lectureName1', 'tName1', 'lecIntro1','0', '10');