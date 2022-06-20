package com.naver;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

class NaverAuthen {

	List<NaverVO2> lists1 = new ArrayList<NaverVO2>();
	Scanner sc = new Scanner(System.in);


	public void input(String id) throws Exception {

		NaverVO2 vo = new NaverVO2();
/*
		if(searchID(id)) {
			throw new Exception("아이디가 존재합니다");
		}
*/
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



		System.out.print("성별?[남/여] ");
		vo.setGender(sc.next());
		if(!(vo.getGender().equals("남") || vo.getGender().equals("여"))){
			throw new Exception("성별 오류");
		}



		System.out.print("생년월일?[220620] ");
		vo.setBirth(sc.next());
		if(vo.getBirth().length()!=6) {
			throw new Exception("생년월일 오류");
		}




		System.out.println("비상연락용 이메일?[abc@naver.com] ");
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
		if(vo.getEmail().length()!=11) {
			throw new Exception("휴대전화번호 오류");
		}


		lists1.add(vo);

	}

/*
	public boolean searchID(String id) {

		Iterator<NaverVO2> it = lists1.iterator();

		boolean flag = false;

		while(it.hasNext()) {
			NaverVO2 vo = it.next();

			if(vo.getId().equals(id)) {
				flag = true;
			} else {
				flag = false;
			}
		}
		return flag;

	}
*/



	public void print() {

		Iterator<NaverVO2> it = lists1.iterator();

		while(it.hasNext()) {
			NaverVO2 vo = it.next();
			System.out.println(vo.toString());
		}


	}

}



public class Naver2 {


	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String id;

		NaverAuthen auth = new NaverAuthen();

		try {

			System.out.print("아이디?[8~15자 이내, 영문자 숫자 혼용] ");
			id = sc.next();
			System.out.println(id);

			auth.input(id);
			auth.print();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

}
