
--kim
----------------------------------------------[07/04]---------------------------------------------

SELECT * FROM tab;

SELECT * FROM PERSONNEL;

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


--��Ī
SELECT PNO,PNAME,PAY,PAY+1000 as ���ʽ� from PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 ���ʽ� from PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 "�� �� ��" from PERSONNEL;
/*��� �÷��� ��Ī�� �ټ� �ִ�. �÷��� �ڿ� �̸��� �ָ� ��. but ,�� ���� �ȵȴ�.*/
/*select���� ������ ������*/
/*pay+1000�� �Ļ� �÷��̴� db�ȿ� ���ִ� ���� �ƴ� �� ���� �ȿ��� ���� ����.*/
/*�÷��� �ڿ� as~~~ �ϸ� ��Ī���� ���� �� ����. as�� ������ ����*/
/*�����ϴ� ���� ���� �ʴ�. �׷��� �ϰ� ���� ��쿡�� ����ǥ�� �ٿ��ش�.*/

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
ORDER BY dno,pno desc; --���������� pno���� ����ȴ�. dno�� �⺻���� ������������ ����ȴ�.


--�μ���ȣ�� ��������, �����ȣ�� �������� ����
SELECT * FROM PERSONNEL
ORDER BY dno, pno desc;


--null
SELECT manager from PERSONNEL
ORDER BY manager asc;

SELECT manager from PERSONNEL
ORDER BY manager desc;


--����� �޿��� ������ ����Ͻÿ�
SELECT pno,pname,pay,pay*12 ���� FROM PERSONNEL;


--���� ������
SELECT pname || pno from PERSONNEL;

SELECT pname || ' ' || pno from PERSONNEL;

SELECT * FROM PERSONNEL;


SELECT pno,pname,pay,nvl(bonus,0),(pay*12)+nvl(BONUS,0) ���� FROM PERSONNEL;


--������(where)
SELECT * FROM PERSONNEL;

SELECT pno,pname,job FROM PERSONNEL
WHERE job='salesman';

SELECT pno,pname,job FROM PERSONNEL
WHERE job='SALESMAN';


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
SELECT * FROM PERSONNEL WHERE STARTDATE='1990-12-17';

--������ CLERK�� ��� �˻�
SELECT * FROM PERSONNEL WHERE job='CLERK';

--�̸��� JAMES�� ��� �˻�
SELECT * FROM PERSONNEL WHERE pname='JAMES';


--�� ������
--and, or, NOT(�ڹٿ����� !�� ���� ����)

--AND
--�μ���ȣ�� 10���̰� �޿��� 3000�̻��� ���
SELECT * FROM PERSONNEL WHERE dno=10 and pay>=3000;

--������ SALSEMAN�̰� 90�� ���Ŀ� �Ի��� ���� �˻�
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN' AND STARTDATE>'1990/12/31';
--�Ǵ� SELECT * FROM PERSONNEL WHERE JOB='SALESMAN' AND STARTDATE>='1991/01/01';

--91�� 9���� �Ի��� ������ ã���ÿ�
SELECT * FROM PERSONNEL
WHERE STARTDATE>='1991-09-01' AND STARTDATE<='1991/09/30';


SELECT * FROM NLS_SESSION_PARAMETERS;


--OR
--�μ���ȣ�� 10���̰ų� �޿��� 3000�̻��� ��� �˻�
SELECT * FROM PERSONNEL
WHERE DNO=10 OR PAY>=3000;

--������ MANAGER�̰ų� 90�� ������ �Ի��� ���� �˻�
SELECT * FROM PERSONNEL
WHERE JOB='MANAGER' OR STARTDATE<'90/01/01';


--NOT
--������ SALESMAN, CLERK�� ������ �˻�
SELECT * FROM PERSONNEL
WHERE JOB='SALESMAN' OR JOB='CLERK';

