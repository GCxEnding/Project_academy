INSERT INTO lecture_info (lecture_code,lecture_teacher_id,lecture_name, lecture_teacher_name,lecture_intro,lecture_student_current,lecture_student_limit)values ('codetest1', 'teacherId1', 'lectureName1', 'tName1', 'lecIntro1','0', '10');


INSERT INTO teacher_info (teacher_id, teacher_password, teacher_name, teacher_first_address,
teacher_second_address, teacher_postcode, teacher_phone_number, teacher_gender, teacher_birthday,
teacher_email, teacher_position) values (
'teacherId1', 'teacherId1', 'tName1',
'주소1','주소2', '12345', 
'23454354', '남','123466', 
'testEmail','연습용');


insert into lecture_submit_list(submit_lecture_code, submit_id, submit_payment,
submit_state, submit_st_memo) values('code', 'stID', '1','수강신청','메모!');