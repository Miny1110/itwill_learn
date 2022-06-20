package com.naver;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class NaverImpl implements Naver {

	private List<NaverVO> lists = new ArrayList<NaverVO>();
	Scanner sc = new Scanner(System.in);


	@Override
	public void input() throws Exception {

		NaverVO vo = new NaverVO();


		System.out.print("아이디?[8~15자 이내, 영문자 숫자 혼용] ");
		vo.setId(sc.next());

		if(searchID(vo.getId())) {
			throw new Exception("아이디가 존재합니다");
		}
		
		if(vo.getId().length()<8 || vo.getId().length()>15) {
			throw new Exception("아이디는 8~15자 이내입니다");
			
		}
		
		int eng=0, num=0;
		for(int i=0;i<vo.getId().length();i++) {
			char ch = vo.getId().charAt(i);
			
			if((ch>='A'&&ch<='Z') || (ch>='a'&&ch<='z')) {
				eng++;
			} else if(ch>='0' && ch<='9') {
				num++;
			}
		}
		if(eng==0 || num==0) {
			throw new Exception("영문자 숫자 혼용하세요");
		}
		


		System.out.print("비밀번호? ");
		vo.setPw1(sc.next());
		
		System.out.print("비밀번호 재확인? ");
		if(!(vo.getPw1().equals(sc.next()))) {
			throw new Exception("비밀번호가 재확인 오류");
		}

		
		
		
		System.out.print("이름? ");
		vo.setName(sc.next());
		
		
		
		System.out.print("성별?[F/M] ");
		vo.setGender(sc.next());
		if(!(vo.getGender().equals("M") || vo.getGender().equals("F"))){
			throw new Exception("성별 오류");
		}
		
		
		
		System.out.print("생년월일?[220620] ");
		vo.setBirth(sc.next());
		if(vo.getBirth().length()!=6) {
			throw new Exception("생년월일 오류");
		}
		
		
		
		
		System.out.print("비상연락용 이메일?[abc@naver.com] ");
		vo.setEmail(sc.next());
		int com=0;
		for(int i=0;i<vo.getEmail().length();i++) {
			char ch = vo.getEmail().charAt(i);
			
			if(ch=='@') {
				com++;
			}
		}
		if(com==0) {
			throw new Exception("이메일 오류");
		}
		
		
		

		System.out.print("휴대전화번호?[01234567890] ");
		vo.setTel(sc.next());
		if(vo.getTel().length()!=11) {
			throw new Exception("휴대전화번호 오류");
		}

		
		System.out.println("회원가입 성공!!");
		System.out.println();
		lists.add(vo);
		

	}



	@Override
	public boolean searchID(String id) {

		Iterator<NaverVO> it = lists.iterator();

		boolean flag = false;

		while(it.hasNext()) {
			NaverVO vo = it.next();

			if(vo.getId().equals(id)) {
				flag = true;
			} else {
				flag = false;
			}
		}
		return flag;

	}



	@Override
	public void print() {
		
		Iterator<NaverVO> it = lists.iterator();
		
		while(it.hasNext()) {
			NaverVO vo = it.next();
			System.out.println(vo.toString());
		}
		
	}

	@Override
	public void findID() {
		
		System.out.println("검색할 아이디?"); //222
		String id = sc.next();

		Iterator<NaverVO> it = lists.iterator();
		while(it.hasNext()) {

			NaverVO vo = it.next();

			if(id.equals(vo.getId())) {
				System.out.println(vo.toString());
				break;
			}
		}
		
	}





}
