
--kim
-------------------------------------------------------------------------------------------

SELECT * FROM tab;

SELECT * FROM PERSONNEL;
-- '*'�� �� : PERSONNEL�� ���� ��� COLUMN�� �����Ͷ�

/*
SQL (Structured Query Languge : ����ȭ�� ���� ���)
ANSI ǥ�� (American National Standards Institute)

1. query
   select data�˻���

2. dml(data maipulation language)
    insert, update, delete
    
3. ddl(data difinition language)
    create, alter, drop, rename
    
4. tcl(transaction control language)
    commit, rollback
    
5. dcl(data control language)
    grant, revoke
    ������ �ο��� ��: grant ���� to 
    ������ ��Ż�� ��: revoke ���� from
*/

select * from PERSONNEL; --*: ��� �÷��� �����Ͷ�

select pno, job, pay from PERSONNEL;

select pay,pno,job from PERSONNEL;

select job from PERSONNEL;

select DISTINCT job from PERSONNEL;
--DISTINCT: �ߺ��� ����

select * from PERSONNEL;

select * from PERSONNEL
ORDER by pay asc; --��������

select * from PERSONNEL
order by pay;

select * from PERSONNEL
order by PAY desc; --��������
--desc�� �����ϸ� ���������� �ȴ�.


-------------------------------------------------------------------------------------------


--��Ī
SELECT PNO,PNAME,PAY,PAY+1000 as ���ʽ� from PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 ���ʽ� from PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 "�� �� ��" from PERSONNEL;
/*��� �÷��� ��Ī�� �ټ� �ִ�. �÷��� �ڿ� �̸��� �ָ� ��. but �޸��� ���� �ȵȴ�.
select���� ������ �����ϴ�.
pay+1000�� �Ļ� �÷��̴�. db�ȿ� ���ִ� ���� �ƴ� �� ���� �ȿ��� ���� ����.
�÷��� �ڿ� as~~~ �ϸ� ��Ī���� ���� �� ����. as�� ������ ����
�����ϴ� ���� ���� �ʴ�. �׷��� �ϰ� ���� ��쿡�� ����ǥ�� �ٿ��ش�.*/

SELECT pno ��ȣ,pname �̸�,pay ����,pay+1000 ���ʽ� from PERSONNEL;

SELECT PNO,PNAME,PAY,PAY+1000 as ���ʽ� from PERSONNEL
ORDER BY ���ʽ�;

SELECT PNO,PNAME,PAY,PAY+1000 as ���ʽ� from PERSONNEL
ORDER BY pay+1000;

SELECT PNO,PNAME,PAY,PAY+1000 as ���ʽ� from PERSONNEL
ORDER BY 4 DESC;

SELECT * FROM PERSONNEL
ORDER BY 4 DESC;

SELECT dno,pno,pname from PERSONNEL
ORDER BY dno,pno desc;
--���������� pno���� ����ȴ�. dno�� �⺻���� ������������ ����ȴ�.
--DNO�� �������� �������� ������ ���� �� �Ŀ�, PNO�� �������� �������� �����Ѵ�.


--�μ���ȣ�� ��������, �����ȣ�� �������� ����
SELECT * FROM PERSONNEL
ORDER BY dno, pno desc;


-------------------------------------------------------------------------------------------

--null
--������ �� ���� ū ������ ��޵ȴ�. 
SELECT manager from PERSONNEL
ORDER BY manager asc;
--���������� �� �� �Ʒ��� ��ġ�Ѵ�.

SELECT manager from PERSONNEL
ORDER BY manager desc;
--���������� �� �� ���� ��ġ�Ѵ�.


--����� �޿��� ������ ����Ͻÿ�
SELECT pno,pname,pay,pay*12 ���� FROM PERSONNEL;


-------------------------------------------------------------------------------------------


--���� ������
SELECT pname || pno from PERSONNEL;

SELECT pname || ' ' || pno from PERSONNEL;

SELECT * FROM PERSONNEL;
--��ĭ�� Null, 0�� ���ʽ��� ���� ���̴�. Null�� 0�� ������ �ٸ� ����.

SELECT Pno, Pname, Pay, Bonus, (Pay*12)+Bonus ���� FROM PERSONNEL;
--Null�� �����ڰ� ������ ���� Null�� ��

SELECT pno,pname,pay,nvl(bonus,0),(pay*12)+nvl(BONUS,0) ���� FROM PERSONNEL;
--Nvl�� �����Ͱ� ������ �״�� ǥ�����ְ� ���� Null�̸� 0���� ǥ�����ش�.
--������ Ÿ���� �ѹ��̱� ������ ���ڷ� ��µ�. ���ڴ� XID


-------------------------------------------------------------------------------------------


--������(where)
SELECT * FROM PERSONNEL;

SELECT pno,pname,job FROM PERSONNEL
WHERE job='salesman';

SELECT pno,pname,job FROM PERSONNEL
WHERE job='SALESMAN';

--SELECT ���� �÷����� ������, WHERE ���ǹ��� �������̴�.
--�����Ͱ��� ��ҹ��ڸ� �����ؾ� �Ѵ�.

-------------------------------------------------------------------------------------------


--������
--=, >, >=, <, <=, <> --<>:�����ʴ�


--�޿��� 1600�� ����� �˻�
SELECT * FROM PERSONNEL WHERE PAY=1600;

--�����ȣ�� 1116�� ����� �˻�
SELECT * FROM PERSONNEL WHERE pno=1116;

--����޿��� 2000 ������ ��� �˻�
SELECT * FROM PERSONNEL WHERE pay<=2000;

--90�� 12��17�Ͽ� �Ի��� ��� �˻�
--(��¥�� ����ó�� ���־�� �Ѵ�.)
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990-12-17';
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990/12/17';
--��¥�� �� ���� ��� �� ����� �����ϴ�.

--������ CLERK�� ��� �˻�
SELECT * FROM PERSONNEL WHERE job='CLERK';

--�̸��� JAMES�� ��� �˻�
SELECT * FROM PERSONNEL WHERE pname='JAMES';


-------------------------------------------------------------------------------------------


--�� ������
--and, or, NOT(�ڹٿ����� !�� ���� ����)

--AND
--�μ���ȣ�� 10���̰� �޿��� 3000�̻��� ���
SELECT * FROM PERSONNEL WHERE dno=10 and pay>=3000;

--������ SALSEMAN�̰� 90�� ���Ŀ� �Ի��� ���� �˻�
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN' AND STARTDATE>'1990/12/31';
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN' AND STARTDATE>='1991/01/01';

--91�� 9���� �Ի��� ������ ã���ÿ�
SELECT * FROM PERSONNEL
WHERE STARTDATE>='1991-09-01' AND STARTDATE<='1991/09/30';


SELECT * FROM NLS_SESSION_PARAMETERS;
--����Ŭ�� ���ӵǾ��� �� ���õǴ� ����
--�� ȸ�縶�� ������ �ٸ��� ������ �˰� ���� ���� �� ��ɾ�� �˻�


--OR
--�μ���ȣ�� 10���̰ų� �޿��� 3000�̻��� ��� �˻�
SELECT * FROM PERSONNEL
WHERE DNO=10 OR PAY>=3000;

--������ MANAGER�̰ų� 90�� ������ �Ի��� ���� �˻�
SELECT * FROM PERSONNEL
WHERE JOB='MANAGER' OR STARTDATE<'90/01/01';

--������ SALESMAN, CLERK�� ������ �˻�
SELECT * FROM PERSONNEL
WHERE JOB='SALESMAN' OR JOB='CLERK';

