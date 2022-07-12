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

