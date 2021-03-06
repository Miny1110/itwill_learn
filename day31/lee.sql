--LEE

SELECT * FROM CUSTOM;

--실제로 있는 데이터에서 주민번호 가져오기
SELECT USERNAME, RPAD(SUBSTR(JUMIN,1,8),14,'*') JUMIN FROM CUSTOM;

SELECT * FROM CUSTOM;

--주소별 인원수 구하기
SELECT ADDR1,COUNT(*),ROUND(AVG(POINT)) FROM  CUSTOM
GROUP BY ADDR1;


-------------------------------------------------------------------------------------------

--오라클의 SWITCH문
--성별에 있는 값을 가지고 남/여를 만들었기 때문에 파생컬럼
--파생컬럼이기때문에 별칭을 꼭 생성해주어야 한다.

SELECT
CASE SEX
WHEN '1' THEN '남자'
WHEN '0' THEN '여자'
END GENDER,
COUNT(*),ROUND(AVG(AGE)) FROM CUSTOM
GROUP BY SEX;
/*
SELECT
CASE 컬럼명
	WHEN 1 THEN 100
	WHEN 2 THEN 200
	WHEN 3 THEN 300
	WHEN 4 THEN 400
	ELSE 500
END AS 별칭,
FROM DUAL;

SELECT
CASE 컬럼명 WHEN 1 THEN 100 ELSE 0,
CASE 컬럼명 WHEN 2 THEN 200 ELSE 0,
CASE 컬럼명 WHEN 3 THEN 300 ELSE 0,
CASE 컬럼명 WHEN 4 THEN 400 ELSE 0,
FROM DUAL;
*/

SELECT * FROM CUSTOM;

SELECT
CASE ADDR1
WHEN '서울특별시' THEN '서울'
WHEN '경기도' THEN '경기'
WHEN '경상남도' THEN '경남'
END ADDR
FROM CUSTOM;


-------------------------------------------------------------------------------------------

/*
JOIN문
EQUIE JOIN(INNER JOIN)
NON-EQUIE JOIN
OUTER JOIN
CROSS JOIN
SELF JOIN
*/

--JOIN문의 특징 : 공통되는 분모가 있어야 조인문을 실행할 수 있다.
--무조건 만들어야함. 안만들면 조인문 자체를 사용할 수 없기 때문에 엉터리 DB가 된다.


SELECT * FROM TAB;

SELECT * FROM CUSTOM WHERE USERID='nu7634';
SELECT * FROM COMPANY WHERE USERID='nu7634';
SELECT * FROM POINT WHERE USERID='nu7634';
SELECT * FROM SALES WHERE USERID='nu7634';
--테이블들끼리 공통되는 컬럼이 있어야만 조인문이 가능하다.
--공통분모인 USERID='nu7634'가 있기 때문에, 이 사람의 이름, 회사, 포인트 정보, 구매 목록을 한번에 SELECT할 수 있다.


-------------------------------------------------------------------------------------------


--[EQUITE JOIN(INNER JOIN)] - 가장 기본적이고 많이 사용된다.
SELECT CUSTOM.USERID, USERNAME, AGE, COMPANY.USERID, ADDR1, PAY
FROM CUSTOM, COMPANY --중복되는 컬럼은 꼭 위치를 표기해줘야한다.
WHERE CUSTOM.USERID = COMPANY.USERID; -- 공통분모
--USERNAME앞에도 CUSTOM을 붙여야 하지만 CUSTOM안에만 있는 값이기 때문에 생략이 가능하다.
--앞에 입력되는 USERID에 컬럼명을 붙이면 뒤에 오는 USERID를 생략해도 값이 출력된다.


SELECT A.USERID,USERNAME,AGE,ADDR1,B.USERID,COMPANY,PAY
FROM CUSTOM A,COMPANY B
WHERE A.USERID = B.USERID;
--USERNAME은 CUSTOM테이블에만 있기 때문에 앞에 테이블명을 적어주지 않아도 된다.
--테이블은 AS 쓰면 에러. 별칭만 쓰는 것은 가능하다.


SELECT A.USERID, USERNAME, AGE, ADDR1, B.USERID, PAY
FROM CUSTOM A INNER JOIN COMPANY B 
ON A.USERID = B.USERID;
--FM방식 국제 표준값이지만 오라클에서는 ,로 사용할 수 있게 만들어놓음. 
-- , 대신 INNER JOIN(INNER는 생략 가능) WHERE 대신 ON 입력