SELECT * FROM PERSONNEL
WHERE JOB IN('SALESMAN', 'CLERK');

/*�����δ� In�� ��������� ������� Or�����ڰ� �� ����
In�� Or�� ���� �������� ������ ���� ���� ���� 
�ϳ��ϳ� �Է��ϱ� ��Ʊ� ������ ��� �󵵰� �� ����.*/


--NOT
--������ SALESMAN, CLERK�� �ƴ� ������ �˻�
SELECT * FROM PERSONNEL
WHERE JOB<>'SALESMAN' AND JOB<>'CLERK';
--������ �����̸� AND �����ڸ� ����Ѵ�.

SELECT * FROM PERSONNEL
WHERE JOB NOT IN('SALESMAN','CLERK');

SELECT * FROM PERSONNEL
WHERE NOT JOB IN('SALESMAN','CLERK');

--Not�� ��ġ�� �÷��� �� Or �� ��� ��ġ�ϴ� �������.


-------------------------------------------------------------------------------------------


--���ڿ� ������
--BETWEEN A AND B

--�޿��� 1000���� 2000�� ���
SELECT * FROM PERSONNEL
WHERE PAY>=1000 AND PAY<=2000;

SELECT * FROM PERSONNEL
WHERE PAY BETWEEN 2000 AND 1000; --X

SELECT * FROM PERSONNEL
WHERE STARTDATE BETWEEN '1991-09-01' AND '1991-09-30';

--�μ���ȣ�� 20�� 30 ���̰� �ƴ� ��� �˻�
SELECT * FROM PERSONNEL
WHERE DNO NOT BETWEEN 20 AND 30; --20~30�� �ƴ� ��

SELECT * FROM PERSONNEL
WHERE DNO NOT IN (20,30); --20,30�� �ƴ� ��


--�̸��� A�� ���۵Ǵ� ���
SELECT * FROM PERSONNEL
WHERE PNAME LIKE 'A%';
--%�� JAVA������ *�� ����� ����
--%�� ����ϸ� =�� �ƴ϶� LIKE�� ����ؾ��Ѵ�. =�� ����ϸ� �����Ͱ� ������ �ʴ´�.

--�����ȣ�� 111_�� �����ϴ� ���A
SELECT * FROM PERSONNEL
WHERE PNO LIKE '111_'; --4�ڸ��� ����

--�����ȣ�� 111%�� �����ϴ� ���
SELECT * FROM PERSONNEL
WHERE PNO LIKE '111%'; --4�ڸ� �̻�

--�����ȣ�� 1__1�� ���
SELECT * FROM PERSONNEL
WHERE PNO LIKE '1__1'; --4�ڸ� �̸鼭 ��� ���ڸ��� ����� �͵� �������.

--90�⵵�� �Ի��� ���
SELECT * FROM PERSONNEL
WHERE STARTDATE LIKE '90%';

SELECT * FROM PERSONNEL
WHERE STARTDATE LIKE '1990%';
--��¥ �⺻ �ڸ����� YY�� ���ڸ��̱� ������, ���ڸ��� �Է��ϸ� �����Ͱ� ������ �ʴ´�.


INSERT INTO PERSONNEL
VALUES(2000,'HELLO_KIM','SALESMAN','1116','2022-07-04',5000,'',20);
INSERT INTO PERSONNEL 
VALUES(2001,'HELLOAKIM','SALESMAN','1116','2022-07-04',5000,'',20);
--���ο� ���� �߰�
--�ѹ� �̻� �����ϸ� ���� �߻�


-------------------------------------------------------------------------------------------


--O_K�� ������ �̸� �˻�
SELECT * FROM PERSONNEL WHERE PNAME LIKE '%O_K%';

SELECT * FROM PERSONNEL
WHERE PNAME LIKE '%O\_K%' ESCAPE '\';
--���⼭�� ���� �״���� �������,���� �״�ζ�� ���� ǥ���ϱ� ���� \�� ǥ�����ش�.
--ESCAPE�� ���� ���ٴ� �ǹ��̴�.


-------------------------------------------------------------------------------------------


--NULL
SELECT * FROM PERSONNEL;
WHERE MANAGER=NULL; --����X

SELECT * FROM PERSONNEL;
WHERE MANAGER='NULL'; --����X, ������ ������ NULL�̶�� ���ڰ� �Էµ����� �ʾұ� �����̴�.

SELECT * FROM PERSONNEL
WHERE MANAGER IS NULL; --NULL�� ������ ã��

SELECT * FROM PERSONNEL 
WHERE MANAGER IS NOT NULL; --NULL�� �ƴ� ������ ã��


-------------------------------------------------------------------------------------------


--�켱����: ��ȣ�� ������ �տ������� �켱, ��ȣ�� ������ ��ȣ���� �켱

--������ MANAGER�̰� �޿��� 1500�̻��� ���
--�Ǵ� ������ SALESMAN�� ��� �˻�
SELECT * FROM PERSONNEL
WHERE JOB='MANAGER' AND PAY>=1500 OR JOB='SALESMAN';

SELECT * FROM PERSONNEL
WHERE JOB='MANAGER' AND (PAY>=1500 OR JOB='SALESMAN'); 

--������ PRESIDENT �Ǵ� SALESMAN�̰� �޿��� 1500�̻��� ���
SELECT * FROM PERSONNEL
WHERE JOB='PRESIDENT' OR JOB='SALESMAN' AND PAY>=1500;


-------------------------------------------------------------------------------------------


--������ �����
--HELLO�� ���۵Ǵ� ��� �̸��� �����.
DELETE FROM PERSONNEL WHERE PNAME LIKE 'HELLO%';
SELECT * FROM PERSONNEL;

/*
Ctrl+S�� �����ϸ� �����Ͷ� ���� �ȿ� ������ ��(Transaction)
But Inset, Update, Delete�� ���� ������ �� Ŀ���϶�� ��ɾ ���. 
Ŀ�� - ���̺� ,�ѹ� - ���
AutoCommit OFF�� �����Ǿ��ֱ� ������ ����� ����.
�׳� �ݱ⸦ Ŭ���ϸ� �ڵ����� �ѹ��� �ȴ�.
AutoCommit�� �ڵ����� �����صθ� ������ �� �ڵ�� ������ 
Ŀ���� �ϱ� ������ ���� �ʴ� ���� ����.
*/
 
 
-------------------------------------------------------------------------------------------


--[[���� �Լ�]]
--ROUND(�ݿø��Լ�)
SELECT ROUND(45.275,1) FROM DUAL;
--���� �������� ������ �� �������� �����ϴ� ������
--������ ���̺��� �������� �ʾƵ� ������ ���̺��� �Է��ؾ��Ѵ�.

SELECT ROUND(45.275,1) FROM PERSONNEL;
--PERSONNEL ���̺� �ȿ� �����Ͱ� 10���� �ֱ� ������, ���� 10���� ����� �ȴ�.

