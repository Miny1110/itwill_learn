--LEE

SELECT * FROM CUSTOM;

--������ �ִ� �����Ϳ��� �ֹι�ȣ ��������
SELECT USERNAME, RPAD(SUBSTR(JUMIN,1,8),14,'*') JUMIN FROM CUSTOM;

SELECT * FROM CUSTOM;

--�ּҺ� �ο��� ���ϱ�
SELECT ADDR1,COUNT(*),ROUND(AVG(POINT)) FROM  CUSTOM
GROUP BY ADDR1;


-------------------------------------------------------------------------------------------

--����Ŭ�� SWITCH��
--������ �ִ� ���� ������ ��/���� ������� ������ �Ļ��÷�
--�Ļ��÷��̱⶧���� ��Ī�� �� �������־�� �Ѵ�.

SELECT
CASE SEX
WHEN '1' THEN '����'
WHEN '0' THEN '����'
END GENDER,
COUNT(*),ROUND(AVG(AGE)) FROM CUSTOM
GROUP BY SEX;
/*
SELECT
CASE �÷���
	WHEN 1 THEN 100
	WHEN 2 THEN 200
	WHEN 3 THEN 300
	WHEN 4 THEN 400
	ELSE 500
END AS ��Ī,
FROM DUAL;

SELECT
CASE �÷��� WHEN 1 THEN 100 ELSE 0,
CASE �÷��� WHEN 2 THEN 200 ELSE 0,
CASE �÷��� WHEN 3 THEN 300 ELSE 0,
CASE �÷��� WHEN 4 THEN 400 ELSE 0,
FROM DUAL;
*/

SELECT * FROM CUSTOM;

SELECT
CASE ADDR1
WHEN '����Ư����' THEN '����'
WHEN '��⵵' THEN '���'
WHEN '��󳲵�' THEN '�泲'
END ADDR
FROM CUSTOM;


-------------------------------------------------------------------------------------------

/*
JOIN��
EQUIE JOIN(INNER JOIN)
NON-EQUIE JOIN
OUTER JOIN
CROSS JOIN
SELF JOIN
*/

--JOIN���� Ư¡ : ����Ǵ� �и� �־�� ���ι��� ������ �� �ִ�.
--������ ��������. �ȸ���� ���ι� ��ü�� ����� �� ���� ������ ���͸� DB�� �ȴ�.


SELECT * FROM TAB;

SELECT * FROM CUSTOM WHERE USERID='nu7634';
SELECT * FROM COMPANY WHERE USERID='nu7634';
SELECT * FROM POINT WHERE USERID='nu7634';
SELECT * FROM SALES WHERE USERID='nu7634';
--���̺�鳢�� ����Ǵ� �÷��� �־�߸� ���ι��� �����ϴ�.
--����и��� USERID='nu7634'�� �ֱ� ������, �� ����� �̸�, ȸ��, ����Ʈ ����, ���� ����� �ѹ��� SELECT�� �� �ִ�.


-------------------------------------------------------------------------------------------


--[EQUITE JOIN(INNER JOIN)] - ���� �⺻���̰� ���� ���ȴ�.
SELECT CUSTOM.USERID, USERNAME, AGE, COMPANY.USERID, ADDR1, PAY
FROM CUSTOM, COMPANY --�ߺ��Ǵ� �÷��� �� ��ġ�� ǥ��������Ѵ�.
WHERE CUSTOM.USERID = COMPANY.USERID; -- ����и�
--USERNAME�տ��� CUSTOM�� �ٿ��� ������ CUSTOM�ȿ��� �ִ� ���̱� ������ ������ �����ϴ�.
--�տ� �ԷµǴ� USERID�� �÷����� ���̸� �ڿ� ���� USERID�� �����ص� ���� ��µȴ�.


SELECT A.USERID,USERNAME,AGE,ADDR1,B.USERID,COMPANY,PAY
FROM CUSTOM A,COMPANY B
WHERE A.USERID = B.USERID;
--USERNAME�� CUSTOM���̺��� �ֱ� ������ �տ� ���̺���� �������� �ʾƵ� �ȴ�.
--���̺��� AS ���� ����. ��Ī�� ���� ���� �����ϴ�.


SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, PAY
FROM CUSTOM A INNER JOIN COMPANY B 
ON A.USERID = B.USERID;
--FM��� ���� ǥ�ذ������� ����Ŭ������ ,�� ����� �� �ְ� ��������. 
-- , ��� INNER JOIN(INNER�� ���� ����) WHERE ��� ON �Է�


--'CUSTOM'���� UserID, UserName�� �˻��ϰ� POINT ���̺��� ��ǰ����, �α��ο� ����� ���� POINT ����(Product, Login)�� �˻�
SELECT A.USERID, USERNAME, PRODUCT, LOGIN
FROM CUSTOM A, POINT B
WHERE A.USERID = B.USERID AND LOGIN>=10;

