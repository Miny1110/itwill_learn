--SCOTT

--[����1]

SELECT * FROM TAB;
SELECT * FROM EMP;

--2. EMP ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ,�̸�,������,�޿��� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.
SELECT EMPNO,ENAME,JOB,SAL FROM EMP
WHERE SAL>=3000; 


--3. EMP ���̺��� �����ȣ�� 7782�� ����� �̸��� �μ���ȣ�� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.
SELECT ENAME,DEPTNO FROM EMP
WHERE EMPNO=7782;
 

--4. EMP ���̺��� �Ի����� February 20, 1981�� May 1, 1981 ���̿� �Ի��� ����� �̸�,����,�Ի����� ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �Ի��� ������ ����Ͻÿ�.
SELECT ENAME,JOB,HIREDATE FROM EMP
WHERE HIREDATE>='81/02/20' AND HIREDATE<='81/05/01'
ORDER BY HIREDATE;


SELECT ENAME,JOB,HIREDATE FROM EMP
WHERE HIREDATE BETWEEN '81/02/20' AND '81/05/01'
ORDER BY HIREDATE;
 
 
--5. EMP ���̺��� �μ���ȣ�� 10,20�� ����� ��� ������ ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �̸������� �����Ͽ���.
SELECT * FROM EMP
WHERE DEPTNO=10 OR DEPTNO=20
ORDER BY ENAME;

SELECT * FROM EMP
WHERE DEPTNO IN(10,20)
ORDER BY ENAME;
 

--6. EMP ���̺��� �޿��� 1500�̻��̰� �μ���ȣ�� 10,30�� ����� �̸��� �޿��� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� HEADING�� Employee�� Monthly Salary�� ����Ͽ���.
SELECT ENAME AS Employee,SAL AS "Monthly Salary" FROM EMP
WHERE SAL>=1500 AND DEPTNO IN(10,30);
 

--7. EMP ���̺��� 1982�⿡ �Ի��� �����  ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP
WHERE HIREDATE>='82/01/01' AND HIREDATE<='82/12/31';

SELECT * FROM EMP
WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';

SELECT * FROM EMP
WHERE HIREDATE LIKE '82%';
 

--8. EMP ���̺��� COMM�� NULL�� �ƴ� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP
WHERE COMM IS NOT NULL;


--9. EMP ���̺��� ���ʽ��� �޿����� 10%�� ���� ��� �������� ���Ͽ� �̸�,�޿�,���ʽ��� ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT ENAME, SAL,COMM FROM EMP
WHERE COMM>(SAL*1.1);
 

--10. EMP ���̺��� ������ Clerk�̰ų� Analyst�̰� �޿��� 1000,3000,5000�� �ƴ� ��� ����� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP
WHERE (JOB=UPPER('Clerk') OR JOB=UPPER('Analyst')) AND SAL NOT IN(1000,3000,5000);


--11. EMP ���̺��� �̸��� L�� �� �ڰ� �ְ�  �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP
WHERE ENAME LIKE '%L%L%' AND (DEPTNO=30 OR MGR=7782);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[����2]

--1. ���� ��¥�� ����ϰ� �� ���̺��� Current Date�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT TO_DATE(SYSDATE,'YY-MM-DD') "CURRENT DATE" FROM DUAL;
 

--2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT EMPNO,ENAME,JOB,SAL,SAL*1.15 "NEW SALARY",SAL*0.15 "INCREASE" FROM EMP;
 

--3. EMP ���̺��� �̸�,�Ի���,�Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME,HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6),'������') "6���� �� ������" FROM EMP;


 

--4. EMP ���̺��� �̸�,�Ի���, �Ի��Ϸκ��� ��������� ����,�޿�, �Ի��Ϻ��� ��������� �޿��� �Ѱ踦 ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME,HIREDATE,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) ����,SAL,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL "�� �޿�" FROM EMP;
 

 

--5. EMP ���̺��� ������ ����� ��µǵ��� �ۼ��Ͻÿ�.

/*
Dream Salary

------------------------------------------------------------

KING earns $5,000.00 monthly but wants $15,000.00

BLAKE earns $2,850.00 monthly but wants $8,550.00

CLARK earns $2,450.00 monthly but wants $7,350.00

. . . . . . . . . .

14 rows selected
*/

SELECT ENAME,TO_CHAR(SAL,'$'||'99,999.99'),TO_CHAR(SAL*3,'$'||'99,999.99') FROM EMP;

SELECT ENAME,TO_CHAR(SAL,CONCAT('$','99,999.99')),TO_CHAR(SAL*3,CONCAT('$','99,999.99')) FROM EMP;

SELECT ENAME || ' earns ' || TO_CHAR(SAL,CONCAT('$','99,999.99')) || ' monthly but wants ' || TO_CHAR(SAL*3,CONCAT('$','99,999.99')) "Dream Salary" FROM EMP;
 

--6. EMP ���̺��� ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ ����� ��*���� ��ġ)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME,LPAD(SAL,15,'*') �޿� FROM EMP;
 

--7. EMP ���̺��� ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME,JOB,HIREDATE,TO_CHAR(HIREDATE,'DAY') �Ի���� FROM EMP;
 

--8. EMP ���̺��� �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME,LENGTH(ENAME) ���ڼ�,JOB FROM EMP
WHERE NOT SIGN(LENGTH(ENAME)-6)=-1;

SELECT ENAME,LENGTH(ENAME) ���ڼ�,JOB FROM EMP
WHERE LENGTH(ENAME)>=6;
 