SELECT * FROM DUAL;
--DUAL : ���� �������� ���� �۾��� ó���� �� ����. ���������� ������� �ִ� ���̸� �ȿ� �����Ͱ� �ϳ� �� ����.
 
 --  1  2  3  4  .  5  6  7 : ����
 -- -4 -3 -2 -1  0  1  2  3 : �ε��� ��, ������ -�� �д´�.
 
 SELECT ROUND(45.245,1) FROM DUAL; --45.2
 SELECT ROUND(45.245,-1) FROM DUAL; --50 
 SELECT ROUND(45.245,0) FROM DUAL; --45
 SELECT ROUND(45.245,0) FROM DUAL; --45
 SELECT ROUND(45.545) FROM DUAL; --46
 
 --���̺�� �����ؼ� ���
 SELECT PNO,PNAME,PAY,ROUND(PAY,-2) PAY1 FROM PERSONNEL;
 
 --[TRUNC (����)]
 --�ڿ� ���� �ݿø� ���� �ʰ� ����.
 SELECT TRUNC(45.245,2) FROM DUAL; --45.24
 SELECT TRUNC(49.245,-1) FROM DUAL; --40
 
 --���̺�� �����ؼ� ���
 SELECT PNO,PNAME,PAY,TRUNC(PAY,-2) PAY1 FROM PERSONNEL;
 
 --[CEIL (�ø�) : ������ ��ȯ��]
 SELECT CEIL(461.21) FROM DUAL; --462
 
 --[FLOOR (����) : ������ ��ȯ��]
 SELECT FLOOR(461.91) FROM DUAL; --461
 
 --[MOD(������)] -> JAVA������ %�� �����.
 SELECT MOD(10,3) FROM DUAL;
 
 --[ABS (���밪)] -> ���󵵰� ����.
 SELECT ABS(-123) FROM DUAL; --123
 
 --[SIGN (���� ����� ����� ���� 1, ������ ���� -1, �� : 0�� ��ȯ��)]
 SELECT SIGN(100-20),SIGN(100-102),SIGN(100-100) FROM DUAL;
 
 --[����]
 SELECT POWER(2,4) FROM DUAL;
 
 --[������]
 SELECT SQRT(9) FROM DUAL;
 
 
 -------------------------------------------------------------------------------------------
 
 
 --[[�����Լ�]]
 
 --[UPPER (�ҹ��� -> �빮�ڷ� ��ȯ)]
 SELECT UPPER('Oracle') FROM DUAL;
 
 --[LOWER (�빮�� -> �ҹ��ڷ� ��ȯ)]
 SELECT LOWER('Oracle') FROM DUAL;
 
 SELECT * FROM DIVISION WHERE DNAME= UPPER('sales');
 
 SELECT * FROM DIVISION WHERE LOWER(DNAME) = 'sales';
 
 --[INITCAP(���ڿ��� ù��° �ڸ��� �빮�ڷ� ��ȯ)]
 SELECT INITCAP('korea fighting') FROM DUAL;
 
 --[CONCAT(||�� ���� ����)] ->
 SELECT PNAME || DNO FROM PERSONNEL;
 SELECT CONCAT(PNAME,DNO) FROM PERSONNEL;
 
 CREATE TABLE post (
	seq  NUMBER  NOT NULL
	,zipcode  VARCHAR2(10)
	,sido  VARCHAR2(50)
	,gugun  VARCHAR2(100)
	,dong  VARCHAR2(100)
	,bunji  VARCHAR2(50)
        ,PRIMARY KEY (seq)
);

SELECT * FROM post;

SELECT * FROM POST WHERE DONG LIKE '����%'; 

SELECT * FROM POST WHERE DONG LIKE '�ູ%'; 

SELECT SIDO || ' ' || GUGUN || ' ' || DONG AS JUSO
FROM POST WHERE DONG LIKE '�ູ%';

--[LENGTH : ������ ����]
SELECT LENGTH('KOREA') FROM DUAL;
SELECT LENGTH('KOREA FIGHTING') FROM DUAL;

--[SUBSTR] -> JAVA�� SUBSTRING�� ����
SELECT SUBSTR('ABCDEFG',1,3) FROM DUAL; -- ABC
SELECT SUBSTR('ABCDEFG',3,2) FROM DUAL; -- CD
SELECT SUBSTR('ABCDEFG',-3,2) FROM DUAL; -- EF
SELECT SUBSTR('ABCDEFG',-4) FROM DUAL; -- DEFG

--[INSTR : �ε��� �� ã��]
SELECT INSTR('ABCDEFG','C') FROM DUAL; -- 3

SELECT INSTR('AAAAAAA','A') FROM DUAL; --1
SELECT INSTR('ABCDEFG','a') FROM DUAL; -- 0
/*JAVA�� 0���� �����ϰ� ���� ���� -1�� ����������
ORACLE�� 1���� �����ϰ� ���� ���� 0���� ����Ѵ�.*/

--[RPAD/LPAD]
--�̸� �ڿ� 15���ڰ� ä���� �� ���� ���� ���ڴ� *�� ǥ���ض�
SELECT RPAD(PNAME,15,'*') FROM PERSONNEL;

--�ֹι�ȣ 941010-2015368�� 941010-2******�� �ٲپ� ����ض�
SELECT RPAD(SUBSTR('941010-2015368',1,8),14,'*') �ֹι�ȣ FROM DUAL;

--[RTRIM/LTRIM]
SELECT RTRIM('ABBBBBB','B') FROM DUAL; --(������)B�� �����ض�
SELECT RTRIM('A      ',' ') FROM DUAL; --(������)������ �����ض�

SELECT LTRIM('BBBABB','B') FROM DUAL; --ABB (����)B�� �����ض�. A�� ������ �����.


-------------------------------------------------------------------------------------------


--[[��¥�Լ�]]

--[SYSDATE]
SELECT SYSDATE FROM DUAL; -- ���� ��¥�� �ð��� �о���

SELECT SYSDATE-1,SYSDATE,SYSDATE+1 FROM DUAL; --��¥�� ������ ������.
--SYSDATE-1 : ����,SYSDATE : ����,SYSDATE+1 : ����

--KIM����� ������� �ٹ��� ����� ���Ͻÿ�.
SELECT STARTDATE,SYSDATE, ROUND((SYSDATE-STARTDATE)/365) || '��'
��� FROM PERSONNEL WHERE PNAME = 'KIM';

--��¥�� ROUND
SELECT STARTDATE, ROUND(STARTDATE, 'YEAR') FROM PERSONNEL; --6��30���� �������� �ݿø�
SELECT STARTDATE, ROUND(STARTDATE, 'MONTH') FROM PERSONNEL; --16���� �������� �ݿø�

--��¥�� TRUNC 
SELECT STARTDATE, TRUNC(STARTDATE, 'YEAR') FROM PERSONNEL;
SELECT STARTDATE, TRUNC(STARTDATE, 'MONTH') FROM PERSONNEL;

--MONTHS_BETWEEN(���� �� ���ϱ�)
SELECT TRUNC((MONTHS_BETWEEN(SYSDATE,'2002/06/01'))/12) DAL FROM DUAL;

--LAST_DAY(���� ���� ���ϱ�)
SELECT STARTDATE,LAST_DAY(STARTDATE) FROM PERSONNEL;

--NEXT_DAY(���ƿ��� �� ���ϱ�)
SELECT NEXT_DAY(SYSDATE,'�ݿ���') FROM DUAL;

--ADD_MONTHS(���� �߰�)
SELECT ADD_MONTHS(SYSDATE, 24) FROM DUAL;


-------------------------------------------------------------------------------------------


--��ȯ�Լ�
--TO_CHAR (���ڷ� �ٲ��ִ� ���)
/*
MM : ��(10)
MON : 3���� �� �̸�(MAR)
MONTH : Ǯ����(MARCH)
DD : ���� ��¥��(22)
D : ���� �ϼ�(2)
DY : 3������ ����(MON)
DAY : Ǯ����(MONDAY)
RM : �θ��� �޼�
YYYY : 2022
*/