--������ SALESMA, CLERK�� �ƴ� ������ �˻�
SELECT * FROM PERSONNEL
WHERE JOB<>'SALESMAN' AND JOB<>'CLERK';

SELECT * FROM PERSONNEL
WHERE JOB IN('SALESMAN','CLERK');

SELECT * FROM PERSONNEL
WHERE JOB NOT IN('SALESMAN','CLERK');

SELECT * FROM PERSONNEL
WHERE NOT JOB IN('SALESMAN','CLERK');


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
WHERE PNAME LIKE 'A%'; --%�� ����ϸ� =�� �ƴ϶� LIKE�� ����ؾ��Ѵ�. =�� ����ϸ� �����Ͱ� ������ �ʴ´�.

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
WHERE STARTDATE LIKE '1990%'; --��¥ �⺻ �ڸ����� YY�� ���ڸ��̱� ������, ���ڸ��� �Է��ϸ� �����Ͱ� ������ �ʴ´�.


INSERT INTO PERSONNEL
VALUES(2000,'HELLO_KIM','SALESMAN','1116','2022-07-04',5000,'',20); --���ο� ���� �߰�

INSERT INTO PERSONNEL 
VALUES(2001,'HELLOAKIM','SALESMAN','1116','2022-07-04',5000,'',20);


--O_K�� ������ �̸� �˻�
SELECT * FROM PERSONNEL
WHERE PNAME LIKE '%O\_K%' ESCAPE '\';  --���⼭�� ���� �״���� �������,���� �״�ζ�� ���� ǥ���ϱ� ���� \�� ǥ�����ش�.


--NULL
SELECT * FROM PERSONNEL;
WHERE MANAGER=NULL; --X

SELECT * FROM PERSONNEL;
WHERE MANAGER='NULL'; --X

SELECT * FROM PERSONNEL
WHERE MANAGER IS NULL; --NULL�� ������ ã��

SELECT * FROM PERSONNEL 
WHERE MANAGER IS NOT NULL; --NULL�� �ƴ� ������ ã��


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
 
 --[�Լ�]
 
 --[[���� �Լ�]]
 --ROUND(�ݿø��Լ�)
 SELECT ROUND(45.275,1) FROM DUAL;
 /*���� �������� ������ �� �������� �����ϴ� ������
 ������ ���̺��� �������� �ʾƵ� ������ ���̺��� �Է��ؾ��Ѵ�.*/
 
 SELECT ROUND(45.275,1) FROM PERSONNEL;
 /*PERSONNEL ���̺� �ȿ� �����Ͱ� 10���� �ֱ� ������ 
 ���� 10���� ����� �ȴ�.*/
 
 SELECT * FROM DUAL;
 /*DUAL : ���� �������� ���� �۾��� ó���� �� ����.
 ���������� ������� �ִ� ���̸� �ȿ� �����Ͱ� �ϳ� �� ����.*/
 
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

SELECT LTRIM('BBBABB','B') FROM DUAL; --ABB (����)B�� �����ض�

--[[��¥�Լ�]]

--[SYSDATE]
SELECT SYSDATE FROM DUAL; -- ���� ��¥�� �ð��� �о���

SELECT SYSDATE-1,SYSDATE,SYSDATE+1 FROM DUAL; --��¥�� ������ ������.
--SYSDATE-1 : ����,SYSDATE : ����,SYSDATE+1 : ����

--KIM����� ������� �ٹ��� ����� ���Ͻÿ�.
SELECT STARTDATE,SYSDATE, ROUND((SYSDATE-STARTDATE)/365) || '��'
��� FROM PERSONNEL WHERE PNAME = 'KIM';

/*��¥�� 6�� 30���� �������� �ݿø��Ѵ�.*/
--��¥�� ROUND
SELECT STARTDATE, ROUND(STARTDATE, 'YEAR') FROM PERSONNEL;
SELECT STARTDATE, ROUND(STARTDATE, 'MONTH') FROM PERSONNEL;

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
