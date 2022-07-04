
--kim
----------------------------------------------[07/04]---------------------------------------------

SELECT * FROM tab;

SELECT * FROM PERSONNEL;

/*
SQL (Structured Query Languge : 구조화된 질의 언어)
ANSI 표준 (American National Standards Institute)

1. query
   select data검색어

2. dml(data maipulation language)
    insert, update, delete
    
3. ddl(data difinition language)
    create, alter, drop, rename
    
4. tcl(transaction control language)
    commit, rollback
    
5. dcl(data control language)
    grant, revoke
    권한을 부여할 때: grant 권한 to 
    권한을 박탈할 때: revoke 권한 from
*/

select * from PERSONNEL; --*: 모든 컬럼을 가져와라

select pno, job, pay from PERSONNEL;

select pay,pno,job from PERSONNEL;

select job from PERSONNEL;

select DISTINCT job from PERSONNEL;
--DISTINCT: 중복값 제거

select * from PERSONNEL;

select * from PERSONNEL
ORDER by pay asc; --오름차순

select * from PERSONNEL
order by pay;

select * from PERSONNEL
order by PAY desc; --내림차순
--desc를 생략하면 오름차순이 된다.


--별칭
SELECT PNO,PNAME,PAY,PAY+1000 as 보너스 from PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 보너스 from PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 "보 너 스" from PERSONNEL;
/*모든 컬럼에 별칭을 줄수 있다. 컬럼명 뒤에 이름을 주면 됨. but ,을 쓰면 안된다.*/
/*select문은 연산이 가능함*/
/*pay+1000은 파생 컬럼이다 db안에 들어가있는 것이 아님 이 쿼리 안에서 만들어낸 것임.*/
/*컬럼명 뒤에 as~~~ 하면 별칭으로 만들 수 있음. as는 생략이 가능*/
/*띄어쓰기하는 것은 좋지 않다. 그래도 하고 싶은 경우에는 따옴표로 붙여준다.*/

SELECT pno 번호,pname 이름,pay 월급,pay+1000 보너스 from PERSONNEL;

SELECT PNO,PNAME,PAY,PAY+1000 as 보너스 from PERSONNEL
ORDER BY 보너스;

SELECT PNO,PNAME,PAY,PAY+1000 as 보너스 from PERSONNEL
ORDER BY pay+1000;

SELECT PNO,PNAME,PAY,PAY+1000 as 보너스 from PERSONNEL
ORDER BY 4 DESC;

SELECT * FROM PERSONNEL
ORDER BY 4 DESC;

SELECT dno,pno,pname from PERSONNEL
ORDER BY dno,pno desc; --내림차순은 pno에만 적용된다. dno는 기본값인 오름차순으로 적용된다.


--부서번호는 오름차순, 사원번호는 내림차순 정렬
SELECT * FROM PERSONNEL
ORDER BY dno, pno desc;


--null
SELECT manager from PERSONNEL
ORDER BY manager asc;

SELECT manager from PERSONNEL
ORDER BY manager desc;


--사원의 급여와 연봉을 출력하시오
SELECT pno,pname,pay,pay*12 연봉 FROM PERSONNEL;


--연결 연산자
SELECT pname || pno from PERSONNEL;

SELECT pname || ' ' || pno from PERSONNEL;

SELECT * FROM PERSONNEL;


SELECT pno,pname,pay,nvl(bonus,0),(pay*12)+nvl(BONUS,0) 연봉 FROM PERSONNEL;


--조건절(where)
SELECT * FROM PERSONNEL;

SELECT pno,pname,job FROM PERSONNEL
WHERE job='salesman';

SELECT pno,pname,job FROM PERSONNEL
WHERE job='SALESMAN';


--연산자
--=, >, >=, <, <=, <> --<>:같지않다


--급여가 1600인 사원을 검색
SELECT * FROM PERSONNEL WHERE PAY=1600;

--사원번호가 1116인 사원을 검색
SELECT * FROM PERSONNEL WHERE pno=1116;

--사원급여가 2000 이하인 사원 검색
SELECT * FROM PERSONNEL WHERE pay<=2000;

--90년 12월17일에 입사한 사원 검색
--(날짜는 문자처리 해주어야 한다.)
SELECT * FROM PERSONNEL WHERE STARTDATE='1990-12-17';

--업무가 CLERK인 사원 검색
SELECT * FROM PERSONNEL WHERE job='CLERK';

--이름이 JAMES인 사원 검색
SELECT * FROM PERSONNEL WHERE pname='JAMES';


