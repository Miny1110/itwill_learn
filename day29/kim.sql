
--kim
-------------------------------------------------------------------------------------------

SELECT * FROM tab;

SELECT * FROM PERSONNEL;
-- '*'의 뜻 : PERSONNEL로 부터 모든 COLUMN을 가져와라

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


-------------------------------------------------------------------------------------------


--별칭
SELECT PNO,PNAME,PAY,PAY+1000 as 보너스 from PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 보너스 from PERSONNEL;
SELECT PNO,PNAME,PAY,PAY+1000 "보 너 스" from PERSONNEL;
/*모든 컬럼에 별칭을 줄수 있다. 컬럼명 뒤에 이름을 주면 됨. but 콤마는 쓰면 안된다.
select문은 연산이 가능하다.
pay+1000은 파생 컬럼이다. db안에 들어가있는 것이 아님 이 쿼리 안에서 만들어낸 것임.
컬럼명 뒤에 as~~~ 하면 별칭으로 만들 수 있음. as는 생략이 가능
띄어쓰기하는 것은 좋지 않다. 그래도 하고 싶은 경우에는 따옴표로 붙여준다.*/

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
ORDER BY dno,pno desc;
--내림차순은 pno에만 적용된다. dno는 기본값인 오름차순으로 적용된다.
--DNO를 기준으로 오름차순 정렬을 먼저 한 후에, PNO를 기준으로 내림차순 정렬한다.


--부서번호는 오름차순, 사원번호는 내림차순 정렬
SELECT * FROM PERSONNEL
ORDER BY dno, pno desc;


-------------------------------------------------------------------------------------------

--null
--정렬할 때 가장 큰 값으로 취급된다. 
SELECT manager from PERSONNEL
ORDER BY manager asc;
--오름차순일 때 맨 아래에 위치한다.

SELECT manager from PERSONNEL
ORDER BY manager desc;
--내림차순일 때 맨 위에 위치한다.


--사원의 급여와 연봉을 출력하시오
SELECT pno,pname,pay,pay*12 연봉 FROM PERSONNEL;


-------------------------------------------------------------------------------------------


--연결 연산자
SELECT pname || pno from PERSONNEL;

SELECT pname || ' ' || pno from PERSONNEL;

SELECT * FROM PERSONNEL;
--빈칸은 Null, 0은 보너스가 없는 것이다. Null과 0은 엄연히 다른 것임.

SELECT Pno, Pname, Pay, Bonus, (Pay*12)+Bonus 연봉 FROM PERSONNEL;
--Null과 연산자가 만나면 값이 Null이 됨

SELECT pno,pname,pay,nvl(bonus,0),(pay*12)+nvl(BONUS,0) 연봉 FROM PERSONNEL;
--Nvl은 데이터가 있으면 그대로 표현해주고 값이 Null이면 0으로 표시해준다.
--데이터 타입이 넘버이기 때문에 숫자로 출력됨. 문자는 XID


-------------------------------------------------------------------------------------------


--조건절(where)
SELECT * FROM PERSONNEL;

SELECT pno,pname,job FROM PERSONNEL
WHERE job='salesman';

SELECT pno,pname,job FROM PERSONNEL
WHERE job='SALESMAN';

--SELECT 뒤의 컬럼명은 열제한, WHERE 조건문은 행제한이다.
--데이터값은 대소문자를 구분해야 한다.

-------------------------------------------------------------------------------------------


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
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990-12-17';
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990/12/17';
--날짜는 두 가지 방법 다 사용이 가능하다.

--업무가 CLERK인 사원 검색
SELECT * FROM PERSONNEL WHERE job='CLERK';

--이름이 JAMES인 사원 검색
SELECT * FROM PERSONNEL WHERE pname='JAMES';


-------------------------------------------------------------------------------------------


--논리 연산자
--and, or, NOT(자바에서의 !와 같은 역할)

--AND
--부서번호가 10번이고 급여가 3000이상인 사원
SELECT * FROM PERSONNEL WHERE dno=10 and pay>=3000;

--직업이 SALSEMAN이고 90년 이후에 입사한 직원 검색
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN' AND STARTDATE>'1990/12/31';
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN' AND STARTDATE>='1991/01/01';

--91년 9월에 입사한 직원을 찾으시오
SELECT * FROM PERSONNEL
WHERE STARTDATE>='1991-09-01' AND STARTDATE<='1991/09/30';


SELECT * FROM NLS_SESSION_PARAMETERS;
--오라클에 접속되었을 때 세팅되는 정보
--각 회사마다 서식이 다르기 때문에 알고 싶을 때는 이 명령어로 검색


--OR
--부서번호가 10번이거나 급여가 3000이상인 사원 검색
SELECT * FROM PERSONNEL
WHERE DNO=10 OR PAY>=3000;

--직업이 MANAGER이거나 90년 이전에 입사한 직원 검색
SELECT * FROM PERSONNEL
WHERE JOB='MANAGER' OR STARTDATE<'90/01/01';

--업무가 SALESMAN, CLERK인 직원을 검색
SELECT * FROM PERSONNEL
WHERE JOB='SALESMAN' OR JOB='CLERK';

SELECT * FROM PERSONNEL
WHERE JOB IN('SALESMAN', 'CLERK');

/*실제로는 In을 사용하지만 빠르기는 Or연산자가 더 빠름
In은 Or에 비해 느리지만 데이터 값이 많을 때는 
하나하나 입력하기 어렵기 때문에 사용 빈도가 더 높다.*/


