DROP SEQUENCE SO_contrib_seq ; 
create sequence SO_contrib_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SO_contrib_PK_trig 
before insert on SO_contrib
for each row 
begin 
select SO_contrib_seq.nextval into :new.contributor_id from dual; 
end; 
/
alter table SO_contrib add created date ; 
alter table SO_contrib add created_by VARCHAR2 (255) ; 
alter table SO_contrib add row_version_number integer ; 
alter table SO_contrib add updated date ; 
alter table SO_contrib add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SO_contrib_AUD_trig 
before insert or update on SO_contrib 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE SO_org_seq ; 
create sequence SO_org_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SO_org_PK_trig 
before insert on SO_org
for each row 
begin 
select SO_org_seq.nextval into :new.organization_id from dual; 
end; 
/
alter table SO_org add created date ; 
alter table SO_org add created_by VARCHAR2 (255) ; 
alter table SO_org add row_version_number integer ; 
alter table SO_org add updated date ; 
alter table SO_org add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SO_org_AUD_trig 
before insert or update on SO_org 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE SO_own_seq ; 
create sequence SO_own_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SO_own_PK_trig 
before insert on SO_own
for each row 
begin 
select SO_own_seq.nextval into :new.ownership_id from dual; 
end; 
/
alter table SO_own add created date ; 
alter table SO_own add created_by VARCHAR2 (255) ; 
alter table SO_own add row_version_number integer ; 
alter table SO_own add updated date ; 
alter table SO_own add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SO_own_AUD_trig 
before insert or update on SO_own 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE SO_person_seq ; 
create sequence SO_person_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger SO_person_PK_trig 
before insert on SO_person
for each row 
begin 
select SO_person_seq.nextval into :new.person_id from dual; 
end; 
/
alter table SO_person add created date ; 
alter table SO_person add created_by VARCHAR2 (255) ; 
alter table SO_person add row_version_number integer ; 
alter table SO_person add updated date ; 
alter table SO_person add updated_by VARCHAR2 (255) ; 
/
create or replace trigger SO_person_AUD_trig 
before insert or update on SO_person 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP INDEX SO_org_organization_id_FK_0 ;
CREATE INDEX SO_org_organization_id_FK_0 ON SO_contrib(SO_org_organization_id) ;
DROP INDEX SO_person_person_id_FK_1 ;
CREATE INDEX SO_person_person_id_FK_1 ON SO_contrib(SO_person_person_id) ;
DROP INDEX SO_org_organization_id_FK_2 ;
CREATE INDEX SO_org_organization_id_FK_2 ON SO_own(SO_org_organization_id) ;
DROP INDEX SO_person_person_id_FK_3 ;
CREATE INDEX SO_person_person_id_FK_3 ON SO_own(SO_person_person_id) ;
DROP INDEX SO_org_organization_id_FK_4 ;
CREATE INDEX SO_org_organization_id_FK_4 ON SO_person(SO_org_organization_id) ;
