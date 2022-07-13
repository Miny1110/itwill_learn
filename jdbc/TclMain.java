package com.jdbc;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;

import com.db.DBConn;

public class TclMain {

	public static void main(String[] args) {
		
		Connection conn = DBConn.getConnection();
		Statement stmt = null;
		String sql;
		
		Scanner sc = new Scanner(System.in);
		
		
		int id,ch;
		String name,birth,tel;
		
		try {
			
			while(true) {
				
				do {
					System.out.print("1.입력 2.출력 3.종료");
					ch = sc.nextInt();
				}while(ch<1 || ch>3);
				
				switch(ch) {
				
				case 1:
					conn.setAutoCommit(false);
					
					System.out.print("아이디?"); //test1로 들어가야함
					id = sc.nextInt();
					
					System.out.print("이름?"); //test1로 들어가야함
					name = sc.next();
					
					System.out.print("생일?"); //test2로 들어가야함
					birth = sc.next();
					
					System.out.print("전화?"); //test3로 들어가야함
					tel = sc.next();
					
					//문자는 작은따옴표 안에 넣어주어야 한다.
					sql = String.format("insert into test1(id,name) values (%d,'%s')",id,name);
					stmt = conn.createStatement();
					stmt.executeUpdate(sql);
					stmt.close();
					
					sql = String.format("insert into test2(id,birth) values (%d,'%s')",id,birth);
					stmt = conn.createStatement();
					stmt.executeUpdate(sql);
					stmt.close();
					
					sql = String.format("insert into test3(id,tel) values (%d,'%s')",id,tel);
					stmt = conn.createStatement();
					stmt.executeUpdate(sql);
					stmt.close();

					
					conn.commit();
					break;
					
					 //test1로 들어가야함sql = String.format("insert into test2(id,birth) values (%d,'%s')",id,birth);
					
					
					
					
				case 2:
					break;
				case 3:
					DBConn.close();
					System.exit(0);
				
				}
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}
	
}