--NOT
--업무가 SALESMAN, CLERK이 아닌 직원을 검색
SELECT * FROM PERSONNEL
WHERE JOB<>'SALESMAN' AND JOB<>'CLERK';
--양쪽이 부정이면 AND 연산자를 사용한다.

SELECT * FROM PERSONNEL
WHERE JOB NOT IN('SALESMAN','CLERK');

SELECT * FROM PERSONNEL
WHERE NOT JOB IN('SALESMAN','CLERK');

--Not의 위치는 컬럼명 앞 Or 뒤 어디에 위치하던 상관없다.


-------------------------------------------------------------------------------------------


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
WHERE PNAME LIKE 'A%';
--%는 JAVA에서의 *과 비슷한 역할
--%를 사용하면 =이 아니라 LIKE를 사용해야한다. =을 사용하면 데이터가 나오지 않는다.

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
WHERE STARTDATE LIKE '1990%';
--날짜 기본 자릿수가 YY로 두자리이기 때문에, 네자리로 입력하면 데이터가 나오지 않는다.


INSERT INTO PERSONNEL
VALUES(2000,'HELLO_KIM','SALESMAN','1116','2022-07-04',5000,'',20);
INSERT INTO PERSONNEL 
VALUES(2001,'HELLOAKIM','SALESMAN','1116','2022-07-04',5000,'',20);
--새로운 정보 추가
--한번 이상 실행하면 에러 발생


-------------------------------------------------------------------------------------------


--O_K를 포함한 이름 검색
SELECT * FROM PERSONNEL WHERE PNAME LIKE '%O_K%';

SELECT * FROM PERSONNEL
WHERE PNAME LIKE '%O\_K%' ESCAPE '\';
--여기서는 문자 그대로의 언더바임,문자 그대로라는 것을 표기하기 위해 \를 표기해준다.
--ESCAPE는 값을 뺀다는 의미이다.


-------------------------------------------------------------------------------------------


--NULL
SELECT * FROM PERSONNEL;
WHERE MANAGER=NULL; --실행X

SELECT * FROM PERSONNEL;
WHERE MANAGER='NULL'; --실행X, 문법은 맞지만 NULL이라는 문자가 입력되지는 않았기 때문이다.

SELECT * FROM PERSONNEL
WHERE MANAGER IS NULL; --NULL인 데이터 찾기

SELECT * FROM PERSONNEL 
WHERE MANAGER IS NOT NULL; --NULL이 아닌 데이터 찾기


-------------------------------------------------------------------------------------------


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


-------------------------------------------------------------------------------------------


--데이터 지우기
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
 
 
-------------------------------------------------------------------------------------------


--[[숫자 함수]]
--ROUND(반올림함수)
SELECT ROUND(45.275,1) FROM DUAL;
--실제 존재하지 않지만 이 순간에만 연산하는 데이터
--실제로 테이블이 존재하지 않아도 무조건 테이블을 입력해야한다.

SELECT ROUND(45.275,1) FROM PERSONNEL;
--PERSONNEL 테이블 안에 데이터가 10개가 있기 때문에, 값이 10개가 출력이 된다.

SELECT * FROM DUAL;
--DUAL : 실제 존재하지 않은 작업을 처리할 때 쓴다. 내부적으로 만들어져 있는 것이며 안에 데이터가 하나 들어가 있음.
 
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
 
 
 -------------------------------------------------------------------------------------------
 
 
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

SELECT LTRIM('BBBABB','B') FROM DUAL; --ABB (왼쪽)B를 삭제해라. A를 만나면 멈춘다.


-------------------------------------------------------------------------------------------


--[[날짜함수]]

--[SYSDATE]
SELECT SYSDATE FROM DUAL; -- 현재 날짜와 시간을 읽어줌

SELECT SYSDATE-1,SYSDATE,SYSDATE+1 FROM DUAL; --날짜도 연산이 가능함.
--SYSDATE-1 : 어제,SYSDATE : 오늘,SYSDATE+1 : 내일

--KIM사원이 현재까지 근무한 년수를 구하시오.
SELECT STARTDATE,SYSDATE, ROUND((SYSDATE-STARTDATE)/365) || '년'
년수 FROM PERSONNEL WHERE PNAME = 'KIM';

--날짜의 ROUND
SELECT STARTDATE, ROUND(STARTDATE, 'YEAR') FROM PERSONNEL; --6월30일을 기준으로 반올림
SELECT STARTDATE, ROUND(STARTDATE, 'MONTH') FROM PERSONNEL; --16일을 기준으로 반올림

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


-------------------------------------------------------------------------------------------


--변환함수
--TO_CHAR (문자로 바꿔주는 기능)
/*
MM : 달(10)
MON : 3문자 달 이름(MAR)
MONTH : 풀네임(MARCH)
DD : 일의 날짜수(22)
D : 주의 일수(2)
DY : 3문자의 요일(MON)
DAY : 풀네임(MONDAY)
RM : 로마식 달수
YYYY : 2022
*/

SELECT SYSDATE,TO_CHAR(SYSDATE,'D') FROM DUAL; --4
SELECT SYSDATE,TO_CHAR(SYSDATE,'DY') FROM DUAL; --수
SELECT SYSDATE,TO_CHAR(SYSDATE,'DAY') FROM DUAL; --수요일
SELECT SYSDATE,TO_CHAR(SYSDATE,'RM') FROM DUAL; --VII
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY') FROM DUAL; --2022
SELECT SYSDATE,TO_CHAR(SYSDATE,'DD') FROM DUAL; --06
SELECT SYSDATE,TO_CHAR(SYSDATE,'YY-MM-DD') FROM DUAL; --22-07-06