SELECT SYSDATE,TO_CHAR(SYSDATE,'D') FROM DUAL; --4
SELECT SYSDATE,TO_CHAR(SYSDATE,'DY') FROM DUAL; --��
SELECT SYSDATE,TO_CHAR(SYSDATE,'DAY') FROM DUAL; --������
SELECT SYSDATE,TO_CHAR(SYSDATE,'RM') FROM DUAL; --VII
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY') FROM DUAL; --2022
SELECT SYSDATE,TO_CHAR(SYSDATE,'DD') FROM DUAL; --06
SELECT SYSDATE,TO_CHAR(SYSDATE,'YY-MM-DD') FROM DUAL; --22-07-06

SELECT SYSDATE,TO_CHAR(SYSDATE,'HH24:MI:SS') FROM DUAL; --17:52:12
SELECT SYSDATE,TO_CHAR(SYSDATE,'AM HH24:MI:SS') FROM DUAL; --���� 17:52:17
--AM/PM�� ����/���ĸ� ��Ÿ���ڴٴ� �ǹ��̴�. PM�� �Է��ߴ��� ���� �ð��� �����̸� �������� ��µȴ�.

SELECT TO_CHAR(12506,'99,999') FROM DUAL; --12,506
SELECT TO_CHAR(12506,'099,999') FROM DUAL; --012,506
--���ڰ� 6�ڸ��� �ȵǸ� �տ� 0�� ä���. (�ڸ����� ���߱� ���ؼ�)
SELECT TO_CHAR(12506,'9,999') FROM DUAL; --######
--���ں��� �ڸ����� ���ڶ�� #���� ǥ�õȴ�.
SELECT TO_CHAR(12506.99,'99,999.99') FROM DUAL; --12,506.99
--�̷��� ǥ���� ���ڴ� TO_CHAR�� ���� ���ڰ� �Ǿ��� ������ ������� �ʴ´�.

SELECT SYSDATE,TO_CHAR(SYSDATE,'DD') FROM DUAL; --05
SELECT SYSDATE,TO_CHAR(SYSDATE,'DDSP') FROM DUAL; --FIVE
SELECT SYSDATE,TO_CHAR(SYSDATE,'DDTH') FROM DUAL; --05TH
SELECT SYSDATE,TO_CHAR(SYSDATE,'DDSPTH') FROM DUAL; --FIFTH

--TO_DATE
SELECT TO_DATE('22-07-06','YY-MM-DD')+1 FROM DUAL; --2022-07-07 00:00:00
--���ڰ� ��¥�� �ٲ��. ��¥�� �ٲ���� ������ ������ ����������.
SELECT TO_DATE('11:05','HH24:MI') FROM DUAL; --2022-07-01 11:05:00
--��¥�� ���� �ʰ� �ð��� ���� �� ���� ù���� ��µȴ�. 

--TO_NUMBER
--JAVA�� INTEGER.PARSEINT�� ���


--���ڴ� ��� ������ε� ���ڷ� �ٲ� �� ����.

--NVL
SELECT BONUS,NVL(BONUS,0) FROM PERSONNEL;
SELECT MANAGER FROM PERSONNEL;
SELECT MANAGER,NVL(TO_CHAR(MANAGER),'NON MANAGER') FROM PERSONNEL;
--MANAGER �÷��� ���� ����Ÿ���̴�. �׷��� �ΰ��� ���ڰ��� �� �� ����. �׷��� MANAGER �÷��� TO_CHAR �Լ��� ���� ���ڷ� �ٲ۴�. �׸��� ���ڵ����͸� �־��ش�.


-------------------------------------------------------------------------------------------


--DECODE(=IF)
--DECODE�� �񱳿����ڸ� ����� �� ����. (�ε�ȣ ����� �Ұ��ؼ� SIGN�Լ��� ���ϴ� ���̴�)
--�� ����� �޿��� �μ��� 10�� ��� 10%, �μ��� 20�� ��� 20%, �������� 30%�� �λ��ؼ� ���
SELECT PNAME,BONUS,DNO,PAY,
DECODE(DNO,10,PAY*1.1,20,PAY*1.2,PAY*1.3) �λ��
FROM PERSONNEL;

--�޿��� 3500�̻��� ��쿡�� 'GOOD', �̸��� ��쿡�� 'POOR'�� ���
SELECT PNAME,BONUS,DNO,PAY,
DECODE(SIGN(PAY-3500),-1,'POOR','GOOD') GRADE
FROM PERSONNEL;

SELECT PNAME,BONUS,DNO,PAY,
DECODE(SIGN(PAY-3500),1,'GOOD','POOR') GRADE
FROM PERSONNEL;


-------------------------------------------------------------------------------------------


--�׷��Լ�
--COUNT: ������ ����. �ΰ��� ���� �ʴ´�.
--�������� ���� ���� ǥ���Ѵ�. ������ ��� ����� �������� ���� �ϳ��� ���´�.
SELECT COUNT(*) FROM PERSONNEL;
SELECT COUNT(MANAGER) FROM PERSONNEL;
SELECT COUNT(BONUS) FROM PERSONNEL;

--�޿��� 3000�̻��� �����
SELECT COUNT(*) FROM PERSONNEL
WHERE PAY>=3000;

--AVG
SELECT AVG(PAY) FROM PERSONNEL;

--BONUS�� ��� ���ϱ�
SELECT AVG(BONUS) FROM PERSONNEL;
--��ü�ο��� 10�̰� ���ʽ� �ִ� �ο��� 3���̴�. �̷��� �ϸ� 3���� ���ʽ� ���� 3���� ���� ���� ��µȴ�.
--�ΰ��� ���� ������ �߰����� �ʴ´�.
SELECT AVG(NVL(BONUS,0)) FROM PERSONNEL;
--�ΰ��� 0���� �ٲ� �Ŀ� ������ �����ϸ�, �ΰ��� �����ؼ� ������ �����Ѵ�.
--���ʽ��� ���� ��ü�ο��� 10���� ���� ��հ��� ��µȴ�.

--SUM
SELECT SUM(PAY) FROM PERSONNEL;

--MAX/MIN
SELECT MAX(PAY),MIN(PAY) FROM PERSONNEL;

--�Ի����� ���� ������ ���
SELECT MIN(STARTDATE) FROM PERSONNEL;

--�Ի����� ���� ������ ����� ���Ի������ ����
SELECT ROUND((MAX(STARTDATE)-MIN(STARTDATE))/365) ���� FROM PERSONNEL;


-------------------------------------------------------------------------------------------


--�м��Լ�

--�μ��� ��� ���ϱ�
SELECT * FROM PERSONNEL
ORDER BY DNO;

SELECT DISTINCT DNO,AVG(PAY) OVER (PARTITION BY DNO) D_AVG --OVER�� AVG�� ����. �μ����� ������(PARTITION BY) ��� ���ϱ�
FROM PERSONNEL
ORDER BY DNO;


--���� ����
SELECT PNAME,PAY,RANK() OVER (ORDER BY PAY DESC) RANK FROM PERSONNEL;
--PAY�� �����ؼ� RANK�� ���� ������

--1200�� �޴� ����� ����
SELECT RANK(1200) WITHIN GROUP (ORDER BY PAY DESC) RANK FROM PERSONNEL;

SELECT COUNT(*) FROM PERSONNEL; --���ϰ��� ��ȯ
SELECT PNAME FROM PERSONNEL; --���߰��� ��ȯ
SELECT PNAME FROM PERSONNEL WHERE PAY=1600; --���ǿ� �ش��ϴ� �����Ͱ� ���������ٸ� ���߰��� ��ȯ���� ���̴�.

