--Crétion du package school
create or replace package pkg_school as
function mean_subject(id_sub subject.id%type) return float;
function mean_field(id_f field.id%type)return FLOAT;
function mean_student(id_s student.id%type)return float;
function highest_mean return float;
procedure repeating_student_per_field(id_f field.id%type);
procedure top_ten_students;
procedure top_three_students_field(id_f field.id%type);
procedure delete_student(id_s student.id%type);
end pkg_school;
/
create or replace package body pkg_school as
function mean_subject(id_sub subject.id%type)return float IS
sum_grade float;
student_count int;
moy float;
begin
select count(student_id), sum(grade) into student_count, sum_grade from enrollment where subject_id=id_sub;
moy := sum_grade/student_count;
return(moy);
end mean_subject;

function mean_field(id_f field.id%type)return float is
grade_total float;
count_sub int;
mean_s float;
mean_f float;
id_sub subject.id%type;
cursor c_field is 
select subject_id from subject_field where field_id=id_f;
begin
select count(subject_id) into count_sub from subject_field where field_id=id_f;
mean_f := 0;
mean_s := 0;
grade_total := 0;
open c_field;
loop
fetch c_field into id_sub;
exit when c_field%notfound;
mean_s := mean_subject(id_sub);
grade_total:= grade_total + mean_s;
end loop;
close c_field;
mean_f:=grade_total/count_sub;
return mean_f;
Exception
When no_data_found then dbms_output.put_line ('this subject id does not exist');
end mean_field;

function mean_student(id_s student.id%type)return float is
sum_grade float;
sub_count int;
moy float;
begin
select count(subject_id), sum(grade) into sub_count, sum_grade from enrollment where student_id=id_s;
moy := sum_grade/sub_count;
return(moy);
Exception
When no_data_found then dbms_output.put_line ('this student id does not exist');
end mean_student;

function highest_mean return float is
count_stu int;
id_stu int;
mean_s float;
cursor c_moy is 
select id from student;
begin
select count(id) into count_stu from student;
mean_s := 0;
open c_moy;
loop
fetch c_moy into id_stu;
exit when c_moy%notfound;
if mean_s < mean_student(id_stu) then
mean_s := mean_student(id_stu);
end if;
end loop;
close c_moy;
return mean_s;
end highest_mean;


procedure repeating_student_per_field(id_f field.id%type) is 
cursor c_stu is 
select id from student where field_id=id_f;
nom varchar2(30);
id_stu int ;
prenom varchar2(30);
begin
open c_stu;
loop
fetch c_stu into id_stu;
exit when c_stu%notfound;
if mean_student(id_stu)<10 then
select first_name into prenom from student where id=id_stu;
select last_name into nom from student where id=id_stu;
dbms_output.put_line('Prénom : '||prenom||' Nom : '||nom|| ' Moyenne : '||mean_student(id_stu));
else dbms_output.put_line('Aucun élève n a redoublé dans cette section');
end if;
end loop;
close c_stu;
Exception
When no_data_found then dbms_output.put_line ('this field id does not exist');
end repeating_student_per_field;

procedure top_ten_students is
id_stu int ;
cursor c_stu is 
select id into id_stu from student order by mean_student(id) desc fetch first 10 rows only;
nom varchar2(30);
prenom varchar2(30);
i int;
begin
open c_stu;
i:=0;
loop
fetch c_stu into id_stu;
exit when c_stu%notfound;
select first_name into prenom from student where id=id_stu;
select last_name into nom from student where id=id_stu;
i:=i+1;
dbms_output.put_line('Prénom : '||prenom||' Nom : '||nom|| ' Moyenne : '||round(mean_student(id_stu),2)||' Classement : '||i);
end loop;
close c_stu;
end top_ten_students;

procedure top_three_students_field(id_f field.id%type) is
id_stu int ;
cursor c_stu is 
select id into id_stu from student where field_id=id_f order by mean_student(id) desc fetch first 3 rows only;
nom varchar2(30);
prenom varchar2(30);
i int;
begin
open c_stu;
i:=0;
loop
fetch c_stu into id_stu;
exit when c_stu%notfound;
select first_name into prenom from student where id=id_stu;
select last_name into nom from student where id=id_stu;
i:=i+1;
dbms_output.put_line('Prénom : '||prenom||' Nom : '||nom|| ' Moyenne : '||round(mean_student(id_stu),2)||' Classement : '||i);
end loop;
close c_stu;
Exception
When no_data_found then dbms_output.put_line ('this field id does not exist');
end top_three_students_field;

procedure delete_student(id_s student.id%type) is
begin 
delete from enrollment where student_id=id_s;
delete from student where id=id_s;
Exception
When no_data_found then dbms_output.put_line ('this student id does not exist');
end delete_student;
end pkg_school;