SELECT SYSDATE,TO_CHAR(SYSDATE,'HH24:MI:SS') FROM DUAL; --17:52:12
SELECT SYSDATE,TO_CHAR(SYSDATE,'AM HH24:MI:SS') FROM DUAL; --오후 17:52:17
--AM/PM은 오전/오후를 나타내겠다는 의미이다. PM을 입력했더라도 현재 시간이 오전이면 오전으로 출력된다.

SELECT TO_CHAR(12506,'99,999') FROM DUAL; --12,506
SELECT TO_CHAR(12506,'099,999') FROM DUAL; --012,506
--숫자가 6자리가 안되면 앞에 0을 채운다. (자리값을 맞추기 위해서)
SELECT TO_CHAR(12506,'9,999') FROM DUAL; --######
--숫자보다 자리값이 모자라면 #으로 표시된다.
SELECT TO_CHAR(12506.99,'99,999.99') FROM DUAL; --12,506.99
--이렇게 표시한 숫자는 TO_CHAR로 인해 문자가 되었기 때문에 연산되지 않는다.

SELECT SYSDATE,TO_CHAR(SYSDATE,'DD') FROM DUAL; --05
SELECT SYSDATE,TO_CHAR(SYSDATE,'DDSP') FROM DUAL; --FIVE
SELECT SYSDATE,TO_CHAR(SYSDATE,'DDTH') FROM DUAL; --05TH
SELECT SYSDATE,TO_CHAR(SYSDATE,'DDSPTH') FROM DUAL; --FIFTH

--TO_DATE
SELECT TO_DATE('22-07-06','YY-MM-DD')+1 FROM DUAL; --2022-07-07 00:00:00
--문자가 날짜로 바뀐다. 날짜로 바뀌었기 때문에 연산이 가능해진다.
SELECT TO_DATE('11:05','HH24:MI') FROM DUAL; --2022-07-01 11:05:00
--날짜를 쓰지 않고 시간만 쓰면 이 달의 첫날로 출력된다. 

--TO_NUMBER
--JAVA의 INTEGER.PARSEINT와 비슷


--문자는 어떠한 방법으로도 숫자로 바꿀 수 없다.

--NVL
SELECT BONUS,NVL(BONUS,0) FROM PERSONNEL;
SELECT MANAGER FROM PERSONNEL;
SELECT MANAGER,NVL(TO_CHAR(MANAGER),'NON MANAGER') FROM PERSONNEL;
--MANAGER 컬럼은 원래 숫자타입이다. 그래서 널값에 문자값이 들어갈 수 없다. 그래서 MANAGER 컬럼을 TO_CHAR 함수를 통해 문자로 바꾼다. 그리고 문자데이터를 넣어준다.


-------------------------------------------------------------------------------------------


--DECODE(=IF)
--DECODE는 비교연산자를 사용할 수 없다. (부등호 사용이 불가해서 SIGN함수로 비교하는 것이다)
--각 사원의 급여를 부서가 10인 경우 10%, 부서가 20인 경우 20%, 나머지는 30%를 인상해서 출력
SELECT PNAME,BONUS,DNO,PAY,
DECODE(DNO,10,PAY*1.1,20,PAY*1.2,PAY*1.3) 인상분
FROM PERSONNEL;

--급여가 3500이상인 경우에는 'GOOD', 미만인 경우에는 'POOR'를 출력
SELECT PNAME,BONUS,DNO,PAY,
DECODE(SIGN(PAY-3500),-1,'POOR','GOOD') GRADE
FROM PERSONNEL;

SELECT PNAME,BONUS,DNO,PAY,
DECODE(SIGN(PAY-3500),1,'GOOD','POOR') GRADE
FROM PERSONNEL;


-------------------------------------------------------------------------------------------


--그룹함수
--COUNT: 개수를 센다. 널값은 세지 않는다.
--데이터의 개수 값만 표현한다. 때문에 출력 결과는 데이터의 개수 하나만 나온다.
SELECT COUNT(*) FROM PERSONNEL;
SELECT COUNT(MANAGER) FROM PERSONNEL;
SELECT COUNT(BONUS) FROM PERSONNEL;

--급여가 3000이상인 사원수
SELECT COUNT(*) FROM PERSONNEL
WHERE PAY>=3000;

--AVG
SELECT AVG(PAY) FROM PERSONNEL;

--BONUS의 평균 구하기
SELECT AVG(BONUS) FROM PERSONNEL;
--전체인원은 10이고 보너스 있는 인원은 3명이다. 이렇게 하면 3명의 보너스 값을 3으로 나눈 값이 출력된다.
--널값을 연산 과정에 추가하지 않는다.
SELECT AVG(NVL(BONUS,0)) FROM PERSONNEL;
--널값을 0으로 바꾼 후에 연산을 진행하면, 널값을 포함해서 연산을 진행한다.
--보너스의 합을 전체인원인 10으로 나눈 평균값이 출력된다.

--SUM
SELECT SUM(PAY) FROM PERSONNEL;

--MAX/MIN
SELECT MAX(PAY),MIN(PAY) FROM PERSONNEL;

--입사한지 가장 오래된 사원
SELECT MIN(STARTDATE) FROM PERSONNEL;