SELECT PNAME,MIN(STARTDATE) FROM PERSONNEL;
--PNAME�� ���߰� ��ȯ, MIN�� ���ϰ� ��ȯ�̱� ������ ������ �߻��Ѵ�.


--���߰�, ���ϰ��� ���� ����� �� �ְ� �ϴ� ���(��������)
--SELECT�� �ȿ� �� �ٸ� SELECT���� ����.
SELECT PNO,PNAME,STARTDATE FROM PERSONNEL
WHERE STARTDATE=(SELECT MIN(STARTDATE) FROM PERSONNEL); --��������
 
--�μ��� ��� �޿��� ���Ͻÿ�
SELECT DNO,AVG(PAY) FROM PERSONNEL; --DNO�� �������� ������ AVG�� �ϳ��� �����⶧���� ������ �߻��Ѵ�.

SELECT DNO,AVG(PAY) FROM PERSONNEL
GROUP BY DNO; --�׷��� �μ����� �׷��� ��� ����ϰ� �Ѵ�.

--������ ��ձ޿�, �ο����� ���Ͻÿ�
SELECT JOB ����,ROUND(AVG(PAY)) ��ձ޿�,COUNT(*) �ο��� FROM PERSONNEL
GROUP BY JOB;

--�� �μ��� ��ձ޿��� ��ü��ձ޿����� ũ�� 'GOOD', ������ 'POOR'�� ���
SELECT ROUND(AVG(PAY)) FROM PERSONNEL; --2973 : ��ü���

