package com.jdbc;

import java.sql.Connection;
import java.sql.Statement;

import com.db.DBConn;

//Statement : 가장 일반적
//PreparedStatement
//CallableStatement : 프로시저랑 연결할 때 사용
public class Test1 {

	public static void main(String[] args) {

		Connection conn = DBConn.getConnection();

		if(conn==null) {
			System.out.println("데이터베이스 연결 실패!");
			System.exit(0);
		}

		//DB연결 방법
		//1. DriverManager가 Connection을 생성
		//2. Connection이 Statement를 생성 (Statement: SQL구문을 실행하는 인터페이스)
		//3. Statement가 query를 실행

		try {

			
			//2. Connection이 Statement를 생성
			Statement stmt = conn.createStatement();
			String sql;
			
			/*
			//[데이터 추가]
			
			sql = "insert into score (hak,name,kor,eng,mat) ";
			sql+= "values('111','배수지',80,90,60)"; //+= : 누적

			//3. Statement가 query를 실행
			int result = stmt.executeUpdate(sql);

			if(result==1) {
				System.out.println("추가성공!");
			}
			 */

			/*
			//[데이터 수정]
			
			sql = "update score set kor=99,eng=99,mat=99 ";
			sql+= "where hak=111";

			int result = stmt.executeUpdate(sql);

			if(result==1) {
				System.out.println("수정성공!");
			}
			 */
			
			//[데이터 삭제]
			sql = "delete score where hak=111";
			
			int result = stmt.executeUpdate(sql);
			
			if(result==1) {
				System.out.println("삭제성공!");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		DBConn.close();
	}

}

//ORA-00001 ~ 라고 에러메세지가 뜨면 오라클의 에러다. 이클립스 자바 에러 아님!

/*cmd창 입력

create or replace procedure insertScore
(pHak in score.hak%type,
pName in score.name%type,
pKor in score.kor%type,
pEng in score.eng%type,
pMat in score.mat%type)
is
begin
insert into score(hak,name,kor,eng,mat)
values (pHak,pName,pKor,pEng,pMat);
commit;
end;

exec insertScore('777','hong',100,100,100);


create or replace procedure updateScore
(pHak in score.hak%type,
pKor in score.kor%type,
pEng in score.eng%type,
pMat in score.mat%type)
is
begin
update score set kor=pKor,eng=pEng,mat=pMat
where hak=pHak;
commit;
end;

exec updateScore('777',99,99,99);


create or replace procedure deleteScore
(pHak in score.hak%type)
is
begin
delete score where hak=pHak;
commit;
end;

exec deleteScore('777');


create or replace procedure selectAllScore
(pResult out sys_refcursor)
is
begin
open pResult for
select hak,name,kor,eng,mat,
(kor+eng+mat) tot,(kor+eng+mat)/3 ave,
rank() over (order by (kor+eng+mat) desc) rank
from score order by hak;
end;



create or replace procedure selectNameScore
(pResult out sys_refcursor,pName in varchar2)
is
begin
open pResult for
select hak,name,kor,eng,mat,
(kor+eng+mat) tot,(kor+eng+mat)/3 ave
from score where name like pName||'%';
end;



create or replace procedure selectHakScore
(pResult out sys_refcursor,pHak in varchar2)
is
begin
open pResult for
select hak,name,kor,eng,mat,
(kor+eng+mat) tot,(kor+eng+mat)/3 ave
from score where hak=pHak;
end;

 */



/* cmd창

create table test1
(id number primary key,
name varchar2(10) not null);


create table test2
(id number primary key,
birth date not null,
constraint test2_id_fk foreign key(id)
references test1(id));


create table test3
(id number primary key,
tel varchar2(20) not null,
constraint test3_id_fk foreign key(id)
references test1(id));

*/


/* cmd창
[서버 컴퓨터의 코드]
create table basicdata
(id varchar2(10) primary key,
pwd varchar2(20) not null,
name varchar2(20) not null);


[클라이언트 컴퓨터의 코드]
conn system/dba

grant create database link to suzi;

conn suzi/a123

CREATE DATABASE LINK link_test
CONNECT TO suzi IDENTIFIED BY "a123"
USING 
'(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)
(HOST=192.168.16.2)(PORT=1521))
(CONNECT_DATA=(SERVICE_NAME=XE)))';


[서버 컴퓨터의 코드]
insert into basicdata values ('11','11','inna');

commit;

select * from basicdata;


[클라이언트 컴퓨터의 코드]
select * from basicdata@link_test;
 */