--9. EMP ���̺��� ��� ����� ������ �̸�,����,�޿�,���ʽ�,�޿�+���ʽ��� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME,JOB,SAL,COMM,SAL+NVL(COMM,0) "�޿�+���ʽ�" FROM EMP;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[����3]
/*
SELECT 
case SEX 
when '1' then '����'
when '0' then '����'
end gender,
COUNT(*) �ο��� FROM CUSTOM
GROUP BY SEX;

WHEN '1' THEN '����' ELSE '����'

SELECT 
CASE �÷���                         
	WHEN 1 THEN 100                          
	WHEN 2 THEN 200                         
	WHEN 3 THEN 300                         
	WHEN 4 THEN 400                          
	ELSE 500                        
END AS RESULT             
FROM DUAL;
*/



--1. EMP ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM EMP;

SELECT COUNT(*) �ο���, MAX(SAL) �ִ�޿�, MIN(SAL) �ּұ޿�, SUM(SAL) �ѱ޿� FROM EMP;


--2. EMP ���̺��� �� �������� �ִ� �޿�,�ּ� �޿�,�޿��� ���� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT JOB ����, MAX(SAL) �ִ�޿�, MIN(SAL) �ּұ޿�, SUM(SAL) �ѱ޿�
FROM EMP
GROUP BY JOB;
 

--3. EMP ���̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT JOB ����, COUNT(*) �ο���
FROM EMP
GROUP BY JOB;
 

--4. EMP ���̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT MAX(SAL) �ִ�޿�, MIN(SAL) �ּұ޿�, MAX(SAL)-MIN(SAL) �޿����� FROM EMP;
 

--5. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(group by)
/*
H_YEAR  COUNT(*)  MIN(SAL)  MAX(SAL)  AVG(SAL)  SUM(SAL)

------ --------- --------- --------- --------- ---------

    81       10       950      5000    2282.5	  22825

    82        1      1300      1300      1300      1300

    80        1       800       800       800       800
 */
SELECT * FROM EMP;

SELECT
SUBSTR(EXTRACT(YEAR FROM HIREDATE),3,2) H_YEAR,
COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL)
FROM EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY AVG(SAL) DESC;

 

--6. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(case,sum)
/*
    TOTAL      1980      1981      1982      1983

--------- --------- --------- --------- ---------

       12         1        10         1         0
*/ 






--7. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
/*
JOB         Deptno 10    Deptno 20     Deptno 30     Total

---------   ---------    ---------     ---------     ---------

CLERK            1300         1900           950          4150

SALESMAN                                    5600          5600

PRESIDENT	 5000                                     5000

MANAGER	         2450         2975          2850          8275

ANALYST	                      6000                        6000
 */
 
SELECT * FROM EMP;

--SELECT JOB
 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[����4]

--1. EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME,DEPTNO FROM EMP;
SELECT * FROM DEPT;

SELECT ENAME,A.DEPTNO,DNAME
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO=B.DEPTNO;

SELECT ENAME,A.DEPTNO,DNAME
FROM EMP A , DEPT B
WHERE A.DEPTNO=B.DEPTNO;


--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT ENAME,JOB,SAL,DNAME
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO=B.DEPTNO AND B.LOC='NEW YORK';

SELECT ENAME,JOB,SAL,DNAME
FROM EMP A, DEPT B
WHERE A.DEPTNO=B.DEPTNO AND B.LOC='NEW YORK';
 

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM EMP;
SELECT * FROM EMP WHERE COMM IS NOT NULL;
SELECT * FROM DEPT;

SELECT ENAME,DNAME,LOC
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO=B.DEPTNO AND A.COMM IS NOT NULL;

SELECT ENAME,DNAME,LOC
FROM EMP A, DEPT B
WHERE A.DEPTNO=B.DEPTNO AND A.COMM IS NOT NULL;
 

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM EMP;
SELECT * FROM EMP WHERE ENAME LIKE '%L%';
SELECT * FROM DEPT;

SELECT ENAME,JOB,DNAME,LOC
FROM EMP A INNER JOIN DEPT B
ON A.DEPTNO=B.DEPTNO AND A.ENAME LIKE '%L%';

SELECT ENAME,JOB,DNAME,LOC
FROM EMP A, DEPT B
WHERE A.DEPTNO=B.DEPTNO AND A.ENAME LIKE '%L%';
 

--5. �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(�����ڰ� ���� King�� �����Ͽ� ��� ����� ���)
/*
Employee        Emp# Manager         Mgr#

---------- --------- ---------- ---------

KING            7839

BLAKE           7698 KING            7839

CLARK           7782 KING            7839

. . . . . . . . . .

14 rows selected.
 */
SELECT * FROM EMP;
SELECT * FROM TAB;

SELECT A.ENAME Employee,A.EMPNO Emp#,B.ENAME Manager,B.EMPNO Mgr#
FROM EMP A INNER JOIN EMP B
ON (A.MGR=B.EMPNO) OR (A.MGR IS NULL AND B.MGR IS NULL);
 

--6. EMP ���̺��� �׵��� ������ ���� ���� �Ի��� ����� ���Ͽ� �̸�,�Ի���,������ �̸�, ������ �Ի����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM EMP;

SELECT A.ENAME,A.HIREDATE,B.ENAME,B.HIREDATE
FROM EMP A INNER JOIN EMP B
ON A.MGR=B.EMPNO AND A.HIREDATE<B.HIREDATE;

 

--7. EMP ���̺��� ����� �޿��� ����� �޿� �縸ŭ ��*���� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� ��*���� 100�� �ǹ��Ѵ�.
/*
Employee and their salary

-----------------------------------------------------------------

KING      **************************************************

BLAKE     ****************************

CLARK     ************************

JONES     *****************************

MARTIN    ************

ALLEN     ****************

TURNER    ***************

. . . . . . . . . .

14 rows selected.
*/
SELECT ENAME,RPAD(SAL,ROUND(SAL/100),'*') FROM EMP;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[����5]














