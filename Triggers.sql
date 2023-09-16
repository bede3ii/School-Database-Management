create or replace trigger student_trigger
before insert or update on student
for each row
begin
  if :NEW.id not between 1 and 99 then
    RAISE_APPLICATION_ERROR (-20001, 'You can only insert ids between 1 and 99');
  end if;
end student_id;

create or replace trigger teacher_trigger
before insert or update on teacher
for each row
begin
  if :NEW.id not between 100 and 199 then
    RAISE_APPLICATION_ERROR (-20002, 'You can only insert ids between 100 and 199');
  end if;
end teacher_id;

create or replace trigger field_trigger
before insert or update on field
for each row
begin
  if :NEW.id not between 200 and 299 then
    RAISE_APPLICATION_ERROR (-20003, 'You can only insert ids between 200 and 299');
  end if;
end field_id;

create or replace trigger subject_trigger
before insert or update on subject
for each row
begin
  if :NEW.id not between 300 and 399 then
    RAISE_APPLICATION_ERROR (-20004, 'You can only insert ids between 300 and 399');
  end if;
end subject_id;