SELECT DNO,AVG(PAY)
DECODE(SIGN(ROUND(AVG(PAY)-AVG(SELECT DNO,AVG(PAY) FROM PERSONNEL GROUP BY DNO)),-1,'POOR','GOOD')
FROM PERSONNEL;

SELECT DNO,AVG(PAY),
DECODE(SIGN(AVG(PAY)-(SELECT ROUND(AVG(PAY)) FROM PERSONNEL)),-1,'POOR','GOOD') GRADE
FROM PERSONNEL
GROUP BY DNO
ORDER BY DNO ASC;
--�μ���տ��� ��ü��� ����. ����Ʈ������ ����Ʈ���� �� �� �ִ�.
--�ٱ� SELECT���� AVG�� GROUP BY DNO�� ���� �μ��� ���
--���� SELECT���� ��ü ���


--HAVING : GROUP BY�� ���ǹ�
--�� �μ��� ��ձ޿��� 3000�̻��� ���� ����Ͻÿ�.
SELECT DNO,AVG(PAY) FROM PERSONNEL
GROUP BY DNO;
HAVING AVG(PAY) > 3000;

SELECT DNO,AVG(PAY) D_AVG FROM PERSONNEL
GROUP BY DNO;
HAVING D_AVG > 3000;
--��Ī�� �� �� ����. ���� �߻�
--ORDER BY �ܿ��� ��Ī�� ����� �� ���� ������ ���� �����Ϳ� �ִ� ���� ����ؾ��Ѵ�.

SELECT * FROM PERSONNEL;

--�μ��ο��� 2���� ���� �μ��� �μ���ȣ, �޿��� ���� ���Ͻÿ�
SELECT DNO,COUNT(*) CNT,SUM(PAY) SUM FROM PERSONNEL
GROUP BY DNO
HAVING COUNT(*) > 2;


-------------------------------------------------------------------------------------------


--[JOIN��]
--�׵����� �ϳ��� ���̺��� SELECT�� ��
--������ �ϳ� �̻��� ���̺��� SELECT
--������ 3�� ��κ� 2���� ���̺��� ���� ���ϴ� �÷��� ���� ������
--�ϳ��� ���̺��� �ΰ��� �����ؼ� ���� ���ϴ� ���� JOIN�������� �ش�ȴ�.
/*
JOIN���� ����
EQUITE JOIN(INNER JOIN) -> ���󵵰� ���� ����.
NON-EQUITE JOIN
OUTER JOIN
CROSS JOIN
SELF JOIN
*/


-------------------------------------------------------------------------------------------

SELECT * FROM PERSONNEL;
--[SELF JOIN]
--SELF JOIN�� ����� ���� ������ ��������־�� ����� ������
--���� �������� SELF JOIN�� �����̴�.
SELECT A.PNO ���, A.PNAME ����, B.PNO ���, B.PNAME ������
FROM PERSONNEL A, PERSONNEL B 
WHERE A.MANAGER = B.PNO;
--BILL�� PRESIDENT


--NON-EQUIE JOIN
--EQUITE JOIN�� ���� �ʴ�. �̰� ���� NON-EQUITE JOIN�� ����� ���� ������ ��������־�� ����� �����ϴ�.
SELECT * FROM PERSONNEL;
SELECT * FROM PAYGRADE;
SELECT * FROM TAB;

SELECT PNAME,PAY,B.GRADE
FROM PERSONNEL A, PAYGRADE B
WHERE PAY BETWEEN LOWPAY AND HIGHPAY;

SELECT * FROM PERSONNEL;


-------------------------------------------------------------------------------------------


--OPERATOR
-- JOIN���� �ƴ����� JOIN�� �� �� ���´�.
-- �ΰ��� ���̺��� �����͸� �������� ����.
-- UNION�� ���󵵰� ���� ����.

--A=[1,2,5,6]
--B=[1,2,4]

--A UNION ALL B = [1,2,3,4,6,1,2,4]
--A UNION B = [1,2,4,5,6]
--A MINUS B = [5,6] ����
--A INTERSECT B = [1,2] ������


--UNION/ALL
SELECT * FROM PERSONNEL
UNION ALL
SELECT * FROM PERSONNEL;
--20ROWS

SELECT * FROM PERSONNEL
UNION
SELECT * FROM PERSONNEL;
--10ROWS


--MINUS
SELECT DNO FROM DIVISION --10 20 30 40
MINUS
SELECT DNO FROM PERSONNEL; --10 20 30
--���� : 40

--INTERSECT
SELECT DNO FROM DIVISION --10 20 30 40
INTERSECT
SELECT DNO FROM PERSONNEL; --10 20 30
--������ : 10 20 30


-------------------------------------------------------------------------------------------
--[07/06]

--SUBQUERY (��������)
--���� �ȿ� ������ �� �ִ� ��

SELECT * FROM TAB;

CREATE TABLE MANAGER
AS 
	SELECT * FROM PERSONNEL
	WHERE 1=2;

CREATE TABLE SALESMAN
AS 
	SELECT * FROM PERSONNEL
	WHERE 1=2;
--���̺��� Ʋ�� �����ϰ� ������ WHERE�� ���� ������ ������ �ȴ�. ���� ��� WHERE 1=2�� ���� ���� �ȵǴ� ����.
--�̷� ���ǿ� �����ϴ� �����ʹ� �翬�� �����״�, �����ʹ� �ϳ��� ���� ���̺� Ʋ�� ����ȴ�.

CREATE TABLE BUSEO
AS SELECT * FROM DIVISION;

CREATE TABLE SAWON
AS SELECT * FROM PERSONNEL;

CREATE TABLE EXAM1
AS SELECT * FROM PERSONNEL;

CREATE TABLE EXAM2
AS SELECT * FROM DIVISION;


SELECT * FROM SALESMAN;

SELECT * FROM DIVISION;

INSERT INTO DIVISION VALUES(50,'OPERATION','031-123-4567','DAEGU');
--�÷��� ������ �������� ������ ������ ���缭 �Է��Ѵ�.

DESC DIVISION;
COMMIT;

INSERT INTO DIVISION VALUES(60); --�������. 60�̶�� �����͸� ��� �÷��� �־���� �� �𸣱� �����̴�.
INSERT INTO DIVISION(DNO) VALUES(60);

INSERT INTO DIVISION (DNAME,POSITION) VALUES ('ACCOUNT','DAEJUN');
--�������
--�ֳ��ϸ� DESC DIVISION; �� �����ϸ� DNO���� �ΰ��� �� �� ���ٰ� �Ǿ��ִ�.
--NOT NULL�̶�� �Ǿ��ִ� ������ �ݵ�� �����Ͱ� ���� �Ѵ�.
INSERT INTO DIVISION (DNO,DNAME,POSITION) VALUES (70,'ACCOUNT','DAEJUN');


DESC PERSONNEL;

INSERT INTO PERSONNEL (PNO,PNAME,PAY,DNO)
VALUES (7711,'YOUNG',4000,20);

SELECT * FROM PERSONNEL;

--����� �� ����
INSERT INTO DIVISION VALUES(80,'PLANNING','010-123-1234',NULL);
INSERT INTO DIVISION VALUES(90,'SERVICE','010-222-3333','');
--�ΰ� �ִ� ���. �� �� �ϳ� ����ϸ� �ȴ�.

SELECT * FROM DIVISION;
DESC PERSONNEL;

INSERT INTO PERSONNEL(PNO,PNAME,JOB,STARTDATE,DNO)
VALUES (1304,'SUZI','SINGER',SYSDATE,10);


-------------------------------------------------------------------------------------------


--ġȯ����
SELECT PNO,PNAME,JOB,STARTDATE,DNO
FROM PERSONNEL
WHERE DNO=&D_NO;
--���⼭�� ������ �ȵȴ�. CMDâ������ ���� �����ϴ� &D_NO �κп� ����ڰ� ������ �Է��� �� �ִ�.

SELECT * FROM BUSEO;


-------------------------------------------------------------------------------------------


--SUBQUERY�� ����ؼ� INSERT
SELECT * FROM MANAGER;

SELECT * FROM PERSONNEL
WHERE JOB='MANAGER';

INSERT INTO MANAGER(PNO,PNAME,PAY,STARTDATE)
SELECT PNO,PNAME,PAY,STARTDATE 
FROM PERSONNEL
WHERE JOB='MANAGER';
--���ϴ� �÷��� �ִ´�.


--������ SALESMAN�� ����� ��� ������ SALESMAN ���̺�� ����
SELECT * FROM SALESMAN;

SELECT * FROM PERSONNEL
WHERE JOB='SALESMAN';

INSERT INTO SALESMAN
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN';
--�̹� ������� �ִ� ���̺� �����͸� �ִ� ���̱� ������ CREATE�� �޸� AS�� �ʿ����� �ʴ�.


-------------------------------------------------------------------------------------------


--UPDATE (����)
SELECT * FROM PERSONNEL WHERE PNO='1111';

--UPDATE, DELETE�� WHERE �������� �ʼ�. ������ ���� ������ ��� �����Ͱ� �����Ǳ� �����̴�.
UPDATE PERSONNEL SET DNO=30 WHERE PNO='1111';

UPDATE PERSONNEL SET PNAME='INNA',MANAGER=1004,STARTDATE=SYSDATE,PAY=8000
WHERE PNO='1111';

SELECT PNO,PNAME,TO_CHAR(STARTDATE,'YYYY-MM-DD') STARTDATE 
FROM PERSONNEL WHERE PNO='1111';

SELECT * FROM SAWON;

UPDATE SAWON SET DNO=20;

ROLLBACK;
--COMMIT���� �ѹ� �ؾ��Ѵ�. Ŀ�� �Ŀ� �ѹ��� �ƹ� �ҿ� ����.
--INSERT,UPDATE,DELETE���� ���� �ѹ��� �����ϴ�.


-------------------------------------------------------------------------------------------


--SUBQUERY�� UPDATE
SELECT * FROM PERSONNEL
WHERE DNO=(SELECT DNO FROM DIVISION WHERE DNAME='SALES');

SELECT * FROM DIVISION;

UPDATE PERSONNEL SET JOB='SALES'
WHERE DNO=(SELECT DNO FROM DIVISION WHERE DNAME='SALES');


SELECT A.*
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME='SALES';

UPDATE PERSONNEL SET JOB='SALESMAN'
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME='SALES';
--����Ŭ������ ���� �ȵȴ�.

/*
SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');��
JOIN������ �ٲ㺸�� */

SELECT A.*
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES';
--JOIN���̱� ������ FROM ~~~ WHERE������ �� �� ���� ����Ǹ� �ȵȴ�.

UPDATE PERSONNEL SET JOB='SALESMAN'
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES';
--����Ŭ�� ������Ʈ�� ���ι����� ������ �� ����. �������������� ������

ROLLBACK;


-------------------------------------------------------------------------------------------


--DELETE
--������ ������ �ݵ�� �ߺ��Ǵ� ���� ���� �����ͷ� �۾��ؾ� �Ѵ�.
SELECT * FROM PERSONNEL WHERE PNO=1111;
DELETE FROM PERSONNEL WHERE PNO=1111;
--FROM�� ���� ����

SELECT * FROM PERSONNEL WHERE PNO=1112;
DELETE PERSONNEL WHERE PNO=1112;


--SUBQUERY�� ����
SELECT * FROM DIVISION;

SELECT * FROM PERSONNEL
WHERE DNO=(SELECT DNO FROM DIVISION WHERE DNAME='FINANCE');

DELETE PERSONNEL
WHERE DNO=(SELECT DNO FROM DIVISION WHERE DNAME='FINANCE');


-------------------------------------------------------------------------------------------


--INSERT ERROR
SELECT * FROM PERSONNEL;

INSERT INTO PERSONNEL (PNO,PNAME,DNO) VALUES (1113,'INNA',51);
--���ϰ� �������ǿ� ����Ǿ� ���� ������ ����.

SELECT * FROM USER_CONSTRAINTS;
--���������� ���� ��ɾ�


--UPDATE ERROR
SELECT * FROM DIVISION;
SELECT * FROM PERSONNEL;
/*
DIVISION�� �����Ͽ� ������� ������ DIVISION�� �ִ� DNO�� PERSONNEL�� �� �� �ִ�.
SELECT * FROM USER_CONSTRAINTS�� �����ϸ� DIVISION_DNO_PK��� �����ִ� ���� �� �� �ִ�.
PERSONNEL ���̺��� DIVISION ���̺��� �����ϰ� �ִٴ� ���̴�.
DIVISION:�θ�, PERSONNEL�� �ڽ��̶�� ���� �� 
*/

UPDATE PERSONNEL SET DNO=51
WHERE DNO=20;
/*
�μ���ȣ 20���� 51������ �ٲܰ��̴�.
�����ϸ� DIVISION�� ���� DNO���� ã�ƺ���.
DIVISION�� 51�� ���� ������ �� ������ ������ ����.
���� �������迡�� �����͸� �����Ϸ���, �����Ϸ��� ���ο� ���� �θ����̺� �ִ� ���̾�� �Ѵ�.
*/


--DELETE ERROR
DELETE DIVISION WHERE DNO=20;
DELETE DIVISION WHERE DNO=50;
--�ڽ��� ����ϰ� ������ ���� �Ұ�, ������� ������ ���� ����

commit;


-------------------------------------------------------------------------------------------


--TRANSACTION

--AUTO COMMIT
--DDL(CREATE, ALTER, DROP, RENAME)
--DCL(GRANT, REVOKE)
--���������� ����� (ROLLBACK)


--DDL(CREATE, ALTER, DROP)
--OBJECT�� ���� �� ����Ѵ�.
--ALTER : CREATE�� ���� ���� ������ ��
--DROP : CREATE�� ���� ���� ������ ��

--OBJECT(TABLE,INDEX,SYNONYM,SEQUENCE,VIEW)

--TABLE
--DATA TYPE
--CHAR : ���� ����(��������)
--VARCHAR : ����(��������)
--NUMBER(P,S): ����(��������) - P(��ü �ڸ���) S(�Ҽ���) 
--DATE : ��¥, �ð�(��������)
--LONG : ����(�������� 2GB) - �� �Ⱦ�

CREATE TABLE BUSEO1
(DNO NUMBER(2), --DNO�� �� �ڸ� ���ڰ� ����.
DNAME VARCHAR(14),
ZIPCODE CHAR(7));

DESC BUSEO1;
INSERT INTO BUSEO1 VALUES(10,'AAA','123-123');
SELECT * FROM BUSEO1;

/*
���̺��̸�

�����ڷ� ����
Ư�����ڴ� (_,$,#)�� ��� �����ϸ� ù ���ڿ��� ����� �� ����.
���̺� �̸� �ߺ���� �ȵ�
�÷���� �޶����
����� ��� �Ұ� (�����: INSERT, SELECT ��) -> ����Ŭ�� ���� �̸��� �ߺ� �Ұ�

SAWON, P_NO, DIV10 : ��밡��
10DIV, $SAL, ALTER : ���Ұ�
*/

CREATE TABLE CUS_INFO
(ID CHAR(5) PRIMARY KEY, --���̵��� ���� ���� �ߺ����� �ʱ⸦ ���ϴ� ���
NAME CHAR(10),
JUMIN CHAR(14),
AGE NUMBER(3),
ADDR VARCHAR(100));

DESC CUSINFO;

INSERT INTO CUSINFO VALUES ('A100','SUZI','123456-1234567',27,'����');

SELECT * FROM CUSINFO;

SELECT * FROM USER_CONSTRAINTS;

SELECT STARTDATE FROM PERSONNEL;

SELECT STARTDATE,
EXTRACT(YEAR FROM STARTDATE) YEAR, --�⵵�� ����
EXTRACT(MONTH FROM STARTDATE) MONTH, --�޸� ����
EXTRACT(DAY FROM STARTDATE) DAY --�ϸ� ����
FROM PERSONNEL;


-------------------------------------------------------------------------------------------
--[07/07]

SELECT * FROM USER_CONSTRAINTS;

CREATE TABLE SALESMAN1
AS
SELECT PNO,PNAME,JOB,PAY FROM PERSONNEL
WHERE JOB='SALESMAN';

SELECT * FROM SALESMAN1;

DESC SALESMAN1;


--PERSONNEL ���̺��� ������ MANAGER�� ����� ��� ������ �����Ͽ� ���ο� ���̺��� MANAGER1�� ����

CREATE TABLE MANAGER1
AS
SELECT * FROM PERSONNEL
WHERE JOB='MANAGER';

SELECT * FROM MANAGER1;


--PAY�� 3000�̻��� ������ �����͸� ���� PAY3000 ���̺� ����
CREATE TABLE PAY3000
AS 
SELECT * FROM PERSONNEL
WHERE PAY>=3000;

SELECT * FROM PAY3000;


--PERSONNEL ���̺��� 12���޿� �Ի��� �������� �����͸� MON12��� ���̺�� ����
CREATE TABLE MON12
AS
SELECT * FROM PERSONNEL
WHERE TO_CHAR(STARTDATE,'MM')=12;
/*
CREATE TABLE MON12
AS
SELECT * FROM PERSONNEL
WHERE EXTRACT(MONTH FROM STARTDATE)=12;
*/

SELECT * FROM MON12;

SELECT * FROM PERSONNEL
WHERE TO_CHAR(STARTDATE,'MM')=04; --4�� �Է��ص� �ȴ�. ������ 04�� �Է��ϴ� ���� �� �� �ٶ����ϴ�.


CREATE TABLE ANALYST(NUM,NAME,JOB,DNUM) --���ο� ���̺��� �÷����� ���� ���ϴ� ������ �ٲ۴�.
AS
SELECT PNO,PNAME,JOB,DNO FROM PERSONNEL
WHERE JOB='ANALYST';

SELECT * FROM ANALYST;


--�μ���ȣ�� 10�� �μ��� �� �޿��� ������ DIV10 ���̺��� ����ÿ�
CREATE TABLE DIV10
AS
SELECT DNO,SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO
HAVING DNO=10;

SELECT * FROM DIV10;

/* ���Ʒ� ��� ����
SELECT DNO,SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO
HAVING DNO=10;

SELECT DNO,SUM(PAY) FROM PERSONNEL
WHERE DNO=10
GROUP BY DNO;
*/


-------------------------------------------------------------------------------------------


--���̺� ���� ����

SELECT * FROM PERSONNEL;

CREATE TABLE SAWON1
AS
SELECT * FROM PERSONNEL
WHERE 0=1;

SELECT * FROM SAWON1;

DESC PERSONNEL; --NOT NULL ����
DESC SAWON1; --NOT NULL ����
--���������� ������� �ʴ´�.


-------------------------------------------------------------------------------------------


--���̺� ����
SELECT * FROM SALESMAN1;

DESC SALESMAN1;


--ADD(�÷� �߰�)
ALTER TABLE SALESMAN1
ADD (DNO NUMBER(2));
--�÷��� �ϳ��� �߰��� ������ ��ȣ�� �����ص� �ȴ�. ������ �÷��� �ΰ� �̻��� ��쿡�� �ݵ�� ��ȣ�� �����־�� �Ѵ�.
--DNO: �߰� �÷� / NUMBER(2): �߰��Ϸ��� �÷��� ������ Ÿ��

INSERT INTO SALESMAN1 VALUES (1234,'SUZI','SALESMAN',3000,10);

SELECT * FROM SALESMAN1;

ALTER TABLE SALESMAN1
ADD (JUMIN CHAR(14), ZIP CHAR(7));

SELECT * FROM SALESMAN1;

INSERT INTO SALESMAN1 VALUES (4444,'INNA','SALESMAN',2000,10,'1234','1234');

ALTER TABLE SALESMAN1
ADD BIGO VARCHAR2(10) DEFAULT('AA');

CREATE TABLE CUSINFO
(ID NUMBER(3) CONSTRAINT CUSINFO_ID_PK PRIMARY KEY,
NAME CHAR(10),
BIRTH DATE DEFAULT SYSDATE);

INSERT INTO CUSINFO (ID,NAME) VALUES (111,'SUZI');
--MS-SQL������ (ID,NAME)�� �������� �ʾƵ� �ڵ����� �����Ͱ� ����.
--������ ����Ŭ������ � �÷��� �����Ͱ� ������ �����־�� �Ѵ�.

SELECT * FROM CUSINFO;


ALTER TABLE SALESMAN1
ADD (MARRIAGE CHAR(8) CONSTRAINT SALESMAN1_MARRIAGE_CK
CHECK (MARRIAGE IN ('SINGLE','MARRIED')));

SELECT * FROM SALESMAN1;

INSERT INTO SALESMAN1
VALUES (5555,'INSUN','SALESMAN',2000,10,'1234','1234','BB','SOLO'); --SOLO�� ���Ե� �� ����. �������

INSERT INTO SALESMAN1
VALUES (5555,'INSUN','SALESMAN',2000,10,'1234','1234','BB','SINGLE');

DESC SALESMAN1;
SELECT * FROM USER_CONSTRAINTS; 


--PK�� ���� ���̺� PK�� �ְ� ���� ��
--���̺��� �̹� ������� �ִ� �����̰� PK�� ���� ����
ALTER TABLE SALESMAN1
ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO);
/*
CREATE TABLE CUSINFO
(ID NUMBER(3) CONSTRAINT CUSINFO_ID_PK PRIMARY KEY,
NAME CHAR(10),
BIRTH DATE DEFAULT SYSDATE);
�� ������ ID �÷��� �����ϸ鼭 ���ÿ� PK�� �����ߴ�. �׷��� KEY �ڿ� ��ȣ�� �÷��� ����� �ʿ䰡 ����.

������ 
ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO);
���� ���� �̹� ������� �ִ� ���̺��� ���� PK�� �����ϰ��� �ϴ� ���̴�.
�÷��� �������� �����Ƿ� KEY �ڿ� ��ȣ�� � �÷��� PK�� ������ ������ ������־�� �Ѵ�.
*/


