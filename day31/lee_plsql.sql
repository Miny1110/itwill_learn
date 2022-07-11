
/*
DECLARE
TYPE FIRSTTYPE IS RECORD
(A VARCHAR,B CHAR(7),C NUMBER);

--A, B, C를 담을 수 있는 FIRSTTYPE이라는 저장공간이 만들어졌다.
--테이블의 데이터 타입과 동일하게 해주어야 한다.
--하지만 하나하나 맞추기는 번거롭기 때문에 아래 코드처럼 대명사로 적어준다.
*/

DECLARE
TYPE FIRSTTYPE IS RECORD
(A 사원.사원명%TYPE, B 사원.직급%TYPE, C 사원.급여%TYPE);

CUS FIRSTTYPE;
--위에서 만든 TYPE FIRSTTYPE과 똑같은 변수 CUS가 만들어진다. 원본을 복사해서 사용하는 개념
--CUS라는 변수를 선언해서 FIRSTTYPE의 데이터를 넣어준다.

BEGIN
SELECT 사원명,직급,급여 INTO CUS FROM 사원 WHERE 사원번호=2001;
--이 데이터를 CUS 변수에 넣는다.

DBMS_OUTPUT.PUT_LINE('사원명  직급  급여');
DBMS_OUTPUT.PUT_LINE('------------------');
DBMS_OUTPUT.PUT_LINE(CUS.A||'  '||CUS.B||'  '||TO_CHAR(CUS.C));
--문자화 하지 않으면 에러가 생긴다. 그래서 TO_CHAR를 사용해서 문자로 바꾸어야 한다.
DBMS_OUTPUT.PUT_LINE('질의한 사용자: '||USER||'입니다');
--USER : 시스템 변수. LEE로 로그인했으면 LEE가 들어간다. KIM으로 로그인했으면 KIM이 들어간다.
DBMS_OUTPUT.PUT_LINE('질의한 시간: '||TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS'));

END;





