SELECT A.USERID, USERNAME, PRODUCT, LOGIN
FROM CUSTOM A INNER JOIN POINT B
ON A.USERID = B.USERID AND LOGIN>=10;

SELECT A.USERID, USERNAME, PRODUCT, LOGIN
FROM CUSTOM A INNER JOIN POINT B
ON A.USERID = B.USERID
WHERE LOGIN>=10;


-------------------------------------------------------------------------------------------


--[OUTER JOIN] - �ܺ������̶�� ��.
--���� ���̺��� �������� �ٸ��ʿ� �ִ� �����͸� ��ġ��Ű�� ���̴�.
--���� ���̺��� � ���̺�� ���ϳĿ� ���� ��°��� �޶��� ���ִ�.

SELECT COUNT(*) FROM CUSTOM; --459
SELECT COUNT(*) FROM COMPANY; --464

--CUSTOM ���̺� �������� JOIN�� �Է�
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID = B.USERID(+) -- �������� �밢������ �Է���.
ORDER BY B.COMPANY DESC;
--������ ���̺��� �ִµ� ȸ������ ���̺��� ���� ���� NULL���� ��.

SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID = B.USERID(+) AND B.COMPANY IS NULL;
--NULL���� ã�Ƽ� ���

--COMPANY ���̺� �������� JOIN�� �Է�
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID(+) = B.USERID -- �������� �밢������ �Է���.
ORDER BY B.COMPANY DESC;


-------------------------------------------------------------------------------------------


--ANSI ǥ�� SQL : (+) ��� ����
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A LEFT OUTER JOIN COMPANY B 
ON A.USERID = B.USERID
ORDER BY B.COMPANY DESC;

SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B 
ON A.USERID = B.USERID
ORDER BY B.COMPANY DESC;


-------------------------------------------------------------------------------------------


--[CROSS JOIN] - ��ȣ ����
--���� ���� �����͸� ���ο� ���̺� ���� �־� �׽�Ʈ �Ҷ� �����

SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A, COMPANY B;
--459*464 = 212,976���� ROWS ���� ��µȴ�.

--ANSI ǥ�� SQL
SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A CROSS JOIN COMPANY B;

--INNER JOIN
SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A INNER JOIN COMPANY B
ON A.USERID = B.USERID;

SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A CROSS JOIN COMPANY B
WHERE A.USERID = B.USERID;

-------------------------------------------------------------------------------------------


--[SELF JOIN]
--�ϳ��� ���̺��� �޸𸮿� �ι� �÷� ���� ���� �� SELF JOIN ���
--�ϳ��� ���̺��� �ΰ��� �����ؼ� ���� ���ϴ� ���� JOIN�������� �ش�ȴ�.
--�������� �����ϰ� �ܿ�����.

SELECT * FROM CUSTOM 
ORDER BY USERNAME;

SELECT DISTINCT A.* -- DISTINCT�� �ߺ��Ǵ� ���� ������
FROM CUSTOM A, CUSTOM B
WHERE A.USERNAME = B.USERNAME --�̸��� ���ƾ�������
AND A.USERID <> B.USERID --ID�� �޶����
ORDER BY A.USERNAME;


--CUSTOM ���̺��� ���ֵ��� ��� �ִ� ��� �߿� ������ �̸��� ���� ���� �˻�
SELECT A.*
FROM CUSTOM A, CUSTOM B
WHERE A.ADDR1 = '���ֵ�'
AND A.USERID <> B.USERID
AND A.USERNAME = B.USERNAME
ORDER BY A.USERNAME;
--�̷��� �ϸ� �뿵ȣ(��û�� ������ ��������)�� ���´�. �츮�� ���ֵ��� ����ִ� ����� �߿� ���������� ã�ƾ� �ϹǷ� �뿵ȣ�� ��µǸ� �ȵȴ�.

SELECT A.*
FROM CUSTOM A INNER JOIN CUSTOM B
ON A.USERNAME = B.USERNAME
WHERE A.USERID <> B.USERID AND A.ADDR1 = '���ֵ�' AND B.ADDR1 = '���ֵ�';

SELECT A.*
FROM CUSTOM A, CUSTOM B
WHERE A.USERNAME = B.USERNAME
AND A.USERID <> B.USERID
AND A.ADDR1 = '���ֵ�' AND B.ADDR1 = '���ֵ�';


--3�� �̻��� ���̺� ����
--CUSTOM : USERID,USERNAME
--COMPANY : COMPANY,DEPT
--POINT : PRODUCT,LOGIN

SELECT A.USERID,USERNAME,COMPANY,DEPT,PRODUCT,LOGIN
FROM CUSTOM A, COMPANY B, POINT C
WHERE A.USERID = B.USERID AND A.USERID = C.USERID;

