package com.score6;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import com.db.DBConn;

//db에 insert하는 클래스
//Data Access Object
public class ScoreDAO {
	
	//insert
	public int insertData(ScoreDTO dto) {
		
		int result = 0;
		
		//DB연결
		Connection conn = DBConn.getConnection();
		
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			/*
			sql = "insert into score (hak,name,kor,eng,mat) ";
			sql+= "values ('";
			sql+= dto.getHak() + "','";
			sql+= dto.getName()	+ "',";
			sql+= dto.getKor() + ",";
			sql+= dto.getEng() + ",";
			sql+= dto.getMat() + ")";
			
			//sql이 잘 들어갔는지 확인하고 싶으면 아래 코드를 실행하면 된다.
			//System.out.println(sql);
			
			stmt = conn.createStatement();
			
			result = stmt.executeUpdate(sql);
			//잘 실행되면 result에 1, 안되면 0값을 반환한다. 
			 
			stmt.close();
			*/
			
			sql = "insert into score (hak,name,kor,eng,mat) ";
			sql+= "values(?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;

	}
	
	
	//update
	public int updateData(ScoreDTO dto) {
		
		int result = 0;
		
		Connection conn = DBConn.getConnection();
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			//PreparedStatement는 값이 들어가는 곳에 물음표를 쓰면 된다.
			sql = "update score set kor=?,eng=?,mat=? ";
			sql+= "where hak=?";
			
			//PreparedStatement를 만들때 sql을 검사한다.
			pstmt = conn.prepareStatement(sql);
			
			//숫자는 몇번째 물음표인지
			pstmt.setInt(1, dto.getKor());
			pstmt.setInt(2, dto.getEng());
			pstmt.setInt(3, dto.getMat());
			pstmt.setString(4, dto.getHak());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	
	//delete
	public int deleteData(String delHak) {
		
		int result = 0;
		
		Connection conn = DBConn.getConnection();
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete score where hak=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, delHak);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