--논리 연산자
--and, or, NOT(자바에서의 !와 같은 역할)

--AND
--부서번호가 10번이고 급여가 3000이상인 사원
SELECT * FROM PERSONNEL WHERE dno=10 and pay>=3000;

--직업이 SALSEMAN이고 90년 이후에 입사한 직원 검색
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN' AND STARTDATE>'1990/12/31';
--또는 SELECT * FROM PERSONNEL WHERE JOB='SALESMAN' AND STARTDATE>='1991/01/01';

--91년 9월에 입사한 직원을 찾으시오
SELECT * FROM PERSONNEL
WHERE STARTDATE>='1991-09-01' AND STARTDATE<='1991/09/30';


SELECT * FROM NLS_SESSION_PARAMETERS;


--OR
--부서번호가 10번이거나 급여가 3000이상인 사원 검색
SELECT * FROM PERSONNEL
WHERE DNO=10 OR PAY>=3000;

--직업이 MANAGER이거나 90년 이전에 입사한 직원 검색
SELECT * FROM PERSONNEL
WHERE JOB='MANAGER' OR STARTDATE<'90/01/01';


--NOT
--업무가 SALESMAN, CLERK인 직원을 검색
SELECT * FROM PERSONNEL
WHERE JOB='SALESMAN' OR JOB='CLERK';

--업무가 SALESMA, CLERK이 아닌 직원을 검색
SELECT * FROM PERSONNEL
WHERE JOB<>'SALESMAN' AND JOB<>'CLERK';

SELECT * FROM PERSONNEL
WHERE JOB IN('SALESMAN','CLERK');

SELECT * FROM PERSONNEL
WHERE JOB NOT IN('SALESMAN','CLERK');

SELECT * FROM PERSONNEL
WHERE NOT JOB IN('SALESMAN','CLERK');


--문자열 연산자
--BETWEEN A AND B

--급여가 1000에서 2000인 사원
SELECT * FROM PERSONNEL
WHERE PAY>=1000 AND PAY<=2000;

SELECT * FROM PERSONNEL
WHERE PAY BETWEEN 2000 AND 1000; --X

SELECT * FROM PERSONNEL
WHERE STARTDATE BETWEEN '1991-09-01' AND '1991-09-30';

--부서번호가 20과 30 사이가 아닌 사원 검색
SELECT * FROM PERSONNEL
WHERE DNO NOT BETWEEN 20 AND 30; --20~30이 아닌 것

SELECT * FROM PERSONNEL
WHERE DNO NOT IN (20,30); --20,30이 아닌 것


--이름이 A로 시작되는 사원
SELECT * FROM PERSONNEL
WHERE PNAME LIKE 'A%'; --%를 사용하면 =이 아니라 LIKE를 사용해야한다. =을 사용하면 데이터가 나오지 않는다.

--사원번호가 111_로 시작하는 사원A
SELECT * FROM PERSONNEL
WHERE PNO LIKE '111_'; --4자리로 한정

--사원번호가 111%로 시작하는 사원
SELECT * FROM PERSONNEL
WHERE PNO LIKE '111%'; --4자리 이상

--사원번호가 1__1인 사원
SELECT * FROM PERSONNEL
WHERE PNO LIKE '1__1'; --4자리 이면서 가운데 두자리는 어떤것이 와도 상관없다.

--90년도에 입사한 사원
SELECT * FROM PERSONNEL
WHERE STARTDATE LIKE '90%';

SELECT * FROM PERSONNEL
WHERE STARTDATE LIKE '1990%'; --날짜 기본 자릿수가 YY로 두자리이기 때문에, 네자리로 입력하면 데이터가 나오지 않는다.


INSERT INTO PERSONNEL
VALUES(2000,'HELLO_KIM','SALESMAN','1116','2022-07-04',5000,'',20); --새로운 정보 추가

INSERT INTO PERSONNEL 
VALUES(2001,'HELLOAKIM','SALESMAN','1116','2022-07-04',5000,'',20);


--O_K를 포함한 이름 검색
SELECT * FROM PERSONNEL
WHERE PNAME LIKE '%O\_K%' ESCAPE '\';  --여기서는 문자 그대로의 언더바임,문자 그대로라는 것을 표기하기 위해 \를 표기해준다.


--NULL
SELECT * FROM PERSONNEL;
WHERE MANAGER=NULL; --X

SELECT * FROM PERSONNEL;
WHERE MANAGER='NULL'; --X

SELECT * FROM PERSONNEL
WHERE MANAGER IS NULL; --NULL인 데이터 찾기