SELECT A.USERID,USERNAME,COMPANY,DEPT,PRODUCT,LOGIN
FROM CUSTOM A INNER JOIN COMPANY B
ON A.USERID=B.USERID INNER JOIN POINT C
ON A.USERID=C.USERID;



--�Ļ����̺�� JOIN
--���̵𺰷� ����Ƚ���� ���űݾ��� �� �˻�
SELECT * FROM SALES;

SELECT USERID,COUNT(*) CNT, SUM(PRICE) HAP
FROM SALES
GROUP BY USERID
HAVING SUM(PRICE) >= 1500000;

--INLINE-VIEW
SELECT A.USERID,USERNAME,ADDR1,HAP
FROM CUSTOM A,(
SELECT USERID,COUNT(*) CNT, SUM(PRICE) HAP
FROM SALES
GROUP BY USERID
HAVING SUM(PRICE) >= 1500000
) B
WHERE A.USERID = B.USERID;


SELECT * FROM CUSTOM;

CREATE TABLE JEJU
AS
SELECT * FROM CUSTOM WHERE ADDR1='���ֵ�';

CREATE TABLE SEOUL
AS
SELECT * FROM CUSTOM WHERE ADDR1='����Ư����';

CREATE TABLE KYUNG
AS
SELECT * FROM CUSTOM WHERE ADDR1='��⵵';

SELECT * FROM TAB;

SELECT * FROM JEJU;
SELECT * FROM SEOUL;
SELECT * FROM KYUNG;

SELECT * FROM JEJU
UNION
SELECT * FROM SEOUL
UNION
SELECT * FROM KYUNG;
--PRIMARY KEY�� �����Ѵ�. ���⼭�� USERID�̴�.


-------------------------------------------------------------------------------------------
--[07/06]


--SUBQUERY(��������)
/*
���� �ȿ� ������ �� �ִ� ���̴�. 
���������� ��ȣ�� ���� ������ ������ ����.
���ϴ� �÷��� ������ �����ؾ� �Ѵ�.
���ϴ� �÷����� �����ؾ� ���� �����Ϳ��� ���� ���Ͽ� ��µȴ�.
���ϴ� �÷����� �ٸ� ��� ������ ������ ������ ���ϴ� ������ ��µ��� �ʴ´�.
���������� 100% JOIN������ ������ �� �ִ�.
*/

--COMPANY ���̺��� USERID,COMPANY,DEPT PAY,��տ���
SELECT * FROM COMPANY;

SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY;

SELECT USERID,COMPANY,DEPT PAY,
(SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY) A_PAY 
FROM COMPANY;

--CUSTOM ���̺��� ��� ���̺��� ���� ����� ���� �˻�
SELECT * FROM CUSTOM;

SELECT ROUND(AVG(AGE)) FROM CUSTOM; --29

SELECT * FROM CUSTOM WHERE AGE>=29;

--SELECT���� 29��ġ�� ���������� ����.
SELECT * FROM CUSTOM
WHERE AGE>=(SELECT ROUND(AVG(AGE)) FROM CUSTOM);


--�����ڵ��� �׷쿡 �ٹ��ϴ� ����
SELECT * FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%';

SELECT * FROM CUSTOM
WHERE USERID='EE9224' OR USERID='el3409';

SELECT * FROM CUSTOM
WHERE USERID IN ('EE9224','el3409');
--���� ���� ���


SELECT USERID FROM COMPANY
WHERE COMPANY LIKE '�����ڵ���%';

SELECT * FROM CUSTOM 
WHERE USERID IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');
--�� ����Ʈ ���� ����������

--JOIN���� ����� ���
SELECT A.*
FROM CUSTOM A INNER JOIN COMPANY B
ON A.USERID = B.USERID AND B.COMPANY LIKE '�����ڵ���%';

SELECT A.*
FROM CUSTOM A, COMPANY B
WHERE A.USERID = B.USERID AND B.COMPANY LIKE '�����ڵ���%';


--4ȸ �̻� �Ǹű���� �ִ� ������ �⺻ ���� �˻�
SELECT * FROM SALES;

SELECT USERID,COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING COUNT(*)>=4;

SELECT * FROM CUSTOM
WHERE USERID IN ( SELECT USERID FROM SALES
GROUP BY USERID
HAVING COUNT(*)>=4);

SELECT A.*, CNT
FROM CUSTOM A,
(SELECT USERID,COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING COUNT(*)>=4) B
WHERE A.USERID = B.USERID;

SELECT A.* --����~~!
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B  
ON A.USERID = B.USERID AND B.COMPANY LIKE '%����%�ڵ���%';
SELECT * FROM CUSTOM;
SELECT * FROM COMPANY;

SELECT A.*
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B  /*������ �����Ͱ� CUSTOM�� �ִ�*/
ON A.USERID = B.USERID
WHERE B.COMPANY LIKE '%����%�ڵ���%';


-------------------------------------------------------------------------------------------


