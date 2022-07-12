package com.jdbc;

import java.sql.Connection;

import com.db.DBConn;

public class TestDB {

	public static void main(String[] args) {
		
		Connection conn = DBConn.getConnection();
		
		if(conn==null) {
			System.out.println("데이터베이스 연결 실패");
			System.exit(0);
		}
		
		System.out.println("데이터베이스 연결 성공");
		
		DBConn.close();
		
	}
	
}