--입사한지 가장 오래된 사원과 신입사원과의 연차
SELECT ROUND((MAX(STARTDATE)-MIN(STARTDATE))/365) 년차 FROM PERSONNEL;


-------------------------------------------------------------------------------------------


--분석함수

--부서별 평균 구하기
SELECT * FROM PERSONNEL
ORDER BY DNO;

SELECT DISTINCT DNO,AVG(PAY) OVER (PARTITION BY DNO) D_AVG --OVER는 AVG를 수식. 부서별로 나눠서(PARTITION BY) 평균 구하기
FROM PERSONNEL
ORDER BY DNO;


--월급 순위
SELECT PNAME,PAY,RANK() OVER (ORDER BY PAY DESC) RANK FROM PERSONNEL;
--PAY로 정렬해서 RANK에 값을 덮어써라

--1200을 받는 사원의 순위
SELECT RANK(1200) WITHIN GROUP (ORDER BY PAY DESC) RANK FROM PERSONNEL;

SELECT COUNT(*) FROM PERSONNEL; --단일값을 반환
SELECT PNAME FROM PERSONNEL; --다중값을 반환
SELECT PNAME FROM PERSONNEL WHERE PAY=1600; --조건에 해당하는 데이터가 여러개였다면 다중값을 반환했을 것이다.

SELECT PNAME,MIN(STARTDATE) FROM PERSONNEL;
--PNAME은 다중값 반환, MIN은 단일값 반환이기 때문에 에러가 발생한다.


--다중값, 단일값을 같이 사용할 수 있게 하는 방법(하위쿼리)
--SELECT문 안에 또 다른 SELECT문이 있음.
SELECT PNO,PNAME,STARTDATE FROM PERSONNEL
WHERE STARTDATE=(SELECT MIN(STARTDATE) FROM PERSONNEL); --하위쿼리
 
--부서별 평균 급여를 구하시오
SELECT DNO,AVG(PAY) FROM PERSONNEL; --DNO는 여러개가 나오고 AVG는 하나가 나오기때문에 에러가 발생한다.

SELECT DNO,AVG(PAY) FROM PERSONNEL
GROUP BY DNO; --그래서 부서별로 그룹을 묶어서 출력하게 한다.

--직업별 평균급여, 인원수를 구하시오
SELECT JOB 직업,ROUND(AVG(PAY)) 평균급여,COUNT(*) 인원수 FROM PERSONNEL
GROUP BY JOB;

--각 부서의 평균급여가 전체평균급여보다 크면 'GOOD', 작으면 'POOR'를 출력
SELECT ROUND(AVG(PAY)) FROM PERSONNEL; --2973 : 전체평균