/*
ANY(������ ����), ALL(������ ������)

>ANY : �ּҰ����� ū ������
<ANY : �ִ밪���� ���� ������
>ALL : �ִ밪���� ū ������
<ALL : �ּҰ����� ���� ������
*/
SELECT POINT FROM CUSTOM;

SELECT POINT FROM CUSTOM WHERE ADDR1='���ֵ�' ORDER BY POINT; --132,269

-- [ >ANY ]
SELECT * FROM CUSTOM
WHERE POINT > ANY(SELECT POINT FROM CUSTOM WHERE ADDR1='���ֵ�');

SELECT * FROM CUSTOM
WHERE POINT > (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1='���ֵ�');

-- [ <ANY ]
SELECT * FROM CUSTOM
WHERE POINT < ANY(SELECT POINT FROM CUSTOM WHERE ADDR1='���ֵ�');

SELECT * FROM CUSTOM
WHERE POINT < (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1='���ֵ�');
--MIN/MAX�� �ᵵ �Ǵµ� �� ���� ANY�� ����ϴ°�? > �ӵ��� �ξ� ������.

-- [ >ALL ]
SELECT * FROM CUSTOM
WHERE POINT > ALL(SELECT POINT FROM CUSTOM WHERE ADDR1='���ֵ�');

SELECT * FROM CUSTOM
WHERE POINT > (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1='���ֵ�');

-- [ <ALL ]
SELECT * FROM CUSTOM
WHERE POINT < ALL(SELECT POINT FROM CUSTOM WHERE ADDR1='���ֵ�');

SELECT * FROM CUSTOM
WHERE POINT < (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1='���ֵ�');

SELECT * FROM CUSTOM;

UPDATE CUSTOM SET POINT=130 WHERE USERID='nu7634';


SELECT POINT FROM CUSTOM WHERE AGE>=70;

SELECT * FROM CUSTOM
WHERE POINT > ANY (SELECT POINT FROM CUSTOM WHERE AGE>=70);
--ANY�� ���������� ����� ������ ���������� ����� ������ �ʴ´�.

SELECT * FROM CUSTOM
WHERE POINT > ALL (SELECT POINT FROM CUSTOM WHERE AGE>=70);
--ALL�� �������� �����Ͱ� ��� ��� �����Ͱ� ���´�. ũ�� �۰� �� ���´�.


SELECT * FROM CUSTOM 
WHERE USERID IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');