SELECT * FROM PERSONNEL 
WHERE MANAGER IS NOT NULL; --NULL이 아닌 데이터 찾기


--우선순위: 괄호가 없으면 앞에서부터 우선, 괄호가 있으면 괄호부터 우선

--업무가 MANAGER이고 급여가 1500이상인 사원
--또는 업무가 SALESMAN인 사원 검색
SELECT * FROM PERSONNEL
WHERE JOB='MANAGER' AND PAY>=1500 OR JOB='SALESMAN';

SELECT * FROM PERSONNEL
WHERE JOB='MANAGER' AND (PAY>=1500 OR JOB='SALESMAN'); 

--업무가 PRESIDENT 또는 SALESMAN이고 급여가 1500이상인 사원
SELECT * FROM PERSONNEL
WHERE JOB='PRESIDENT' OR JOB='SALESMAN' AND PAY>=1500;


--HELLO로 시작되는 모든 이름을 지운다.
DELETE FROM PERSONNEL WHERE PNAME LIKE 'HELLO%';
SELECT * FROM PERSONNEL;

 /*
 Ctrl+S로 저장하면 데이터라 파일 안에 저장이 됨(Transaction)
 But Inset, Update, Delete가 들어가면 종료할 때 커밋하라는 명령어가 뜬다. 
 커밋 - 세이브 ,롤백 - 취소
 AutoCommit OFF로 설정되어있기 때문에 물어보는 것임.
 그냥 닫기를 클릭하면 자동으로 롤백이 된다.
 AutoCommit을 자동으로 실행해두면 에러가 난 코드들 까지도 
 커밋을 하기 때문에 하지 않는 것이 좋다.
 */
 
 --[함수]
 
 --[[숫자 함수]]
 --ROUND(반올림함수)
 SELECT ROUND(45.275,1) FROM DUAL;
 /*실제 존재하지 않지만 이 순간에만 연산하는 데이터
 실제로 테이블이 존재하지 않아도 무조건 테이블을 입력해야한다.*/
 
 SELECT ROUND(45.275,1) FROM PERSONNEL;
 /*PERSONNEL 테이블 안에 데이터가 10개가 있기 때문에 
 값이 10개가 출력이 된다.*/
 
 SELECT * FROM DUAL;
 /*DUAL : 실제 존재하지 않은 작업을 처리할 때 쓴다.
 내부적으로 만들어져 있는 것이며 안에 데이터가 하나 들어가 있음.*/
 
 --  1  2  3  4  .  5  6  7 : 숫자
 -- -4 -3 -2 -1  0  1  2  3 : 인덱스 값, 정수는 -로 읽는다.
 
 SELECT ROUND(45.245,1) FROM DUAL; --45.2
 SELECT ROUND(45.245,-1) FROM DUAL; --50 
 SELECT ROUND(45.245,0) FROM DUAL; --45
 SELECT ROUND(45.245,0) FROM DUAL; --45
 SELECT ROUND(45.545) FROM DUAL; --46
 
 --테이블과 연결해서 사용
 SELECT PNO,PNAME,PAY,ROUND(PAY,-2) PAY1 FROM PERSONNEL;
 
 --[TRUNC (절삭)]
 --뒤에 값을 반올림 하지 않고 버림.
 SELECT TRUNC(45.245,2) FROM DUAL; --45.24
 SELECT TRUNC(49.245,-1) FROM DUAL; --40
 
 --테이블과 연결해서 사용
 SELECT PNO,PNAME,PAY,TRUNC(PAY,-2) PAY1 FROM PERSONNEL;
 
 --[CEIL (올림) : 정수만 반환함]
 SELECT CEIL(461.21) FROM DUAL; --462
 
 --[FLOOR (내림) : 정수만 반환함]
 SELECT FLOOR(461.91) FROM DUAL; --461
 
 --[MOD(나머지)] -> JAVA에서는 %로 사용함.
 SELECT MOD(10,3) FROM DUAL;
 
 --[ABS (절대값)] -> 사용빈도가 적다.
 SELECT ABS(-123) FROM DUAL; --123
 
 --[SIGN (연산 결과가 양수일 때는 1, 음수일 때는 -1, 영 : 0을 반환함)]
 SELECT SIGN(100-20),SIGN(100-102),SIGN(100-100) FROM DUAL;
 
 --[지수]
 SELECT POWER(2,4) FROM DUAL;
 
 --[제곱근]
 SELECT SQRT(9) FROM DUAL;
 
 --[[문자함수]]
 
 --[UPPER (소문자 -> 대문자로 변환)]
 SELECT UPPER('Oracle') FROM DUAL;
 
 --[LOWER (대문자 -> 소문자로 변환)]
 SELECT LOWER('Oracle') FROM DUAL;
 
 SELECT * FROM DIVISION WHERE DNAME= UPPER('sales');
 
 SELECT * FROM DIVISION WHERE LOWER(DNAME) = 'sales';
 
 --[INITCAP(문자열의 첫번째 자리를 대문자로 변환)]
 SELECT INITCAP('korea fighting') FROM DUAL;
 
 --[CONCAT(||와 같은 역할)] ->
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