SELECT DNO,AVG(PAY)
DECODE(SIGN(ROUND(AVG(PAY)-AVG(SELECT DNO,AVG(PAY) FROM PERSONNEL GROUP BY DNO)),-1,'POOR','GOOD')
FROM PERSONNEL;

SELECT DNO,AVG(PAY),
DECODE(SIGN(AVG(PAY)-(SELECT ROUND(AVG(PAY)) FROM PERSONNEL)),-1,'POOR','GOOD') GRADE
FROM PERSONNEL
GROUP BY DNO
ORDER BY DNO ASC;
--부서평균에서 전체평균 빼기. 셀렉트문에서 셀렉트문을 뺄 수 있다.
--바깥 SELECT문의 AVG는 GROUP BY DNO로 묶인 부서별 평균
--안쪽 SELECT문은 전체 평균


--HAVING : GROUP BY의 조건문
--각 부서별 평균급여가 3000이상인 값을 출력하시오.
SELECT DNO,AVG(PAY) FROM PERSONNEL
GROUP BY DNO;
HAVING AVG(PAY) > 3000;

SELECT DNO,AVG(PAY) D_AVG FROM PERSONNEL
GROUP BY DNO;
HAVING D_AVG > 3000;
--별칭을 쓸 수 없다. 에러 발생
--ORDER BY 외에는 별칭을 사용할 수 없기 때문에 실제 데이터에 있는 값을 사용해야한다.

SELECT * FROM PERSONNEL;

--부서인원이 2명보다 많은 부서의 부서번호, 급여의 합을 구하시오
SELECT DNO,COUNT(*) CNT,SUM(PAY) SUM FROM PERSONNEL
GROUP BY DNO
HAVING COUNT(*) > 2;


-------------------------------------------------------------------------------------------


--[JOIN문]
--그동안은 하나의 테이블에서 SELECT를 함
--이제는 하나 이상의 테이블에서 SELECT
--많으면 3개 대부분 2개의 테이블에서 내가 원하는 컬럼의 값을 가져옴
--하나의 테이블을 두개로 복사해서 값을 비교하는 것은 JOIN문에서만 해당된다.
/*
JOIN문의 종류
EQUITE JOIN(INNER JOIN) -> 사용빈도가 가장 높다.
NON-EQUITE JOIN
OUTER JOIN
CROSS JOIN
SELF JOIN
*/


-------------------------------------------------------------------------------------------

SELECT * FROM PERSONNEL;
--[SELF JOIN]
--SELF JOIN을 만들기 위한 구조가 만들어져있어야 출력이 가능함
--가장 전형적인 SELF JOIN의 예제이다.
SELECT A.PNO 사번, A.PNAME 직원, B.PNO 사번, B.PNAME 관리자
FROM PERSONNEL A, PERSONNEL B 
WHERE A.MANAGER = B.PNO;
--BILL은 PRESIDENT


--NON-EQUIE JOIN
--EQUITE JOIN이 같지 않다. 이것 역시 NON-EQUITE JOIN을 만들기 위한 구조가 만들어져있어야 출력이 가능하다.
SELECT * FROM PERSONNEL;
SELECT * FROM PAYGRADE;
SELECT * FROM TAB;

SELECT PNAME,PAY,B.GRADE
FROM PERSONNEL A, PAYGRADE B
WHERE PAY BETWEEN LOWPAY AND HIGHPAY;

SELECT * FROM PERSONNEL;


-------------------------------------------------------------------------------------------


--OPERATOR
-- JOIN문은 아니지만 JOIN을 할 때 나온다.
-- 두개의 테이블에서 데이터를 가져오는 것임.
-- UNION이 사용빈도가 제일 높다.

--A=[1,2,5,6]
--B=[1,2,4]

--A UNION ALL B = [1,2,3,4,6,1,2,4]
--A UNION B = [1,2,4,5,6]
--A MINUS B = [5,6] 빼기
--A INTERSECT B = [1,2] 교집합


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
--빼기 : 40

--INTERSECT
SELECT DNO FROM DIVISION --10 20 30 40
INTERSECT
SELECT DNO FROM PERSONNEL; --10 20 30
--교집합 : 10 20 30


-------------------------------------------------------------------------------------------
--[07/06]

--SUBQUERY (하위쿼리)
--쿼리 안에 쿼리가 들어가 있는 것

SELECT * FROM TAB;

CREATE TABLE MANAGER
AS 
	SELECT * FROM PERSONNEL
	WHERE 1=2;

CREATE TABLE SALESMAN
AS 
	SELECT * FROM PERSONNEL
	WHERE 1=2;
--테이블의 틀만 복사하고 싶으면 WHERE에 거짓 조건을 넣으면 된다. 예를 들면 WHERE 1=2와 같은 말도 안되는 조건.
--이런 조건에 부합하는 데이터는 당연히 없을테니, 데이터는 하나도 없고 테이블 틀만 복사된다.

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
--컬럼의 개수와 넣으려는 데이터 개수를 맞춰서 입력한다.

DESC DIVISION;
COMMIT;

INSERT INTO DIVISION VALUES(60); --실행오류. 60이라는 데이터를 어느 컬럼에 넣어야할 지 모르기 때문이다.
INSERT INTO DIVISION(DNO) VALUES(60);

INSERT INTO DIVISION (DNAME,POSITION) VALUES ('ACCOUNT','DAEJUN');
--실행오류
--왜냐하면 DESC DIVISION; 를 실행하면 DNO에는 널값이 들어갈 수 없다고 되어있다.
--NOT NULL이라고 되어있는 곳에는 반드시 데이터가 들어가야 한다.
INSERT INTO DIVISION (DNO,DNAME,POSITION) VALUES (70,'ACCOUNT','DAEJUN');


DESC PERSONNEL;

INSERT INTO PERSONNEL (PNO,PNAME,PAY,DNO)
VALUES (7711,'YOUNG',4000,20);

SELECT * FROM PERSONNEL;

--명시적 널 삽입
INSERT INTO DIVISION VALUES(80,'PLANNING','010-123-1234',NULL);
INSERT INTO DIVISION VALUES(90,'SERVICE','010-222-3333','');
--널값 넣는 방법. 둘 중 하나 사용하면 된다.

SELECT * FROM DIVISION;
DESC PERSONNEL;

INSERT INTO PERSONNEL(PNO,PNAME,JOB,STARTDATE,DNO)
VALUES (1304,'SUZI','SINGER',SYSDATE,10);


-------------------------------------------------------------------------------------------


--치환변수
SELECT PNO,PNAME,JOB,STARTDATE,DNO
FROM PERSONNEL
WHERE DNO=&D_NO;
--여기서는 실행이 안된다. CMD창에서는 실행 가능하다 &D_NO 부분에 사용자가 변수를 입력할 수 있다.

SELECT * FROM BUSEO;


-------------------------------------------------------------------------------------------


--SUBQUERY를 사용해서 INSERT
SELECT * FROM MANAGER;

SELECT * FROM PERSONNEL
WHERE JOB='MANAGER';

INSERT INTO MANAGER(PNO,PNAME,PAY,STARTDATE)
SELECT PNO,PNAME,PAY,STARTDATE 
FROM PERSONNEL
WHERE JOB='MANAGER';
--원하는 컬럼만 넣는다.


--업무가 SALESMAN인 사원의 모든 정보를 SALESMAN 테이블로 복사
SELECT * FROM SALESMAN;

SELECT * FROM PERSONNEL
WHERE JOB='SALESMAN';

INSERT INTO SALESMAN
SELECT * FROM PERSONNEL WHERE JOB='SALESMAN';
--이미 만들어져 있는 테이블에 데이터를 넣는 것이기 때문에 CREATE와 달리 AS가 필요하지 않다.


-------------------------------------------------------------------------------------------


--UPDATE (수정)
SELECT * FROM PERSONNEL WHERE PNO='1111';

--UPDATE, DELETE는 WHERE 조건절이 필수. 조건을 적지 않으면 모든 데이터가 수정되기 때문이다.
UPDATE PERSONNEL SET DNO=30 WHERE PNO='1111';

UPDATE PERSONNEL SET PNAME='INNA',MANAGER=1004,STARTDATE=SYSDATE,PAY=8000
WHERE PNO='1111';

SELECT PNO,PNAME,TO_CHAR(STARTDATE,'YYYY-MM-DD') STARTDATE 
FROM PERSONNEL WHERE PNO='1111';

SELECT * FROM SAWON;

UPDATE SAWON SET DNO=20;

ROLLBACK;
--COMMIT전에 롤백 해야한다. 커밋 후에 롤백은 아무 소용 없다.
--INSERT,UPDATE,DELETE했을 때만 롤백이 가능하다.


-------------------------------------------------------------------------------------------


--SUBQUERY로 UPDATE
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
--오라클에서는 실행 안된다.

/*
SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');를
JOIN문으로 바꿔보기 */

SELECT A.*
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES';
--JOIN문이기 때문에 FROM ~~~ WHERE조건절 둘 다 값이 변경되면 안된다.

UPDATE PERSONNEL SET JOB='SALESMAN'
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES';
--오라클은 업데이트를 조인문으로 변경할 수 없다. 시퀄서버에서는 가능함

ROLLBACK;


-------------------------------------------------------------------------------------------


--DELETE
--삭제나 수정은 반드시 중복되는 값이 없는 데이터로 작업해야 한다.
SELECT * FROM PERSONNEL WHERE PNO=1111;
DELETE FROM PERSONNEL WHERE PNO=1111;
--FROM은 생략 가능

SELECT * FROM PERSONNEL WHERE PNO=1112;
DELETE PERSONNEL WHERE PNO=1112;


--SUBQUERY로 삭제
SELECT * FROM DIVISION;

SELECT * FROM PERSONNEL
WHERE DNO=(SELECT DNO FROM DIVISION WHERE DNAME='FINANCE');

DELETE PERSONNEL
WHERE DNO=(SELECT DNO FROM DIVISION WHERE DNAME='FINANCE');


-------------------------------------------------------------------------------------------


--INSERT ERROR
SELECT * FROM PERSONNEL;

INSERT INTO PERSONNEL (PNO,PNAME,DNO) VALUES (1113,'INNA',51);
--유일값 제약조건에 위배되어 값이 오류가 난다.

SELECT * FROM USER_CONSTRAINTS;
--제약조건을 보는 명령어


--UPDATE ERROR
SELECT * FROM DIVISION;
SELECT * FROM PERSONNEL;
/*
DIVISION을 참조하여 만들었기 때문에 DIVISION에 있는 DNO만 PERSONNEL에 들어갈 수 있다.
SELECT * FROM USER_CONSTRAINTS를 실행하면 DIVISION_DNO_PK라고 써져있는 것을 볼 수 있다.
PERSONNEL 테이블이 DIVISION 테이블을 참조하고 있다는 것이다.
DIVISION:부모, PERSONNEL이 자식이라고 보면 됨 
*/

UPDATE PERSONNEL SET DNO=51
WHERE DNO=20;
/*
부서번호 20번을 51번으로 바꿀것이다.
실행하면 DIVISION에 가서 DNO값을 찾아본다.
DIVISION에 51이 없기 때문에 이 수식은 오류가 난다.
따라서 참조관계에서 데이터를 수정하려면, 수정하려는 새로운 값이 부모테이블에 있는 값이어야 한다.
*/


--DELETE ERROR
DELETE DIVISION WHERE DNO=20;
DELETE DIVISION WHERE DNO=50;
--자식이 사용하고 있으면 삭제 불가, 사용하지 않으면 삭제 가능

commit;


-------------------------------------------------------------------------------------------


--TRANSACTION

--AUTO COMMIT
--DDL(CREATE, ALTER, DROP, RENAME)
--DCL(GRANT, REVOKE)
--비정상적인 종료시 (ROLLBACK)


--DDL(CREATE, ALTER, DROP)
--OBJECT를 만들 때 사용한다.
--ALTER : CREATE로 만든 것을 수정할 때
--DROP : CREATE로 만든 것을 삭제할 때

--OBJECT(TABLE,INDEX,SYNONYM,SEQUENCE,VIEW)

--TABLE
--DATA TYPE
--CHAR : 문자 저장(고정길이)
--VARCHAR : 문자(가변길이)
--NUMBER(P,S): 숫자(가변길이) - P(전체 자릿수) S(소수점) 
--DATE : 날짜, 시간(고정길이)
--LONG : 문자(가변길이 2GB) - 잘 안씀

CREATE TABLE BUSEO1
(DNO NUMBER(2), --DNO에 두 자리 숫자가 들어간다.
DNAME VARCHAR(14),
ZIPCODE CHAR(7));

DESC BUSEO1;
INSERT INTO BUSEO1 VALUES(10,'AAA','123-123');
SELECT * FROM BUSEO1;

/*
테이블이름

영문자로 시작
특수문자는 (_,$,#)만 사용 가능하며 첫 글자에는 사용할 수 없다.
테이블 이름 중복허용 안됨
컬럼명과 달라야함
예약어 사용 불가 (예약어: INSERT, SELECT 등) -> 오라클의 쿼리 이름과 중복 불가

SAWON, P_NO, DIV10 : 사용가능
10DIV, $SAL, ALTER : 사용불가
*/

CREATE TABLE CUS_INFO
(ID CHAR(5) PRIMARY KEY, --아이디의 값이 절대 중복되지 않기를 원하는 경우
NAME CHAR(10),
JUMIN CHAR(14),
AGE NUMBER(3),
ADDR VARCHAR(100));

DESC CUSINFO;

INSERT INTO CUSINFO VALUES ('A100','SUZI','123456-1234567',27,'서울');

SELECT * FROM CUSINFO;

SELECT * FROM USER_CONSTRAINTS;

SELECT STARTDATE FROM PERSONNEL;

SELECT STARTDATE,
EXTRACT(YEAR FROM STARTDATE) YEAR, --년도만 추출
EXTRACT(MONTH FROM STARTDATE) MONTH, --달만 추출
EXTRACT(DAY FROM STARTDATE) DAY --일만 추출
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


--PERSONNEL 테이블에서 업무가 MANAGER인 사원의 모든 내용을 질의하여 새로운 테이블인 MANAGER1을 생성

CREATE TABLE MANAGER1
AS
SELECT * FROM PERSONNEL
WHERE JOB='MANAGER';

SELECT * FROM MANAGER1;


--PAY가 3000이상인 직원의 데이터를 가진 PAY3000 테이블 생성
CREATE TABLE PAY3000
AS 
SELECT * FROM PERSONNEL
WHERE PAY>=3000;

SELECT * FROM PAY3000;


--PERSONNEL 테이블에서 12월달에 입사한 직원들의 데이터를 MON12라는 테이블로 복사
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
WHERE TO_CHAR(STARTDATE,'MM')=04; --4로 입력해도 된다. 하지만 04로 입력하는 것이 좀 더 바람직하다.


CREATE TABLE ANALYST(NUM,NAME,JOB,DNUM) --새로운 테이블의 컬럼명을 내가 원하는 것으로 바꾼다.
AS
SELECT PNO,PNAME,JOB,DNO FROM PERSONNEL
WHERE JOB='ANALYST';

SELECT * FROM ANALYST;


--부서번호가 10인 부서의 총 급여의 정보를 DIV10 테이블을 만드시오
CREATE TABLE DIV10
AS
SELECT DNO,SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO
HAVING DNO=10;

SELECT * FROM DIV10;

/* 위아래 결과 같음
SELECT DNO,SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO
HAVING DNO=10;

SELECT DNO,SUM(PAY) FROM PERSONNEL
WHERE DNO=10
GROUP BY DNO;
*/


-------------------------------------------------------------------------------------------


--테이블 구조 복사

SELECT * FROM PERSONNEL;

CREATE TABLE SAWON1
AS
SELECT * FROM PERSONNEL
WHERE 0=1;

SELECT * FROM SAWON1;

DESC PERSONNEL; --NOT NULL 있음
DESC SAWON1; --NOT NULL 없음
--제약조건은 복사되지 않는다.


-------------------------------------------------------------------------------------------


--테이블 수정
SELECT * FROM SALESMAN1;

DESC SALESMAN1;


--ADD(컬럼 추가)
ALTER TABLE SALESMAN1
ADD (DNO NUMBER(2));
--컬럼을 하나만 추가할 때에는 괄호를 생략해도 된다. 하지만 컬럼이 두개 이상일 경우에는 반드시 괄호로 묶어주어야 한다.
--DNO: 추가 컬럼 / NUMBER(2): 추가하려는 컬럼의 데이터 타입

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
--MS-SQL에서는 (ID,NAME)을 적어주지 않아도 자동으로 데이터가 들어간다.
--하지만 오라클에서는 어떤 컬럼에 데이터가 들어가는지 적어주어야 한다.

SELECT * FROM CUSINFO;


ALTER TABLE SALESMAN1
ADD (MARRIAGE CHAR(8) CONSTRAINT SALESMAN1_MARRIAGE_CK
CHECK (MARRIAGE IN ('SINGLE','MARRIED')));

SELECT * FROM SALESMAN1;

INSERT INTO SALESMAN1
VALUES (5555,'INSUN','SALESMAN',2000,10,'1234','1234','BB','SOLO'); --SOLO는 삽입될 수 없다. 실행오류

INSERT INTO SALESMAN1
VALUES (5555,'INSUN','SALESMAN',2000,10,'1234','1234','BB','SINGLE');

DESC SALESMAN1;
SELECT * FROM USER_CONSTRAINTS; 


--PK가 없는 테이블에 PK를 넣고 싶을 때
--테이블은 이미 만들어져 있는 상태이고 PK만 없는 상태
ALTER TABLE SALESMAN1
ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO);
/*
CREATE TABLE CUSINFO
(ID NUMBER(3) CONSTRAINT CUSINFO_ID_PK PRIMARY KEY,
NAME CHAR(10),
BIRTH DATE DEFAULT SYSDATE);
위 구조는 ID 컬럼을 생성하면서 동시에 PK로 설정했다. 그래서 KEY 뒤에 괄호로 컬럼을 언급할 필요가 없다.

하지만 
ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO);
같은 경우는 이미 만들어져 있는 테이블의 행을 PK로 설정하고자 하는 것이다.
컬럼을 생성하지 않으므로 KEY 뒤에 괄호로 어떤 컬럼을 PK로 설정할 것인지 언급해주어야 한다.
*/