--'CUSTOM'에서 UserID, UserName을 검색하고 POINT 테이블에서 제품구입, 로그인에 관계된 점수 POINT 점수(Product, Login)를 검색
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


--[OUTER JOIN] - 외부조인이라고도 함.
--한쪽 테이블을 기준으로 다른쪽에 있는 데이터를 매치시키는 것이다.
--기준 테이블을 어떤 테이블로 정하냐에 따라 출력값이 달라질 수있다.

SELECT COUNT(*) FROM CUSTOM; --459
SELECT COUNT(*) FROM COMPANY; --464

--CUSTOM 테이블 기준으로 JOIN문 입력
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID = B.USERID(+) -- 기준점은 대각선으로 입력함.
ORDER BY B.COMPANY DESC;
--고객정보 테이블은 있는데 회사정보 테이블이 없는 경우는 NULL값이 됨.

SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID = B.USERID(+) AND B.COMPANY IS NULL;
--NULL값만 찾아서 출력

--COMPANY 테이블 기준으로 JOIN문 입력
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B 
WHERE A.USERID(+) = B.USERID -- 기준점은 대각선으로 입력함.
ORDER BY B.COMPANY DESC;


-------------------------------------------------------------------------------------------


--ANSI 표준 SQL : (+) 사용 안함
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A LEFT OUTER JOIN COMPANY B 
ON A.USERID = B.USERID
ORDER BY B.COMPANY DESC;

SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B 
ON A.USERID = B.USERID
ORDER BY B.COMPANY DESC;


-------------------------------------------------------------------------------------------


--[CROSS JOIN] - 상호 조인
--많은 양의 데이터를 새로운 테이블에 값을 넣어 테스트 할때 사용함

SELECT A.USERID, USERNAME, AGE, B.USERID, ADDR1, PAY
FROM CUSTOM A, COMPANY B;
--459*464 = 212,976개의 ROWS 값이 출력된다.

--ANSI 표준 SQL
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
--하나의 테이블을 메모리에 두번 올려 놓고 비교할 때 SELF JOIN 사용
--하나의 테이블을 두개로 복사해서 값을 비교하는 것은 JOIN문에서만 해당된다.
--공식으로 생각하고 외워야함.

SELECT * FROM CUSTOM 
ORDER BY USERNAME;

SELECT DISTINCT A.* -- DISTINCT는 중복되는 값을 삭제함
FROM CUSTOM A, CUSTOM B
WHERE A.USERNAME = B.USERNAME --이름은 같아야하지만
AND A.USERID <> B.USERID --ID는 달라야함
ORDER BY A.USERNAME;


--CUSTOM 테이블에서 제주도에 살고 있는 사람 중에 동일한 이름을 갖는 행을 검색
SELECT A.*
FROM CUSTOM A, CUSTOM B
WHERE A.ADDR1 = '제주도'
AND A.USERID <> B.USERID
AND A.USERNAME = B.USERNAME
ORDER BY A.USERNAME;
--이렇게 하면 노영호(충청과 제주의 동명이인)가 나온다. 우리는 제주도에 살고있는 사람들 중에 동명이인을 찾아야 하므로 노영호는 출력되면 안된다.

SELECT A.*
FROM CUSTOM A INNER JOIN CUSTOM B
ON A.USERNAME = B.USERNAME
WHERE A.USERID <> B.USERID AND A.ADDR1 = '제주도' AND B.ADDR1 = '제주도';

SELECT A.*
FROM CUSTOM A, CUSTOM B
WHERE A.USERNAME = B.USERNAME
AND A.USERID <> B.USERID
AND A.ADDR1 = '제주도' AND B.ADDR1 = '제주도';


--3개 이상의 테이블 조인
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



--파생테이블과 JOIN
--아이디별로 구매횟수와 구매금액의 합 검색
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
SELECT * FROM CUSTOM WHERE ADDR1='제주도';

CREATE TABLE SEOUL
AS
SELECT * FROM CUSTOM WHERE ADDR1='서울특별시';

CREATE TABLE KYUNG
AS
SELECT * FROM CUSTOM WHERE ADDR1='경기도';

SELECT * FROM TAB;

SELECT * FROM JEJU;
SELECT * FROM SEOUL;
SELECT * FROM KYUNG;

SELECT * FROM JEJU
UNION
SELECT * FROM SEOUL
UNION
SELECT * FROM KYUNG;
--PRIMARY KEY로 정렬한다. 여기서는 USERID이다.


-------------------------------------------------------------------------------------------
--[07/06]