ALTER TABLE MANAGER1
ADD COMM NUMBER(5);

DESC MANAGER1;

SELECT * FROM MANAGER1;
SELECT * FROM USER_CONSTRAINTS; 

ALTER TABLE MANAGER1
ADD CONSTRAINT MANAGER1_PNO_PK PRIMARY KEY(PNO);


-------------------------------------------------------------------------------------------


--MODIFY(�÷�����)
SELECT * FROM MANAGER1;
DESC MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(16);

DESC MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(7) NOT NULL;
--PNO�� PK�� �ڵ����� �� NOT NULL�̰� PNAME�� NOT NULL�� ���� NOT NULL�̴�.


-------------------------------------------------------------------------------------------


--DROP(�÷�, �������� ����)
SELECT * FROM MANAGER1;
DESC MANAGER1;

SELECT * FROM USER_CONSTRAINTS; 

--PK�� �̸����� �����
--�������� ���
ALTER TABLE MANAGER1
DROP CONSTRAINT MANAGER1_PNO_PK;

--PK�� ������ ���̺� �ϳ����̶� �׳� PK�� ������ �ȴ�.
--�� ����� PK���� �����ȴ�. �ٸ� ���������� �̸����� ����� ������� �ؾ��Ѵ�.
ALTER TABLE SALESMAN1
DROP PRIMARY KEY;