ALTER TABLE MANAGER1
ADD COMM NUMBER(5);

DESC MANAGER1;

SELECT * FROM MANAGER1;
SELECT * FROM USER_CONSTRAINTS; 

ALTER TABLE MANAGER1
ADD CONSTRAINT MANAGER1_PNO_PK PRIMARY KEY(PNO);


-------------------------------------------------------------------------------------------


--MODIFY(컬럼수정)
SELECT * FROM MANAGER1;
DESC MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(16);

DESC MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(7) NOT NULL;
--PNO는 PK라 자동으로 들어간 NOT NULL이고 PNAME은 NOT NULL을 넣은 NOT NULL이다.


-------------------------------------------------------------------------------------------


--DROP(컬럼, 제약조건 삭제)
SELECT * FROM MANAGER1;
DESC MANAGER1;

SELECT * FROM USER_CONSTRAINTS; 

--PK를 이름으로 지우기
--정석적인 방법
ALTER TABLE MANAGER1
DROP CONSTRAINT MANAGER1_PNO_PK;

--PK는 어차피 테이블에 하나뿐이라 그냥 PK로 지워도 된다.
--이 방법은 PK에만 한정된다. 다른 제약조건은 이름으로 지우는 방식으로 해야한다.
ALTER TABLE SALESMAN1
DROP PRIMARY KEY;

