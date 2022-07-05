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