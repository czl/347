--this is ddl4, we are going to make a view for each level of the heirarch--y

drop view org_person;
drop view org_owner;
drop view org_employee;

--normal person
create view org_person AS
SELECT person_id, type, name, dob, SO_org_org_id
FROM SO_person
WHERE type = 'Person'; -- since type is person, we don't want to see the employee id

--in the database we can put rows of type person, employee, and owner
-- so we want to select from person all the rows of type person
-- that is what this above view does

--employee
create view org_employee as 
SELECT person_id, type, name, dob, empid
FROM SO_person
WHERE type = 'employee'; --since is employee, we need to have empid included

--creating a trigger to add stuff on the view
create or replace TRIGGER employee_trigger
	INSTEAD OF insert ON org_employee
	FOR EACH ROW
BEGIN
	insert into so_person(
		person_id,
		type,
		name,
		dob,
		empid)
	values(
	:new.person_id,
	:'Employee', -- we force the type to be 'Employee' with a cap E, since that is important
	:new.NAME,
	:new.dob,
	:new.empid);
END;
/