ALTER TABLE DIVISION
DROP CONSTRAINT DIVISION_DNO_PK CASCADE;


--컬럼삭제
SELECT * FROM SALESMAN1;
DESC SALESMAN1;

--데이터가 들어있어도 삭제된다.
ALTER TABLE SALESMAN1
DROP COLUMN MARRIAGE;

--삭제는 아니고 보지못하게 하는 것
--비활성화 개념
ALTER TABLE SALESMAN1
SET UNUSED COLUMN DNO;

--UNUSED 컬럼 삭제하기
ALTER TABLE SALESMAN1
DROP UNUSED COLUMN;

SELECT COUNT(*) FROM DICTIONARY; --내가 쓸 수 있는 DICTIONARY 개수


-------------------------------------------------------------------------------------------


--DROP(테이블 삭제)
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


--레코드 삭제
--TRUNCATE / DELETE

SELECT * FROM CUSINFO;

DELETE CUSINFO;
--DELETE -> TRANSACTION 시작

SELECT * FROM CUSINFO;

ROLLBACK;

SELECT * FROM CUSINFO; --삭제했던 데이터를 롤백으로 다시 살림

COMMIT;

--TRUNCATE
--무조건 삭제. 롤백되지 않는다.
TRUNCATE TABLE CUSINFO;
SELECT * FROM CUSINFO;
ROLLBACK;
SELECT * FROM CUSINFO;


