declare
inn_cl varchar2(20):='20101199100000';
name_cl varchar(100);

begin
select name_v
into name_cl
from tb_client
where inn_v=inn_cl;

DBMS_OUTPUT.PUT_LINE('По ИНН : '||inn_cl||' Найден клиент: '||'"'||name_cl||'"');

exception 
   when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('По данному ИНН клиент не найден');
   when TOO_MANY_ROWS then DBMS_OUTPUT.PUT_LINE('По данному ИНН найдено более одного клиента');
   when others then DBMS_OUTPUT.PUT_LINE('Непредвиденная ошибка');

end;
---------------------------------------------------------------------------------------------
-----задача 2.

declare
full_name_cl varchar2(200);
found_more_than_one_client exception;

begin

   begin
   
   select name_v
   into full_name_cl
   from tb_client
   where name_v like '%Иванов%';

    exception 
       when TOO_MANY_ROWS 
            then RAISE found_more_than_one_client;
    end;

exception 
   when found_more_than_one_client 
   then DBMS_OUTPUT.PUT_LINE('C данной фамилией найдено более одного клиента');
end;
--------------------------------------------------------------------------------------------
---------задача 3

DECLARE
ID_cl	NUMBER;
NAME_V_cl	VARCHAR2(200);
BIRTHDATE_D_cl	DATE;
BIRTH_PLACE_ID_cl	NUMBER;
SEX_C_cl	CHAR(1);
INN_V_cl	VARCHAR2(200);
DOCUMET_ID_cl	NUMBER;
OCCUPATION_V_cl	VARCHAR2(200);
EMAIL_V_cl	VARCHAR2(200);

BEGIN
IF INN_V_cl IS NULL THEN RAISE_APPLICATION_ERROR(-20001,'поле ИНН обязательно к заполнению');
END IF;
INSERT INTO TB_CLIENT VALUES
(ID_cl,NAME_V_cl,BIRTHDATE_D_cl,BIRTH_PLACE_ID_cl,SEX_C_cl,INN_V_cl,DOCUMET_ID_cl,OCCUPATION_V_cl,EMAIL_V_cl,SYSDATE,null);

EXCEPTION 
WHEN OTHERS
THEN if(SQLCODE=-20001) then DBMS_OUTPUT.PUT_LINE('MESSAGE = '||SQLERRM);
                        DBMS_OUTPUT.PUT_LINE('CODE = '||SQLCODE);
end if;
END;
