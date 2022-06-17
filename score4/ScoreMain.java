package com.score4;

import java.util.Scanner;

public class ScoreMain {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		
		Score ob = new ScoreImpl();
		
		int ch;
		
		while(true) {
			
			do {
				System.out.println("----------------------");
				System.out.print("1.입력 2.출력 3.삭제 4.수정 5.학번검색 6.이름검색 7.종료\n");
				System.out.println("----------------------");
				System.out.print("숫자를 입력하세요: ");
				ch = sc.nextInt();
			} while(ch<1);
			
			
			switch(ch) {
			case 1:
				ob.input(); break;
			case 2:
				ob.print(); break;
			case 3:
				ob.delete(); break;
			case 4:
				ob.update(); break;
			case 5:
				ob.findHak(); break;
			case 6:
				ob.findName(); break;			
			default:
				System.out.println("학사정보 시스템을 종료합니다.");
				System.exit(0); //무조건 프로그램 종료
			}
			
		}
		
//------------------------------------------------------------------------------
/*	
		ScoreVO vo = new ScoreVO();
		
		//vo.set("111", "배수지", 60, 70, 80);
		vo.setHak("a123");
		vo.setName("배수지");
		vo.setKor(90);
		vo.setEng(80);
		vo.setMat(70);
		
		String str = vo.toString();
		System.out.println(str);
		
		//위에 두문장 합친거
		//System.out.println(vo.print());

		
		System.out.println(vo.getName());
		System.out.println(vo.getKor());
*/		
//------------------------------------------------------------------------------
/*		
		//오버로딩된 생성자를 통해 객체생성과 초기화 동시에
		ScoreVO vo1 = new ScoreVO("222", "강아랑", 80, 90, 70);
	
		str = vo1.toString();
		System.out.println(str);
*/
//------------------------------------------------------------------------------
		
	}

}