-------------------------------------------------------------------------------------------


--[RENAME](테이블의 이름 변경)
--컬럼명 알터 테이블 에서 알터 투
SELECT * FROM TAB;

SELECT * FROM PAY3000;

RENAME PAY3000 TO HIGHPAY;

SELECT * FROM HIGHPAY;
--이름을 변경하고 난 후에 이전의 값으로 값을 검색하면 에러가 난다.


-------------------------------------------------------------------------------------------


--[COMMENT]
--: 주석처리하는 것임
SELECT * FROM USER_TAB_COMMENTS;
--딕셔너리, 복수이기 때문에 -S가 붙음

COMMENT ON TABLE HIGHPAY
IS '월급 많이 받는 사람';
--HIGH PAY의 COMMENTS 월급 많이 받는 사람이라는 문구가 출력됨.

SELECT * FROM USER_TAB_COMMENTS;

COMMENT ON TABLE HIGHPAY
IS '';
--주석 처리 한 것 삭제

SELECT * FROM USER_TAB_COMMENTS;

COMMENT ON COLUMN HIGHPAY.PAY
IS '실 수령 금액';

SELECT * FROM USER_COL_COMMENTS;

SELECT * FROM HIGHPAY;

COMMENT ON COLUMN HIGHPAY.BONUS
IS '올해 보너스 없다.';

SELECT * FROM USER_COL_COMMENTS;


-------------------------------------------------------------------------------------------


--DCL(GRANT,REVOKE)
--GRANT: USER나 OBJECT에 권한을 부여할 때 사용
--REVOKE: USER나 OBJECT에 권한을 회수할 때 사용

CREATE USER YOUNG
IDENTIFIED BY YOUNG
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

--OBJECT 권한
GRANT SELECT ON PERSONNEL TO TEST;
GRANT SELECT,INSERT,DELETE ON DIVISION TO TEST;

SELECT * FROM USER_TAB_PRIVS_MADE;

REVOKE SELECT ON PERSONNEL FROM TEST;
REVOKE SELECT ON DIVISION FROM TEST;
REVOKE INSERT ON DIVISION FROM TEST;
REVOKE DELETE ON DIVISION FROM TEST;


CREATE ROLE MANAGER; 
--실행오류. KIM에는 권한이 없다.


CREATE ROLE KIMOBJ;

GRANT SELECT,INSERT,DELETE ON DIVISION TO KIMOBJ;

GRANT KIMOBJ TO lee;

SELECT * FROM ROLE_SYS_PRIVS;
SELECT * FROM USER_ROLE_PRIVS;


-------------------------------------------------------------------------------------------

/*
제약조건 (CONSTRAINT) : 무결성
PRIMARY KEY (PK)
FOREIGH KEY (FK)
UNIQUE KEY (UK)
NOT NULL (NN)
CHECK KEY (CK)
DEFAULT > 오라클에서는 제약조건에 들어가지 않지만 MS에서는 제약조건에 들어간다.

절대 있을 수 없는 일이 벌어졌을 때 무결성이 깨졌다고 말한다.





























