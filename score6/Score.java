package com.score6;

import java.util.Scanner;

//사용자한테 데이터를 받아내는 클래스

public class Score {

	Scanner sc = new Scanner(System.in);
	ScoreDAO dao = new ScoreDAO();
	
	//입력 메소드
	//main에서 호출할 메소드
	public void insert() {
		
		ScoreDTO dto =new ScoreDTO();
		//Score가 5개의 값을 받아서 dto에 담아뒀다.
		//dto를 ScoreDAO에 보내면 ScoreDAO는 insertData를 사용해서 DB에 데이터를 넣는다.
		
		System.out.print("학번?");
		dto.setHak(sc.next());

		System.out.print("이름?");
		dto.setName(sc.next());
		
		System.out.print("국어?");
		dto.setKor(sc.nextInt());
		
		System.out.print("영어?");
		dto.setEng(sc.nextInt());
		
		System.out.print("수학?");
		dto.setMat(sc.nextInt());
		
		//int result로 받지 않고 그냥 dao.insertData(dto);만 써도 된다.
		int result = dao.insertData(dto);
		
		if(result!=0) {
			System.out.println("추가 성공!");
		}else {
			System.out.println("추가 실패!");
		}
		
	}
	
	
	//수정 메소드
	public void update() {
		
		ScoreDTO dto = new ScoreDTO();
		
		System.out.println("수정할 학번? ");
		dto.setHak(sc.next());
		
		System.out.print("국어?");
		dto.setKor(sc.nextInt());
		
		System.out.print("영어?");
		dto.setEng(sc.nextInt());
		
		System.out.print("수학?");
		dto.setMat(sc.nextInt());
		
		int result = dao.updateData(dto);
		
		if(result!=0) {
			System.out.println("수정 성공!");
		}else {
			System.out.println("수정 실패!");
		}
		
	}
	
	
	//삭제 메소드
	public void delete() {
		
		System.out.println("삭제할 학번? ");
		String delHak = sc.next();
		
		int result = dao.deleteData(delHak);
		
		if(result!=0) {
			System.out.println("삭제 성공!");
		}else {
			System.out.println("삭제 실패!");
		}
		
	}
	
}