ALTER TABLE DIVISION
DROP CONSTRAINT DIVISION_DNO_PK CASCADE;


--�÷�����
SELECT * FROM SALESMAN1;
DESC SALESMAN1;

--�����Ͱ� ����־ �����ȴ�.
ALTER TABLE SALESMAN1
DROP COLUMN MARRIAGE;

--������ �ƴϰ� �������ϰ� �ϴ� ��
--��Ȱ��ȭ ����
ALTER TABLE SALESMAN1
SET UNUSED COLUMN DNO;

--UNUSED �÷� �����ϱ�
ALTER TABLE SALESMAN1
DROP UNUSED COLUMN;

SELECT COUNT(*) FROM DICTIONARY; --���� �� �� �ִ� DICTIONARY ����


-------------------------------------------------------------------------------------------


--DROP(���̺� ����)
SELECT * FROM TABS;

DROP TABLE SALESMAN1;

SELECT * FROM RECYCLEBIN;

FLASHBACK TABLE "BIN$XOUK70ehQGKIAnvwdnzOkw==$0" TO BEFORE DROP;

FLASHBACK TABLE SALESMAN1 TO BEFORE DROP;

SELECT * FROM "BIN$92LjZpdjQSm5aWENeuwU5g==$0";

SELECT * FROM TAB;

PURGE RECYCLEBIN;

DROP TABLE MANAGER1 PURGE;

COMMIT;

-------------------------------------------------------------------------------------------


--���ڵ� ����
--TRUNCATE / DELETE

SELECT * FROM CUSINFO;

DELETE CUSINFO;
--DELETE -> TRANSACTION ����

SELECT * FROM CUSINFO;

ROLLBACK;

SELECT * FROM CUSINFO; --�����ߴ� �����͸� �ѹ����� �ٽ� �츲

COMMIT;

--TRUNCATE
--������ ����. �ѹ���� �ʴ´�.
TRUNCATE TABLE CUSINFO;
SELECT * FROM CUSINFO;
ROLLBACK;
SELECT * FROM CUSINFO;


-------------------------------------------------------------------------------------------


--[RENAME](���̺��� �̸� ����)
--�÷��� ���� ���̺� ���� ���� ��
SELECT * FROM TAB;

SELECT * FROM PAY3000;

RENAME PAY3000 TO HIGHPAY;

SELECT * FROM HIGHPAY;
--�̸��� �����ϰ� �� �Ŀ� ������ ������ ���� �˻��ϸ� ������ ����.


-------------------------------------------------------------------------------------------


--[COMMENT]
--: �ּ�ó���ϴ� ����
SELECT * FROM USER_TAB_COMMENTS;
--��ųʸ�, �����̱� ������ -S�� ����

COMMENT ON TABLE HIGHPAY
IS '���� ���� �޴� ���';
--HIGH PAY�� COMMENTS ���� ���� �޴� ����̶�� ������ ��µ�.

SELECT * FROM USER_TAB_COMMENTS;

COMMENT ON TABLE HIGHPAY
IS '';
--�ּ� ó�� �� �� ����

SELECT * FROM USER_TAB_COMMENTS;

COMMENT ON COLUMN HIGHPAY.PAY
IS '�� ���� �ݾ�';

SELECT * FROM USER_COL_COMMENTS;

SELECT * FROM HIGHPAY;

COMMENT ON COLUMN HIGHPAY.BONUS
IS '���� ���ʽ� ����.';

SELECT * FROM USER_COL_COMMENTS;


-------------------------------------------------------------------------------------------


--DCL(GRANT,REVOKE)
--GRANT: USER�� OBJECT�� ������ �ο��� �� ���
--REVOKE: USER�� OBJECT�� ������ ȸ���� �� ���

CREATE USER YOUNG
IDENTIFIED BY YOUNG
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

--OBJECT ����
GRANT SELECT ON PERSONNEL TO TEST;
GRANT SELECT,INSERT,DELETE ON DIVISION TO TEST;

SELECT * FROM USER_TAB_PRIVS_MADE;

REVOKE SELECT ON PERSONNEL FROM TEST;
REVOKE SELECT ON DIVISION FROM TEST;
REVOKE INSERT ON DIVISION FROM TEST;
REVOKE DELETE ON DIVISION FROM TEST;


CREATE ROLE MANAGER; 
--�������. KIM���� ������ ����.


CREATE ROLE KIMOBJ;

GRANT SELECT,INSERT,DELETE ON DIVISION TO KIMOBJ;

GRANT KIMOBJ TO lee;

SELECT * FROM ROLE_SYS_PRIVS;
SELECT * FROM USER_ROLE_PRIVS;


-------------------------------------------------------------------------------------------

/*
�������� (CONSTRAINT) : ���Ἲ
PRIMARY KEY (PK)
FOREIGH KEY (FK)
UNIQUE KEY (UK)
NOT NULL (NN)
CHECK KEY (CK)
DEFAULT > ����Ŭ������ �������ǿ� ���� ������ MS������ �������ǿ� ����.

���� ���� �� ���� ���� �������� �� ���Ἲ�� �����ٰ� ���Ѵ�.





