--SUBQUERY(하위쿼리)
/*
쿼리 안에 쿼리가 들어가 있는 것이다. 
하위쿼리는 괄호를 쓰지 않으면 에러가 난다.
비교하는 컬럼의 개수는 동일해야 한다.
비교하는 컬럼명은 동일해야 같은 데이터에서 값을 비교하여 출력된다.
비교하는 컬럼명이 다른 경우 에러가 나지는 않지만 원하는 값으로 출력되지 않는다.
하위쿼리는 100% JOIN문으로 변경할 수 있다.
*/

--COMPANY 테이블에서 USERID,COMPANY,DEPT PAY,평균월급
SELECT * FROM COMPANY;

SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY;

SELECT USERID,COMPANY,DEPT PAY,
(SELECT ROUND(AVG(PAY)) A_PAY FROM COMPANY) A_PAY 
FROM COMPANY;

--CUSTOM 테이블에서 평균 나이보다 많은 사원의 정보 검색
SELECT * FROM CUSTOM;

SELECT ROUND(AVG(AGE)) FROM CUSTOM; --29

SELECT * FROM CUSTOM WHERE AGE>=29;

--SELECT문이 29위치에 하위쿼리로 들어간다.
SELECT * FROM CUSTOM
WHERE AGE>=(SELECT ROUND(AVG(AGE)) FROM CUSTOM);


--현대자동차 그룹에 근무하는 직원
SELECT * FROM COMPANY WHERE COMPANY LIKE '현대자동차%';

SELECT * FROM CUSTOM
WHERE USERID='EE9224' OR USERID='el3409';

SELECT * FROM CUSTOM
WHERE USERID IN ('EE9224','el3409');
--둘이 같은 결과


SELECT USERID FROM COMPANY
WHERE COMPANY LIKE '현대자동차%';

SELECT * FROM CUSTOM 
WHERE USERID IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');
--위 셀렉트 문을 하위쿼리로

--JOIN문을 사용해 출력
SELECT A.*
FROM CUSTOM A INNER JOIN COMPANY B
ON A.USERID = B.USERID AND B.COMPANY LIKE '현대자동차%';

SELECT A.*
FROM CUSTOM A, COMPANY B
WHERE A.USERID = B.USERID AND B.COMPANY LIKE '현대자동차%';


--4회 이상 판매기록이 있는 고객들의 기본 정보 검색
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

SELECT A.* --질문~~!
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B  
ON A.USERID = B.USERID AND B.COMPANY LIKE '%현대%자동차%';
SELECT * FROM CUSTOM;
SELECT * FROM COMPANY;

SELECT A.*
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B  /*가져올 데이터가 CUSTOM에 있다*/
ON A.USERID = B.USERID
WHERE B.COMPANY LIKE '%현대%자동차%';


-------------------------------------------------------------------------------------------


/*
ANY(범위가 포함), ALL(범위가 미포함)

>ANY : 최소값보다 큰 데이터
<ANY : 최대값보다 작은 데이터
>ALL : 최대값보다 큰 데이터
<ALL : 최소값보다 작은 데이터
*/
SELECT POINT FROM CUSTOM;

SELECT POINT FROM CUSTOM WHERE ADDR1='제주도' ORDER BY POINT; --132,269

-- [ >ANY ]
SELECT * FROM CUSTOM
WHERE POINT > ANY(SELECT POINT FROM CUSTOM WHERE ADDR1='제주도');

SELECT * FROM CUSTOM
WHERE POINT > (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1='제주도');

-- [ <ANY ]
SELECT * FROM CUSTOM
WHERE POINT < ANY(SELECT POINT FROM CUSTOM WHERE ADDR1='제주도');

SELECT * FROM CUSTOM
WHERE POINT < (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1='제주도');
--MIN/MAX로 써도 되는데 왜 굳이 ANY를 사용하는가? > 속도가 훨씬 빠르다.

-- [ >ALL ]
SELECT * FROM CUSTOM
WHERE POINT > ALL(SELECT POINT FROM CUSTOM WHERE ADDR1='제주도');

SELECT * FROM CUSTOM
WHERE POINT > (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1='제주도');

-- [ <ALL ]
SELECT * FROM CUSTOM
WHERE POINT < ALL(SELECT POINT FROM CUSTOM WHERE ADDR1='제주도');

SELECT * FROM CUSTOM
WHERE POINT < (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1='제주도');

SELECT * FROM CUSTOM;

UPDATE CUSTOM SET POINT=130 WHERE USERID='nu7634';