SELECT * FROM CUSTOM 
WHERE USERID = ANY (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');
--IN�� =ANY�� ����. ANY�� �ӵ��� �� ������.

SELECT * FROM CUSTOM 
WHERE USERID NOT IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');

SELECT * FROM CUSTOM 
WHERE USERID <> ALL (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');
--NOT IN�� <>ALL�� ����.


-------------------------------------------------------------------------------------------

--�������� : ������ ó�� ����
--��ȣ ������ ���͵� ��� ����
SELECT USERID,USERNAME,ADDR1,SCHOL FROM CUSTOM
WHERE USERID IN
(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');

SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%'; --O


--������� : ������ ó���Ұ���
--��ȣ �ۿ� ������ ��� �Ұ�
SELECT USERID,USERNAME,ADDR1,SCHOL FROM CUSTOM
WHERE EXISTS
(SELECT * FROM COMPANY WHERE USERID=CUSTOM.USERID AND COMPANY LIKE '�����ڵ���%');

SELECT * FROM COMPANY WHERE USERID=CUSTOM.USERID AND COMPANY LIKE '�����ڵ���%'; --X


-------------------------------------------------------------------------------------------

--�������θ� �ۼ�
SELECT * FROM CUSTOM WHERE ADDR1='��⵵' AND AGE<=20;

--�������� + �������� �ۼ�
SELECT * FROM(SELECT * FROM CUSTOM WHERE ADDR1='��⵵') A
WHERE A.AGE<=20;


-------------------------------------------------------------------------------------------
--[07/11]

create table ���
(�����ȣ number(10),
����� varchar2(10),
�μ���ȣ number(2),
���� varchar2(10),
�����ȣ char(7),
�ּ� varchar2(50),
��ȭ��ȣ char(15),
�޿� number(5),
Ŀ�̼� number(5),
�Ի��� date,
���� char(6),
�����ȣ number(10)
);

insert into ��� values(2001,'�̼���',10,'����','125-365','���� ��걸','02-985-1254',3500,100,'1980-12-01','����',null);
insert into ��� values(2002,'ȫ�浿',10,'�븮','354-865','���� ������','02-865-1254',4000,'','2000-01-25','����',2004);
insert into ��� values(2003,'������',20,'���','587-456','�λ� �ؿ�뱸','051-256-9874',2500,100,'2002-05-24','����',2002);
insert into ��� values(2004,'������',30,'����','987-452','���� ������','02-33-6589',5000,'','1997-03-22','����',2001);
insert into ��� values(2005,'���',10,'�븮','123-322','���� ������','02-888-9564',3000,100,'1999-07-15','����',2004);
insert into ��� values(2006,'������',20,'���','154-762','���� ���ı�','02-3369-9874',2000,'','2003-05-22','����',2005);
insert into ��� values(2007,'�ڼֹ�',30,'�븮','367-985','���� ��������','02-451-2563',3000,100,'2006-01-25','����',2004);
insert into ��� values(2008,'��ȿ��',40,'���','552-126','���� �߱�','02-447-3256',2000,'','2001-02-02','����',2007);


commit;

select * from ���;
DESC ���;

SELECT �����,����,�޿� FROM ��� WHERE �����ȣ=2001;
SELECT * FROM SALES;
SELECT * FROM CUSTOM;

-------------------------------------------------------------------------------------------
--[CMDâ]

SQLPLUS lee/bob

DECLARE
TYPE FIRSTTYPE IS RECORD
(A ���.�����%TYPE, B ���.����%TYPE, C ���.�޿�%TYPE);

CUS FIRSTTYPE;

BEGIN
SELECT �����,����,�޿� INTO CUS FROM ��� WHERE �����ȣ=2001;

DBMS_OUTPUT.PUT_LINE('�����  ����  �޿�');
DBMS_OUTPUT.PUT_LINE('-----------------');
DBMS_OUTPUT.PUT_LINE(CUS.A||'  '||CUS.B||'  '||TO_CHAR(CUS.C));
DBMS_OUTPUT.PUT_LINE('������ �����: '||USER||'�Դϴ�');
DBMS_OUTPUT.PUT_LINE('������ �ð�: '||TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS'));

END;
/
--CMD������ END �ؿ� /�� �Է����־�� ����� �ȴ�.

SET SERVEROUTPUT ON;
--CMDâ������ �׻� SERVEROUTPUT�� OFF�� �Ǿ��ִ�. �׷��� ON���� �ٲ��־�� �Ѵ�.

-------------------------------------------------------------------------------------------
--[CMDâ]

DECLARE
SAWON_RECORD ���%ROWTYPE;
--������̺� �Ѱ��� �࿡ ��� ���̺��� �ְ� ������� ���_���ڵ��� �̸����� ������.
BEGIN
SELECT * INTO SAWON_RECORD FROM ��� WHERE �����ȣ = 2001;
DBMS_OUTPUT.PUT_LINE('�����ȣ: ' || SAWON_RECORD.�����ȣ);
DBMS_OUTPUT.PUT_LINE('�����: ' || SAWON_RECORD.�����);
DBMS_OUTPUT.PUT_LINE('�ּ�: ' || SAWON_RECORD.�ּ�);
DBMS_OUTPUT.PUT_LINE('�޿�: ' || SAWON_RECORD.�޿�);
END;
/

-------------------------------------------------------------------------------------------
--[CMDâ] �÷� ������ �����͸� ������ �� �ִ�.

DECLARE
TYPE NAME_TYPE IS TABLE OF ���.�����%TYPE
--������� ����ִ� �÷��� ������ �� ��� ��������
--NAME_TYPE�̶�� ������ ������̺��� ����� �÷��� ������ Ÿ���� ������.
INDEX BY BINARY_INTEGER;
TYPE JIK_TYPE IS TABLE OF ���.����%TYPE
--���޸��� ����ִ� �÷��� ������ �� ��� ��������
INDEX BY BINARY_INTEGER;
--�ε��� ������ Ÿ���� ������.

SANAME_COL NAME_TYPE;
SAJIK_COL JIK_TYPE;
--NAME_TYPE�� ��� ���ο� ���� SANAME_COL�� �������.
--�̷��� �ΰ��� ������ ������� ���� ������ Ÿ���� ���� ����

I BINARY_INTEGER := 0;
--������ �ϳ� �����ߴµ� ������ Ÿ���� BINARY_INTEGER
--PL/SQL������ ������ := �� ����ϸ� �ȴ�.

BEGIN

FOR K IN (SELECT �����, ���� FROM ���) LOOP 
--�ݺ��� ����
I := I+1;
SANAME_COL(I) := K.�����;
SAJIK_COL(I) := K.����;
END LOOP;
--�ݺ��� �ݱ�

DBMS_OUTPUT.PUT_LINE('�����  ����');
DBMS_OUTPUT.PUT_LINE('------------');

FOR J IN 1..I LOOP
--1���� I��°�� �� ������ �ݺ�
DBMS_OUTPUT.PUT_LINE(RPAD(SANAME_COL(J),12)||RPAD(SAJIK_COL(J),9));
END LOOP;
END;
/

-------------------------------------------------------------------------------------------
--[CMDâ] �̸��� �ִ� PROCEDURE �����
/*
����
S * FROM ��� -> �ؽ�Ʈ ����
�ؽ�Ʈ ������ ������ ������ �� ����ȿ� ����̶�� ���̺��� �ִ����� �˻���.
�÷��� �ִ��� , ������ �´��� ��� ���������� �˻縦 ��.
�������� �˻縦 �� �� ������ �� -> ����� ���̺�� �������� ��.

(���ν��� ������)
�Ȱ��� �� �� �˻縦 �� ������ ���� ��ü�� �������� ���� ������ �� 
�����ϴ� �κ��� �Ϸ��Ͽ� ������ �� ���ұ� ������ ������ �����ϸ� 
�ٽ� �˻縦 ���� �ʰ� �ٷ� ������ �ϱ� ������ �ӵ��� �ξ� ��������.
*/

CREATE OR REPLACE PROCEDURE CHANGE_PAY
(V_SANO IN NUMBER, V_NEW_PAY IN NUMBER)
--IN�� �����ص� �ȴ�.
IS

BEGIN
UPDATE ��� SET �޿� = V_NEW_PAY WHERE �����ȣ = V_SANO;
COMMIT;
--UPDATE�� �ϸ� TRANSACTION�� ���۵ǹǷ� �ݵ�� COMMIT�� ���־�� �Ѵ�.
END CHANGE_PAY;
/

EXEC CHANGE_PAY(2001,5000);
--EXEC : EXECUTE�� ����. ��ȣ ���� �Ű������� ��� �� �ڵ带 �����Ѵ�. ���⼭�� UPDATE�� �����Ѵ�.

-------------------------------------------------------------------------------------------
--[CMDâ] �Լ�

CREATE OR REPLACE FUNCTION F_TAX
(V_SANO NUMBER)
RETURN NUMBER
--�ܺο��� ���� �������� �Ű�����. IS ������ �ڹ��� �Ű�����ó�� �޴� ��
IS
--���ο��� ����ϴ� ����. IS �Ʒ����� ���������� ����ϰڴٴ� ����
V_TAX NUMBER;

BEGIN
SELECT ((�޿�*12) + NVL(Ŀ�̼�,0)) * 0.05 INTO V_TAX
FROM ��� WHERE �����ȣ = V_SANO;

RETURN V_TAX;
END;
/

SELECT �����ȣ, �����, ����, Ŀ�̼�,F_TAX(2001) TAX
FROM ��� WHERE �����ȣ = 2001;

-------------------------------------------------------------------------------------------
--[CMDâ] ���ν����� �Լ�
--���ν����� ��ȯ���� �� �� �ִ�. ������ �����ؼ� �Լ��� ����.

CREATE OR REPLACE PROCEDURE P_OUTTEX
(V_SANO IN ���.�����ȣ%TYPE,
V_SANAME OUT ���.�����%TYPE,
V_PAY OUT ���.�޿�%TYPE,
V_COMM OUT ���.Ŀ�̼�%TYPE)
IS
BEGIN
SELECT �����, �޿�, Ŀ�̼� INTO V_SANAME,V_PAY,V_COMM
FROM ��� WHERE �����ȣ = V_SANO;
END;
/
 
VARIABLE NAME VARCHAR2(10);
VARIABLE PAY NUMBER;
VARIABLE COMM NUMBER;
--IS���� �Ű������� ���� �׸��� �ݵ�� �� ����

EXEC P_OUTTEX(2001,:NAME,:PAY,:COMM);
SELECT :NAME,:PAY,:COMM FROM DUAL;

-------------------------------------------------------------------------------------------
--[CMDâ]

CREATE OR REPLACE PROCEDURE ADD_ONE
(V_TEL IN OUT VARCHAR2)
IS
BEGIN
V_TEL:=SUBSTR(V_TEL,1,4)||'-'||SUBSTR(V_TEL,4);
END;
/

VARIABLE TEL VARCHAR2(15)
EXEC :TEL := '123405678';

EXEC ADD_ONE(:TEL);
COL TEL FORMAT A17;
--TEL�̶�� �÷��� -(�뽬)�� 17���� �����
PRINT TEL;

-------------------------------------------------------------------------------------------
--[CMDâ] LEE�� �����ϴ� SALES���̺� ���

CREATE OR REPLACE PROCEDURE P_GOJUTOT
(V_GNO IN VARCHAR2)
IS
TOT NUMBER;

BEGIN
SELECT COUNT(*) INTO TOT FROM SALES
WHERE USERID=V_GNO
GROUP BY USERID;

DBMS_OUTPUT.PUT_LINE(V_GNO||'�� ������ �� �ֹ� Ƚ���� '||TO_CHAR(TOT)||'�� �Դϴ�');
END;
/

EXEC P_GOJUTOT('og6675');

-------------------------------------------------------------------------------------------
--[CMDâ] �⺻���� SELECT���� ���� PROCEDURE  ���� ���� ����ϰ� ���� ���� Ȱ��ȴ�.

CREATE OR REPLACE PROCEDURE SEARCHJIK
(JIK IN VARCHAR2)
IS
A NUMBER:=0;
B NUMBER(12,2):=0;
C NUMBER:=0;
BEGIN
SELECT SUM(PAY),AVG(PAY),COUNT(*) INTO A,B,C
FROM COMPANY WHERE POSIT=JIK;
DBMS_OUTPUT.PUT_LINE('�޿� �Ѿ�: ' ||A||'��');
DBMS_OUTPUT.PUT_LINE('��� ����: ' ||B||'��');
DBMS_OUTPUT.PUT_LINE('�ο� ��: ' ||C||'��');
END;
/

-------------------------------------------------------------------------------------------







/*
--CUSTOM ���̺� INSERT ��Ű�� ���ν��� �����
CREATE OR REPLACE PROCEDURE CUS_IN
(A VARCHAR2,B VARCHAR2,C VARCHAR2,D NUMBER,E VARCHAR2,F VARCHAR2,G VARCHAR2,H VARCHAR2,I VARCHAR2,J VARCHAR2,K VARCHAR2,L VARCHAR2,M VARCHAR2,N VARCHAR2)
IS
BEGIN
INSERT INTO CUSTOM VALUES(A,B,C,D,E,F,G,H,I,J,K,L,M,N);
COMMIT;
END;

EXEC CUS_IN('A001','SUZI','123',27,'0','123-123','����','������','���ﵿ','010-111-2222','����','����',100,SYSDATE);



--CUSTOM ���̺� UPDATE ��Ű�� ���ν��� �����
CREATE OR REPLACE PROCEDURE CUS_UP
(A VARCHAR2,B VARCHAR2,C VARCHAR2,D NUMBER,E VARCHAR2,F VARCHAR2,G VARCHAR2,H VARCHAR2,I VARCHAR2,J VARCHAR2,K VARCHAR2,L VARCHAR2,M VARCHAR2,N VARCHAR2)
IS
BEGIN
UPDATE CUSTOM SET USERNAME=B,JUMIN=C,AGE=D,SEX=E,ZIP=F,ADDR1=G,ADDR2=H,ADDR3=I,TEL=J,SCHOL=L,POINT=M,REGDATE=N WHERE USERID=A;
COMMIT;
END;

EXEC CUS_UP('A001','INNA','123',27,'0','123-123','����','������','���ﵿ','010-111-2222','����','����',100,SYSDATE);



--CUSTOM ���̺� DELETE ��Ű�� ���ν��� �����
CREATE OR REPLACE PROCEDURE CUS_DEL
(A VARCHAR2)
IS
BEGIN
DELETE CUSTOM WHERE USERID=A;
COMMIT;
END;

*/

CREATE OR REPLACE FUNCTION F_CUBVOL
(GILI NUMBER, POK NUMBER, NOPI NUMBER)
RETURN NUMBER
IS
BUPI NUMBER;
BEGIN
BUPI := GILI * POK * NOPI;
RETURN BUPI;
END;
/

SELECT F_CUBVOL(4,7,8) BUPI FROM DUAL;



CREATE OR REPLACE FUNCTION F_NAME
(NAME IN VARCHAR2)
RETURN VARCHAR2
IS
NA VARCHAR2(8);
BEGIN
NA := SUBSTR(NAME,-2);
RETURN NA;
END;
/

SELECT F_NAME('��������') NAME FROM DUAL;

COL NAME FORMAT A8
SELECT F_NAME(USERNAME) FROM CUSTOM WHERE ADDR1='���ֵ�';




SELECT 
FLOOR(MONTHS_BETWEEN(SYSDATE,'2002-06-01')/12) || '��' ||
FLOOR(MOD(MONTHS_BETWEEN(SYSDATE,'2002-06-01'),12)) || '����'
FROM DUAL;

CREATE OR REPLACE FUNCTION F_SDAY
(V_DATE IN DATE)
RETURN VARCHAR2
IS
GUNDATE VARCHAR2(20);
BEGIN 
GUNDATE := 
FLOOR(MONTHS_BETWEEN(SYSDATE,V_DATE)/12) || '��' ||
FLOOR(MOD(MONTHS_BETWEEN(SYSDATE,V_DATE),12)) || '����';
RETURN GUNDATE;
END;
/

SELECT USERNAME,REGDATE,F_SDAY(REGDATE) GUNDATE
FROM CUSTOM WHERE ADDR1='���ֵ�';




CREATE OR REPLACE FUNCTION F_GENDER
(V_JUMIN IN VARCHAR2)
RETURN VARCHAR2
IS
GENDER VARCHAR2(4);
BEGIN
GENDER := SUBSTR(V_JUMIN,8,1);
IF GENDER IN ('1','3') THEN
GENDER := '��'; --ũ�⸦ 2�� ��� ������ �ѱ��� �ѱ��ڸ� �����ϴ�.
ELSE
GENDER := '��';
END IF;
RETURN GENDER;
END;
/

COL GENDER FORMAT A16;
SELECT USERNAME,JUMIN,F_GENDER(JUMIN) GENDER
FROM CUSTOM WHERE ADDR1='���ֵ�';



--[IF��]
CREATE OR REPLACE FUNCTION F_PAYGRADE
(V_PAY IN NUMBER)
RETURN VARCHAR2
IS
RESULT VARCHAR2(20);
BEGIN
IF V_PAY>2500000 THEN
RESULT := 'A';
ELSIF V_PAY>2000000 THEN
RESULT := 'B';
ELSIF V_PAY>1500000 THEN
RESULT := 'C';
ELSIF V_PAY>1000000 THEN
RESULT := 'D';
ELSE
RESULT := 'E';
END IF;
RETURN RESULT;
END;
/

COL PAYGRADE FORMAT A8;
SELECT USERID,POSIT,PAY,F_PAYGRADE(PAY)||'���' PAYGRADE
FROM COMPANY WHERE USERID='XA9776';

SELECT USERID,POSIT,PAY,F_PAYGRADE(PAY)||'���' PAYGRADE
FROM COMPANY WHERE USERID='ye8802';


--[LOOP��=DO WHILE]
CREATE TABLE TEST2
(NO NUMBER,
NAME VARCHAR2(10) DEFAULT 'ȫ�浿');

DECLARE
V_COUNT NUMBER(2) := 1;
BEGIN
LOOP
INSERT INTO TEST2(NO) VALUES(V_COUNT);
V_COUNT := V_COUNT + 1;
EXIT WHEN V_COUNT > 10;
END LOOP;
DBMS_OUTPUT.PUT_LINE('������ �Է� �Ϸ�');
END;
/

SELECT * FROM TEST2;


--[FOR��]
CREATE OR REPLACE PROCEDURE P_FOR
IS
BEGIN
FOR I IN 11..30 LOOP
INSERT INTO TEST2(NO) VALUES(I);
COMMIT;
END LOOP;
END;
/

EXEC P_FOR;

SELECT * FROM TEST2;


--[WHILE��]
CREATE OR REPLACE PROCEDURE P_WHILE
(V_START NUMBER,V_END NUMBER)
IS
CNT NUMBER := V_START;
TOT NUMBER := 0;
BEGIN
WHILE CNT<=V_END LOOP
TOT :=  TOT+CNT;
CNT := CNT+1;
END LOOP;
DBMS_OUTPUT.PUT_LINE(TO_CHAR(V_START)||'����'||TO_CHAR(V_END)||
'������ ���� '||TO_CHAR(TOT)||'�Դϴ�');
END;
/

EXEC P_WHILE(1,100);



--[����ó��]
CREATE OR REPLACE PROCEDURE EXE_TEST
IS
SW_REC ���%ROWTYPE;
BEGIN
SELECT * INTO SW_REC FROM ���;
DBMS_OUTPUT.PUT_LINE('������ �˻� ����');

EXCEPTION

WHEN TOO_MANY_ROWS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�');

WHEN NO_DATA_FOUND THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�');

WHEN OTHERS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�');

END;
/

EXEC EXE_TEST; --�����Ͱ� �����ϴ�




CREATE OR REPLACE PROCEDURE EXE_TEST
IS
SW_REC ���%ROWTYPE;
BEGIN
SELECT * INTO SW_REC FROM ��� WHERE �����ȣ='2001';
DBMS_OUTPUT.PUT_LINE('������ �˻� ����');

EXCEPTION

WHEN TOO_MANY_ROWS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�');

WHEN NO_DATA_FOUND THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('�����Ͱ� �����ϴ�');

WHEN OTHERS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�');

END;
/

EXEC EXE_TEST; --������ �˻� ����



--[����� ���� ����]
CREATE OR REPLACE PROCEDURE PAY_VALIDATE
(V_SANO ���.�����ȣ%TYPE)
IS
NOT_ENOUGH_PAY EXCEPTION; --���� ���� ����

SW_REC ���%ROWTYPE;

BEGIN
SELECT * INTO SW_REC FROM ��� WHERE �����ȣ=V_SANO;

IF SW_REC.�޿� >= 3000 THEN
DBMS_OUTPUT.PUT_LINE('�޿��� 3000 �̻� ������');

ELSIF SW_REC.�޿� <3000 THEN
RAISE NOT_ENOUGH_PAY;

ELSE
DBMS_OUTPUT.PUT_LINE('�޿��� �̻���');
END IF;

EXCEPTION

WHEN NOT_ENOUGH_PAY THEN
RAISE_APPLICATION_ERROR(-20001,'�޿��� ������� ����');

END;
/

EXEC PAY_VALIDATE(2003);