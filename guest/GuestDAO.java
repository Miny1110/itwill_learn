package com.guest;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.db.DBConn;

public class GuestDAO {

	//기본정보 입력
	public int insertData(GuestDTO dto) {

		int result = 0;

		Connection conn = DBConn.getConnection();

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into guestCustom(id,pwd,name) values (?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setInt(2, dto.getPwd());
			pstmt.setString(3, dto.getName());

			result = pstmt.executeUpdate();
			pstmt.close();

/*
			sql = "insert into guestRecord(id) values (?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			
			result = pstmt.executeUpdate();
			pstmt.close();
*/

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//방명록 작성
	public int writeData(GuestDTO dto) {

		int result = 0;

		Connection conn = DBConn.getConnection();

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into guestRecord values (?,?,sysdate) ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getContent());
			
			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//방명록 수정
	public int modifyData(GuestDTO dto) {

		int result = 0;

		Connection conn = DBConn.getConnection();

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "update guestRecord set content=? ";
			sql+= "where id=?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getId());

			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//방명록 삭제
	public int deleteData(String id) {
		
		int result = 0;
		
		Connection conn = DBConn.getConnection();
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete guestRecord where id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}

	
	//방명록 확인
	public int checkData(GuestDTO dto) {
		
		int result = 0;
		
		Connection conn = DBConn.getConnection();
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "select id,content,created from guestRecord where id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println("확인 실패!");
		}
		
		return result;
		
	}

}
