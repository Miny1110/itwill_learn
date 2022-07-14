package com.score6;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

import com.db.DBConn;

import oracle.jdbc.OracleTypes;
import oracle.jdbc.oracore.OracleType;

//db에 insert하는 클래스
//Data Access Object
public class ScoreDAO {

	//insert
	public int insertData(ScoreDTO dto) {

		int result = 0;

		//DB연결
		Connection conn = DBConn.getConnection();

		//CallableStatement는 프로시저가 있을 때만 사용 가능하다. 프로시저가 없으면 사용 불가능하다.
		CallableStatement cstmt = null;
		String sql;

		try { 

			//insertScore라는 프로시저를 부른다.
			//프로시저는 cmd창에서 만들었다. 맨 밑에 코드 있다.
			sql = "{call insertScore(?,?,?,?,?)}";

			cstmt = conn.prepareCall(sql);

			cstmt.setString(1, dto.getHak());
			cstmt.setString(2, dto.getName());
			cstmt.setInt(3, dto.getKor());
			cstmt.setInt(4, dto.getEng());
			cstmt.setInt(5, dto.getMat());

			result = cstmt.executeUpdate();

			cstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//update
	public int updateData(ScoreDTO dto) {

		int result = 0;

		Connection conn = DBConn.getConnection();

		CallableStatement cstmt = null;
		String sql;

		try {

			sql = "{call updateScore(?,?,?,?)}";

			cstmt = conn.prepareCall(sql);

			cstmt.setString(1, dto.getHak());
			cstmt.setInt(2, dto.getKor());
			cstmt.setInt(3, dto.getEng());
			cstmt.setInt(4, dto.getMat());

			result = cstmt.executeUpdate();

			cstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//delete
	public int deleteData(String hak) {

		int result = 0;

		Connection conn = DBConn.getConnection();

		CallableStatement cstmt = null;
		String sql;

		try {

			sql = "{call deleteScore(?)}";

			cstmt = conn.prepareCall(sql);

			cstmt.setString(1, hak);

			result = cstmt.executeUpdate();

			cstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;

	}


	//selectAll
	//테이블을 반환해야 한다.
	public List<ScoreDTO> getList(){

		List<ScoreDTO> lists = new ArrayList<ScoreDTO>();
		Connection conn = DBConn.getConnection();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "{call selectAllScore(?)}";

			cstmt = conn.prepareCall(sql);


			//out 파라미터의 자료형 설정
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);

			//프로시저 실행
			cstmt.executeQuery();
			//실행해서 물음표로 값을 가져온다.

			//out 파라미터의 값을 받음
			rs = (ResultSet)cstmt.getObject(1); //ResultSet으로 downcast




			//데이터가 몇개 있는지 모르니까 while문 사용
			//데이터가 있으면-
			while(rs.next()) {

				//while문 밖에 객체생성을 하면 dto는 한번만 만들어진다.
				//그 상태로 반복문을 실행하게 되면 dto에는 마지막 데이터 하나만 들어가게 된다.
				//각각의 데이터를 각 dto에 담아서 그 dto를 list로 만들어야 한다.
				ScoreDTO dto = new ScoreDTO();

				dto.setHak(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setKor(rs.getInt(3));
				dto.setEng(rs.getInt(4));
				dto.setMat(rs.getInt(5));
				dto.setTot(rs.getInt(6));
				dto.setAve(rs.getInt(7));
				dto.setRank(rs.getInt(8));		

				/*
				숫자 대신에 컬럼명으로 써도 된다.
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				dto.setRank(rs.getInt("rank"));
				 */

				lists.add(dto);
			}

			rs.close();
			cstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}


	//이름 검색
	//오버로딩
	public List<ScoreDTO> getList(String name){

		List<ScoreDTO> lists = new ArrayList<>();

		Connection conn = DBConn.getConnection();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "{call selectNameScore(?,?)}";

			cstmt = conn.prepareCall(sql);

			cstmt.registerOutParameter(1, OracleTypes.CURSOR);

			cstmt.setString(2, name);

			cstmt.executeUpdate();

			rs = (ResultSet)cstmt.getObject(1);

			while(rs.next()) {

				ScoreDTO dto = new ScoreDTO();

				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));

				lists.add(dto);

			}

			rs.close();
			cstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}


	//학번검색
	public ScoreDTO getLists(String hak) {

		ScoreDTO dto = null;

		Connection conn = DBConn.getConnection();
		CallableStatement cstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "{call selectHakScore(?,?)}";

			cstmt = conn.prepareCall(sql);

			cstmt.registerOutParameter(1, OracleTypes.CURSOR);

			cstmt.setString(2, hak);

			cstmt.executeUpdate();

			rs = (ResultSet)cstmt.getObject(1);

			if(rs.next()) {

				dto = new ScoreDTO();

				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));

			}

			rs.close();
			cstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}


	/*프로시저 cmd창 입력

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









}
