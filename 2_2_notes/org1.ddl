DROP SEQUENCE SO_contrib_seq ; 
create sequence SO_contrib_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SO_contrib_PK_trig 
; 

create or replace trigger SO_contrib_PK_trig 
before insert on SO_contrib
for each row 
begin 
select SO_contrib_seq.nextval into :new.contributor_id from dual; 
end; 
/

DROP SEQUENCE SO_org_seq ; 
create sequence SO_org_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SO_org_PK_trig 
; 

create or replace trigger SO_org_PK_trig 
before insert on SO_org
for each row 
begin 
select SO_org_seq.nextval into :new.organization_id from dual; 
end; 
/

DROP SEQUENCE SO_own_seq ; 
create sequence SO_own_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SO_own_PK_trig 
; 

create or replace trigger SO_own_PK_trig 
before insert on SO_own
for each row 
begin 
select SO_own_seq.nextval into :new.ownership_id from dual; 
end; 
/

DROP SEQUENCE SO_person_seq ; 
create sequence SO_person_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER SO_person_PK_trig 
; 

create or replace trigger SO_person_PK_trig 
before insert on SO_person
for each row 
begin 
select SO_person_seq.nextval into :new.person_id from dual; 
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