SELECT * FROM POST WHERE DONG LIKE '역삼%'; 

SELECT * FROM POST WHERE DONG LIKE '행복%'; 

SELECT SIDO || ' ' || GUGUN || ' ' || DONG AS JUSO
FROM POST WHERE DONG LIKE '행복%';

--[LENGTH : 문자의 개수]
SELECT LENGTH('KOREA') FROM DUAL;
SELECT LENGTH('KOREA FIGHTING') FROM DUAL;

--[SUBSTR] -> JAVA의 SUBSTRING과 동일
SELECT SUBSTR('ABCDEFG',1,3) FROM DUAL; -- ABC
SELECT SUBSTR('ABCDEFG',3,2) FROM DUAL; -- CD
SELECT SUBSTR('ABCDEFG',-3,2) FROM DUAL; -- EF
SELECT SUBSTR('ABCDEFG',-4) FROM DUAL; -- DEFG

--[INSTR : 인덱스 값 찾기]
SELECT INSTR('ABCDEFG','C') FROM DUAL; -- 3

SELECT INSTR('AAAAAAA','A') FROM DUAL; --1
SELECT INSTR('ABCDEFG','a') FROM DUAL; -- 0
/*JAVA는 0부터 시작하고 없는 값은 -1을 보여주지만
ORACLE은 1부터 시작하고 없는 값은 0으로 출력한다.*/

--[RPAD/LPAD]
--이름 뒤에 15글자가 채워질 때 까지 남는 글자는 *로 표시해라
SELECT RPAD(PNAME,15,'*') FROM PERSONNEL;

--주민번호 941010-2015368를 941010-2******로 바꾸어 출력해라
SELECT RPAD(SUBSTR('941010-2015368',1,8),14,'*') 주민번호 FROM DUAL;

--[RTRIM/LTRIM]
SELECT RTRIM('ABBBBBB','B') FROM DUAL; --(오른쪽)B를 삭제해라
SELECT RTRIM('A      ',' ') FROM DUAL; --(오른쪽)공백을 삭제해라

SELECT LTRIM('BBBABB','B') FROM DUAL; --ABB (왼쪽)B를 삭제해라

--[[날짜함수]]

--[SYSDATE]
SELECT SYSDATE FROM DUAL; -- 현재 날짜와 시간을 읽어줌

SELECT SYSDATE-1,SYSDATE,SYSDATE+1 FROM DUAL; --날짜도 연산이 가능함.
--SYSDATE-1 : 어제,SYSDATE : 오늘,SYSDATE+1 : 내일

--KIM사원이 현재까지 근무한 년수를 구하시오.
SELECT STARTDATE,SYSDATE, ROUND((SYSDATE-STARTDATE)/365) || '년'
년수 FROM PERSONNEL WHERE PNAME = 'KIM';

/*날짜는 6월 30일을 기준으로 반올림한다.*/
--날짜의 ROUND
SELECT STARTDATE, ROUND(STARTDATE, 'YEAR') FROM PERSONNEL;
SELECT STARTDATE, ROUND(STARTDATE, 'MONTH') FROM PERSONNEL;

--날짜의 TRUNC 
SELECT STARTDATE, TRUNC(STARTDATE, 'YEAR') FROM PERSONNEL;
SELECT STARTDATE, TRUNC(STARTDATE, 'MONTH') FROM PERSONNEL;

--MONTHS_BETWEEN(달의 수 구하기)
SELECT TRUNC((MONTHS_BETWEEN(SYSDATE,'2002/06/01'))/12) DAL FROM DUAL;

--LAST_DAY(달의 말일 구하기)
SELECT STARTDATE,LAST_DAY(STARTDATE) FROM PERSONNEL;

--NEXT_DAY(돌아오는 날 구하기)
SELECT NEXT_DAY(SYSDATE,'금요일') FROM DUAL;

--ADD_MONTHS(개월 추가)
SELECT ADD_MONTHS(SYSDATE, 24) FROM DUAL;
