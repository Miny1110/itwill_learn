--SCOTT
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







