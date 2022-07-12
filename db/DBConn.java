package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {

	private static Connection dbConn;
	
	//DB연결 메소드(연결자 생성)
	//db 연결하고 싶을 때 호출
	public static Connection getConnection() {
		
		if(dbConn==null) {
			
			//반드시 try catch문으로 묶어주어야 한다. 검증작업이 필요하기 때문
			try {
				//jdbc:oracle : jdbc로 oracle을 연결할 것이다.
				//노트북으로 사용하면 ip 위치에 localhost라고 적기
				//오라클의 기본 포트번호:1521
				//db 이름:xe
				//띄어쓰기 금지
				String url = "jdbc:oracle:thin:@localhost:1521:xe"; //type4형식
				String user = "suzi";
				String pwd = "a123";
				
				//oracle.jdbc.driver : 패키지 이름
				//OracleDriver : 클래스 이름
				Class.forName("oracle.jdbc.driver.OracleDriver");
				dbConn = DriverManager.getConnection(url, user, pwd);
						
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return dbConn;
	}
	
	//db 연결 끊고싶을 때 호출
	public static void close() {
		
		//dbConn이 null이 아닐때 연결을 끊는다.
		//데이터가 있는지 확인
		if(dbConn!=null) {
			try {
				
				//연결이 끊겼는지 확인
				if(!dbConn.isClosed()) {
					dbConn.close();
				}
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		//dbConn의 연결을 끊었으면 반드시 dbConn을 null로 초기화해주어야 한다.
		//초기화하지 않으면 그 다음부터 연결이 되지 않는다.
		dbConn = null;
	}
}
