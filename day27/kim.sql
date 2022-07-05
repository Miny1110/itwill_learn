
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

SELECT SYSDATE,TO_CHAR(SYSDATE,'D') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'DY') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'DAY') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'RM') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'DD') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'YY-MM-DD') FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'HH24:MI:SS') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'AM HH24:MI:SS') FROM DUAL;
--AM/PM�� ����/���ĸ� ��Ÿ���ڴٴ� �ǹ��̴�. PM�� �Է��ߴ��� ���� �ð��� �����̸� �������� ��µȴ�.

SELECT TO_CHAR(12506,'99,999') FROM DUAL;
SELECT TO_CHAR(12506,'099,999') FROM DUAL; --���ڰ� 6�ڸ��� �ȵǸ� �տ� 0�� ä���. (�ڸ����� ���߱� ���ؼ�)
SELECT TO_CHAR(12506,'9,999') FROM DUAL; --���ں��� �ڸ����� ���ڶ�� #���� ǥ�õȴ�.
SELECT TO_CHAR(12506.99,'99,999.99') FROM DUAL;
--�̷��� ǥ���� ���ڴ� TO_CHAR�� ���� ���ڰ� �Ǿ��� ������ ������� �ʴ´�.

SELECT SYSDATE,TO_CHAR(SYSDATE,'DD') FROM DUAL; --05
SELECT SYSDATE,TO_CHAR(SYSDATE,'DDSP') FROM DUAL; --FIVE
SELECT SYSDATE,TO_CHAR(SYSDATE,'DDTH') FROM DUAL; --05TH
SELECT SYSDATE,TO_CHAR(SYSDATE,'DDSPTH') FROM DUAL; --FIFTH

--TO_DATE
SELECT TO_DATE('22-07-06','YY-MM-DD')+1 FROM DUAL; --���ڰ� ��¥�� �ٲ��. ��¥�� �ٲ���� ������ ������ ����������.
SELECT TO_DATE('11:05','HH24:MI') FROM DUAL; --��¥�� ���� �ʰ� �ð��� ���� �� ���� ù���� ��µȴ�. 

--TO_NUMBER
--JAVA�� INTEGER.PARSEINT�� ���
SELECT TO_NUMBER('123')+1 FROM DUAL;
SELECT TO_NUMBER('ABC') FROM DUAL; --���� X
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