SELECT POINT FROM CUSTOM WHERE AGE>=70;

SELECT * FROM CUSTOM
WHERE POINT > ANY (SELECT POINT FROM CUSTOM WHERE AGE>=70);
--ANY는 하위쿼리의 결과가 없으면 상위쿼리의 결과도 나오지 않는다.

SELECT * FROM CUSTOM
WHERE POINT > ALL (SELECT POINT FROM CUSTOM WHERE AGE>=70);
--ALL은 하위쿼리 데이터가 없어도 모든 데이터가 나온다. 크건 작건 다 나온다.


SELECT * FROM CUSTOM 
WHERE USERID IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

SELECT * FROM CUSTOM 
WHERE USERID = ANY (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');
--IN과 =ANY는 같다. ANY가 속도가 더 빠르다.

SELECT * FROM CUSTOM 
WHERE USERID NOT IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

SELECT * FROM CUSTOM 
WHERE USERID <> ALL (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');
--NOT IN과 <>ALL은 같다.


-------------------------------------------------------------------------------------------

--하위쿼리 : 독자적 처리 가능
--괄호 밖으로 나와도 사용 가능
SELECT USERID,USERNAME,ADDR1,SCHOL FROM CUSTOM
WHERE USERID IN
(SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%');

SELECT USERID FROM COMPANY WHERE COMPANY LIKE '현대자동차%'; --O


--상관쿼리 : 독자적 처리불가능
--괄호 밖에 나오면 사용 불가
SELECT USERID,USERNAME,ADDR1,SCHOL FROM CUSTOM
WHERE EXISTS
(SELECT * FROM COMPANY WHERE USERID=CUSTOM.USERID AND COMPANY LIKE '현대자동차%');

SELECT * FROM COMPANY WHERE USERID=CUSTOM.USERID AND COMPANY LIKE '현대자동차%'; --X


-------------------------------------------------------------------------------------------

--조건으로만 작성
SELECT * FROM CUSTOM WHERE ADDR1='경기도' AND AGE<=20;

--하위쿼리 + 조건으로 작성
SELECT * FROM(SELECT * FROM CUSTOM WHERE ADDR1='경기도') A
WHERE A.AGE<=20;


-------------------------------------------------------------------------------------------
--[07/11]

create table 사원
(사원번호 number(10),
사원명 varchar2(10),
부서번호 number(2),
직급 varchar2(10),
우편번호 char(7),
주소 varchar2(50),
전화번호 char(15),
급여 number(5),
커미션 number(5),
입사일 date,
성별 char(6),
사수번호 number(10)
);

insert into 사원 values(2001,'이순신',10,'부장','125-365','서울 용산구','02-985-1254',3500,100,'1980-12-01','남자',null);
insert into 사원 values(2002,'홍길동',10,'대리','354-865','서울 강남구','02-865-1254',4000,'','2000-01-25','남자',2004);
insert into 사원 values(2003,'성유리',20,'사원','587-456','부산 해운대구','051-256-9874',2500,100,'2002-05-24','여자',2002);
insert into 사원 values(2004,'옥주현',30,'과장','987-452','서울 강남구','02-33-6589',5000,'','1997-03-22','여자',2001);
insert into 사원 values(2005,'길건',10,'대리','123-322','서울 성동구','02-888-9564',3000,100,'1999-07-15','여자',2004);
insert into 사원 values(2006,'한지혜',20,'사원','154-762','서울 송파구','02-3369-9874',2000,'','2003-05-22','여자',2005);
insert into 사원 values(2007,'박솔미',30,'대리','367-985','서울 영등포구','02-451-2563',3000,100,'2006-01-25','여자',2004);
insert into 사원 values(2008,'이효리',40,'사원','552-126','서울 중구','02-447-3256',2000,'','2001-02-02','여자',2007);


commit;

select * from 사원;
DESC 사원;

SELECT 사원명,직급,급여 FROM 사원 WHERE 사원번호=2001;
SELECT * FROM SALES;
SELECT * FROM CUSTOM;

-------------------------------------------------------------------------------------------
--[CMD창]

SQLPLUS lee/bob

DECLARE
TYPE FIRSTTYPE IS RECORD
(A 사원.사원명%TYPE, B 사원.직급%TYPE, C 사원.급여%TYPE);

CUS FIRSTTYPE;

BEGIN
SELECT 사원명,직급,급여 INTO CUS FROM 사원 WHERE 사원번호=2001;

DBMS_OUTPUT.PUT_LINE('사원명  직급  급여');
DBMS_OUTPUT.PUT_LINE('-----------------');
DBMS_OUTPUT.PUT_LINE(CUS.A||'  '||CUS.B||'  '||TO_CHAR(CUS.C));
DBMS_OUTPUT.PUT_LINE('질의한 사용자: '||USER||'입니다');
DBMS_OUTPUT.PUT_LINE('질의한 시간: '||TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS'));

END;
/
--CMD에서는 END 밑에 /를 입력해주어야 출력이 된다.

SET SERVEROUTPUT ON;
--CMD창에서는 항상 SERVEROUTPUT이 OFF로 되어있다. 그래서 ON으로 바꿔주어야 한다.

-------------------------------------------------------------------------------------------
--[CMD창]

DECLARE
SAWON_RECORD 사원%ROWTYPE;
--사원테이블 한개의 행에 몇개의 테이블이 있건 상관없이 사원_레코드라는 이름으로 만들어라.
BEGIN
SELECT * INTO SAWON_RECORD FROM 사원 WHERE 사원번호 = 2001;
DBMS_OUTPUT.PUT_LINE('사원번호: ' || SAWON_RECORD.사원번호);
DBMS_OUTPUT.PUT_LINE('사원명: ' || SAWON_RECORD.사원명);
DBMS_OUTPUT.PUT_LINE('주소: ' || SAWON_RECORD.주소);
DBMS_OUTPUT.PUT_LINE('급여: ' || SAWON_RECORD.급여);
END;
/

-------------------------------------------------------------------------------------------
--[CMD창] 컬럼 단위로 데이터를 가져올 수 있다.

DECLARE
TYPE NAME_TYPE IS TABLE OF 사원.사원명%TYPE
--사원명이 들어있는 컬럼의 데이터 값 모두 가져오기
--NAME_TYPE이라는 변수는 사원테이블의 사원명 컬럼의 데이터 타입을 따른다.
INDEX BY BINARY_INTEGER;
TYPE JIK_TYPE IS TABLE OF 사원.직급%TYPE
--직급명이 들어있는 컬럼의 데이터 값 모두 가져오기
INDEX BY BINARY_INTEGER;
--인덱스 데이터 타입이 숫자임.

SANAME_COL NAME_TYPE;
SAJIK_COL JIK_TYPE;
--NAME_TYPE을 담는 새로운 변수 SANAME_COL을 만들었다.
--이렇게 두개의 변수를 만들었고 만든 변수에 타입을 집어 넣음

I BINARY_INTEGER := 0;
--변수를 하나 생성했는데 변수의 타입은 BINARY_INTEGER
--PL/SQL에서의 대입은 := 를 사용하면 된다.

BEGIN

FOR K IN (SELECT 사원명, 직급 FROM 사원) LOOP 
--반복문 시작
I := I+1;
SANAME_COL(I) := K.사원명;
SAJIK_COL(I) := K.직급;
END LOOP;
--반복문 닫기

DBMS_OUTPUT.PUT_LINE('사원명  직급');
DBMS_OUTPUT.PUT_LINE('------------');

FOR J IN 1..I LOOP
--1부터 I번째가 될 때까지 반복
DBMS_OUTPUT.PUT_LINE(RPAD(SANAME_COL(J),12)||RPAD(SAJIK_COL(J),9));
END LOOP;
END;
/

-------------------------------------------------------------------------------------------
--[CMD창] 이름이 있는 PROCEDURE 만들기
/*
장점
S * FROM 사원 -> 텍스트 문장
텍스트 문장을 서버로 보내면 이 문장안에 사원이라는 테이블이 있는지를 검사함.
컬럼이 있는지 , 문장이 맞는지 등등 여러가지의 검사를 함.
여러가지 검사를 한 후 실행을 함 -> 결과를 테이블로 보여지게 함.

(프로시저 만들경우)
똑같이 들어간 후 검사를 한 다음에 문장 자체를 컴파일을 시켜 저장을 함 
검증하는 부분을 완료하여 저장을 해 놓았기 때문에 문장을 실행하면 
다시 검사를 하지 않고 바로 실행을 하기 때문에 속도가 훨씬 빨라진다.
*/

CREATE OR REPLACE PROCEDURE CHANGE_PAY
(V_SANO IN NUMBER, V_NEW_PAY IN NUMBER)
--IN은 생략해도 된다.
IS

BEGIN
UPDATE 사원 SET 급여 = V_NEW_PAY WHERE 사원번호 = V_SANO;
COMMIT;
--UPDATE를 하면 TRANSACTION이 시작되므로 반드시 COMMIT을 해주어야 한다.
END CHANGE_PAY;
/

EXEC CHANGE_PAY(2001,5000);
--EXEC : EXECUTE의 약자. 괄호 안의 매개변수를 들고 위 코드를 실행한다. 여기서는 UPDATE를 실행한다.

-------------------------------------------------------------------------------------------
--[CMD창] 함수

CREATE OR REPLACE FUNCTION F_TAX
(V_SANO NUMBER)
RETURN NUMBER
--외부에서 값을 가져오는 매개변수. IS 위에는 자바의 매개변수처럼 받는 것
IS
--내부에서 사용하는 변수. IS 아래에는 내부적으로 사용하겠다는 변수
V_TAX NUMBER;

BEGIN
SELECT ((급여*12) + NVL(커미션,0)) * 0.05 INTO V_TAX
FROM 사원 WHERE 사원번호 = V_SANO;

RETURN V_TAX;
END;
/

SELECT 사원번호, 사원명, 직급, 커미션,F_TAX(2001) TAX
FROM 사원 WHERE 사원번호 = 2001;

-------------------------------------------------------------------------------------------
--[CMD창] 프로시저로 함수
--프로시저도 반환값을 쓸 수 있다. 하지만 복잡해서 함수를 쓴다.

CREATE OR REPLACE PROCEDURE P_OUTTEX
(V_SANO IN 사원.사원번호%TYPE,
V_SANAME OUT 사원.사원명%TYPE,
V_PAY OUT 사원.급여%TYPE,
V_COMM OUT 사원.커미션%TYPE)
IS
BEGIN
SELECT 사원명, 급여, 커미션 INTO V_SANAME,V_PAY,V_COMM
FROM 사원 WHERE 사원번호 = V_SANO;
END;
/
 
VARIABLE NAME VARCHAR2(10);
VARIABLE PAY NUMBER;
VARIABLE COMM NUMBER;
--IS위의 매개변수를 담을 그릇을 반들어 준 것임

EXEC P_OUTTEX(2001,:NAME,:PAY,:COMM);
SELECT :NAME,:PAY,:COMM FROM DUAL;

-------------------------------------------------------------------------------------------
--[CMD창]

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
--TEL이라는 컬럼의 -(대쉬)를 17개로 맞춰라
PRINT TEL;

-------------------------------------------------------------------------------------------
--[CMD창] LEE에 존재하는 SALES테이블 사용

CREATE OR REPLACE PROCEDURE P_GOJUTOT
(V_GNO IN VARCHAR2)
IS
TOT NUMBER;

BEGIN
SELECT COUNT(*) INTO TOT FROM SALES
WHERE USERID=V_GNO
GROUP BY USERID;

DBMS_OUTPUT.PUT_LINE(V_GNO||'번 고객님의 총 주문 횟수는 '||TO_CHAR(TOT)||'번 입니다');
END;
/

EXEC P_GOJUTOT('og6675');

-------------------------------------------------------------------------------------------
--[CMD창] 기본적인 SELECT문을 통한 PROCEDURE  가장 많이 사용하고 가장 많이 활용된다.

CREATE OR REPLACE PROCEDURE SEARCHJIK
(JIK IN VARCHAR2)
IS
A NUMBER:=0;
B NUMBER(12,2):=0;
C NUMBER:=0;
BEGIN
SELECT SUM(PAY),AVG(PAY),COUNT(*) INTO A,B,C
FROM COMPANY WHERE POSIT=JIK;
DBMS_OUTPUT.PUT_LINE('급여 총액: ' ||A||'원');
DBMS_OUTPUT.PUT_LINE('평균 월급: ' ||B||'원');
DBMS_OUTPUT.PUT_LINE('인원 수: ' ||C||'명');
END;
/

-------------------------------------------------------------------------------------------
--[CMD창] 테이블 만들고 INSERT 통해 데이터 만들기

CREATE OR REPLACE PROCEDURE P_EX
(A IN NUMBER, B IN NUMBER)
IS
BEGIN
INSERT INTO TEST(A,B) VALUES(A,B);
COMMIT;
END;
/

EXEC P_EX(20,30);

-------------------------------------------------------------------------------------------
--[CMD창] UPDATE 프로시저

CREATE OR REPLACE PROCEDURE P_UP
(A_C NUMBER, B_C NUMBER)
IS
BEGIN
UPDATE TEST SET B=B_C WHERE A=A_C;
COMMIT;
END;
/

EXEC P_UP(10,100);

-------------------------------------------------------------------------------------------
--[CMD창] DELETE 프로시저 : 프로시저 중 사용빈도가 제일 높다.

CREATE OR REPLACE PROCEDURE P_DE
(A_C NUMBER)
IS
BEGIN
DELETE TEST WHERE A=A_C;
COMMIT;
END;
/

EXEC P_DE(10);

-------------------------------------------------------------------------------------------
--[CMD창] CUSTOM 테이블에 INSERT 시키는 프로시저 만들기

CREATE OR REPLACE PROCEDURE CUS_IN
(A VARCHAR2,B VARCHAR2,C VARCHAR2,D NUMBER,E VARCHAR2,
F VARCHAR2,G VARCHAR2,H VARCHAR2,I VARCHAR2,J VARCHAR2,
K VARCHAR2,L VARCHAR2,M NUMBER,N VARCHAR2)
IS
BEGIN
INSERT INTO CUSTOM VALUES (A,B,C,D,E,F,G,H,I,J,K,L,M,N);
COMMIT;
END;
/

EXEC CUS_IN ('A001','SUZI','123',27,'0','123-123','서울','강남구','역삼동','010-111-2222','가수','대졸',100,SYSDATE);

-------------------------------------------------------------------------------------------
--[CMD창] CUSTOM 테이블에 UPDATE 시키는 프로시져 만들기

CREATE OR REPLACE PROCEDURE CUS_UP
(A VARCHAR2,B VARCHAR2,C VARCHAR2,D NUMBER,E VARCHAR2,
F VARCHAR2,G VARCHAR2,H VARCHAR2,I VARCHAR2,J VARCHAR2,
K VARCHAR2,L VARCHAR2,M VARCHAR2,N VARCHAR2)
IS
BEGIN
UPDATE CUSTOM SET USERNAME=B,JUMIN=C,AGE=D,SEX=E,ZIP=F,ADDR1=G,
ADDR2=H,ADDR3=I,TEL=J,SCHOL=L,POINT=M,REGDATE=N
WHERE USERID=A;
COMMIT;
END;

EXEC CUS_UP('A001','INNA','123',27,'0','123-123','서울','강남구','역삼동','010-111-2222','가수','대졸',100,SYSDATE);


-------------------------------------------------------------------------------------------
--[CMD창] CUSTOM 테이블에 DELETE 시키는 프로시져 만들기

CREATE OR REPLACE PROCEDURE CUS_DEL
(A VARCHAR2)
IS
BEGIN
DELETE CUSTOM WHERE USERID=A;
COMMIT;
END;
/

EXEC CUS_DEL('A001');

-------------------------------------------------------------------------------------------
--[CMD창] 함수

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

--------------------------------------------

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

SELECT F_NAME('영웅재중') NAME FROM DUAL;

--------------------------------------------

COL NAME FORMAT A8; --길이 설정
SELECT F_NAME(USERNAME) FROM CUSTOM WHERE ADDR1='제주도';

--------------------------------------------

SELECT 
FLOOR(MONTHS_BETWEEN(SYSDATE,'2002-06-01')/12) || '년' ||
FLOOR(MOD(MONTHS_BETWEEN(SYSDATE,'2002-06-01'),12)) || '개월'
FROM DUAL;

CREATE OR REPLACE FUNCTION F_SDAY
(V_DATE IN DATE)
RETURN VARCHAR2
IS
GUNDATE VARCHAR2(20);
BEGIN 
GUNDATE := 
FLOOR(MONTHS_BETWEEN(SYSDATE,V_DATE)/12) || '년' ||
FLOOR(MOD(MONTHS_BETWEEN(SYSDATE,V_DATE),12)) || '개월';
RETURN GUNDATE;
END;
/

SELECT USERNAME,REGDATE,F_SDAY(REGDATE) GUNDATE
FROM CUSTOM WHERE ADDR1='제주도';

--------------------------------------------

CREATE OR REPLACE FUNCTION F_GENDER
(V_JUMIN IN VARCHAR2)
RETURN VARCHAR2
IS
GENDER VARCHAR2(4);
BEGIN
GENDER := SUBSTR(V_JUMIN,8,1);
IF GENDER IN ('1','3') THEN
GENDER := '남'; --크기를 2로 줬기 때문에 한글은 한글자만 가능하다.
ELSE
GENDER := '여';
END IF;
RETURN GENDER;
END;
/

COL GENDER FORMAT A16;
SELECT USERNAME,JUMIN,F_GENDER(JUMIN) GENDER
FROM CUSTOM WHERE ADDR1='제주도';

-------------------------------------------------------------------------------------------
--[IF문]

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
SELECT USERID,POSIT,PAY,F_PAYGRADE(PAY)||'등급' PAYGRADE
FROM COMPANY WHERE USERID='XA9776';

SELECT USERID,POSIT,PAY,F_PAYGRADE(PAY)||'등급' PAYGRADE
FROM COMPANY WHERE USERID='ye8802';

-------------------------------------------------------------------------------------------
--[LOOP문=DO WHILE]

CREATE TABLE TEST2
(NO NUMBER,
NAME VARCHAR2(10) DEFAULT '홍길동');

DECLARE
V_COUNT NUMBER(2) := 1;
BEGIN
LOOP
INSERT INTO TEST2(NO) VALUES(V_COUNT);
V_COUNT := V_COUNT + 1;
EXIT WHEN V_COUNT > 10; --조건이 아래에 있다는 점이 DO WHILE문과 비슷하다
END LOOP;
DBMS_OUTPUT.PUT_LINE('데이터 입력 완료');
END;
/

SELECT * FROM TEST2;

-------------------------------------------------------------------------------------------
--[FOR문]

CREATE OR REPLACE PROCEDURE P_FOR
IS
BEGIN
FOR I IN 11..30 LOOP --11부터 30까지
INSERT INTO TEST2(NO) VALUES(I);
COMMIT;
END LOOP;
END;
/

EXEC P_FOR;
--매개변수 없이 입력하면 된다.

SELECT * FROM TEST2;

-------------------------------------------------------------------------------------------
--[WHILE문]

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
DBMS_OUTPUT.PUT_LINE(TO_CHAR(V_START)||'부터'||TO_CHAR(V_END)||'까지의 합은 '||TO_CHAR(TOT)||'입니다');
END;
/

EXEC P_WHILE(1,100);

-------------------------------------------------------------------------------------------
--[예외처리]

CREATE OR REPLACE PROCEDURE EXE_TEST
IS
SW_REC 사원%ROWTYPE;
BEGIN
SELECT * INTO SW_REC FROM 사원;
DBMS_OUTPUT.PUT_LINE('데이터 검색 성공');

EXCEPTION

WHEN TOO_MANY_ROWS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('데이터가 많습니다');

WHEN NO_DATA_FOUND THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('데이터가 없습니다');

WHEN OTHERS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('기타 에러입니다');

END;
/

EXEC EXE_TEST; --데이터가 많습니다

--------------------------------------------

CREATE OR REPLACE PROCEDURE EXE_TEST
IS
SW_REC 사원%ROWTYPE;
BEGIN
SELECT * INTO SW_REC FROM 사원 WHERE 사원번호='2001'; --데이터를 하나만 INSERT
DBMS_OUTPUT.PUT_LINE('데이터 검색 성공');

EXCEPTION

WHEN TOO_MANY_ROWS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('데이터가 많습니다');

WHEN NO_DATA_FOUND THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('데이터가 없습니다');

WHEN OTHERS THEN
ROLLBACK;
DBMS_OUTPUT.PUT_LINE('기타 에러입니다');

END;
/

EXEC EXE_TEST; --데이터 검색 성공

-------------------------------------------------------------------------------------------
--[사용자 정의 에러]

CREATE OR REPLACE PROCEDURE PAY_VALIDATE
(V_SANO 사원.사원번호%TYPE)
IS
NOT_ENOUGH_PAY EXCEPTION; --내가 만든 에러

SW_REC 사원%ROWTYPE;

BEGIN
SELECT * INTO SW_REC FROM 사원 WHERE 사원번호=V_SANO;

IF SW_REC.급여 >= 3000 THEN
DBMS_OUTPUT.PUT_LINE('급여가 3000 이상 적당함');

ELSIF SW_REC.급여 <3000 THEN --ELSEIF(X) / ELSIF(O)
RAISE NOT_ENOUGH_PAY;

ELSE
DBMS_OUTPUT.PUT_LINE('급여가 이상함');
END IF;

EXCEPTION

WHEN NOT_ENOUGH_PAY THEN
RAISE_APPLICATION_ERROR(-20001,'급여가 충분하지 못함');

END;
/

EXEC PAY_VALIDATE(2003);

-------------------------------------------------------------------------------------------




















