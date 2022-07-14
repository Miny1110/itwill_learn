package com.guest;

import java.util.List;
import java.util.Scanner;


public class Guest {

	//메소드 호출

	Scanner sc = new Scanner(System.in);
	GuestDAO dao = new GuestDAO();
	List<GuestDTO> lists=null;

	//기본정보 입력
	public void insert() {

		GuestDTO dto = new GuestDTO();

		System.out.print("아이디?");
		dto.setId(sc.next());

		System.out.print("비밀번호?");
		dto.setPwd(sc.nextInt());

		System.out.print("이름?");
		dto.setName(sc.next());

		int result = dao.insertData(dto);

		if(result!=0) {
			System.out.println("추가 성공!");
		}else {
			System.out.println("추가 실패!");
		}

	}


	//방명록 작성
	public void write() {

		GuestDTO dto = new GuestDTO();

		System.out.print("아이디?");
		dto.setId(sc.next());

		System.out.print("내용?");
		dto.setContent(sc.next());

		int result = dao.writeData(dto);

		if(result!=0) {
			System.out.println("추가 성공!");
		}else {
			System.out.println("추가 실패!");
		}


	}



	//방명록 수정
	public void modify(){
		
		GuestDTO dto = new GuestDTO();

		System.out.print("아이디?");
		dto.setId(sc.next());

		System.out.print("내용?");
		dto.setContent(sc.next());

		int result = dao.modifyData(dto);

		if(result!=0) {
			System.out.println("수정 성공!");
		}else {
			System.out.println("수정 실패!");
		}

	}


	//방명록 삭제
	public void delete() {

		System.out.println("아이디?");
		String id = sc.next();

		int result = dao.deleteData(id);

		if(result!=0) {
			System.out.println("삭제 성공!");
		}else {
			System.out.println("삭제 실패!");
		}

	}


	//방명록 확인
	public void check() {
		
		GuestDTO dto = new GuestDTO();
		
		System.out.println("아이디?");
		dto.setId(sc.next());
		
		int result = dao.checkData(dto);
		
		if(result!=0) {
			System.out.println("확인 성공!");
		}else {
			System.out.println("확인 실패!");
		}


	}



}
