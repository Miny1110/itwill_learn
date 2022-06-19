package com.day15.test;

import java.util.Scanner;

public class HealthMain {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		Health ob = new HealthImpl();

		int i;

		while(true) {
			do {
				System.out.println("----------------------");
				System.out.println("1.회원등록 2.출력 3.삭제 4.수정 5.아이디검색 6.이름검색 7.종료");
				System.out.println("----------------------");
				System.out.print("숫자를 입력하세요: ");
				i = sc.nextInt();
			} while(i<1);

			switch(i) {
			case 1:
				ob.input(); break;
			case 2:
				ob.print(); break;
			case 3:
				ob.delete(); break;
			case 4:
				ob.update(); break;
			case 5:
				ob.fidnID(); break;
			case 6:
				ob.findName(); break;
			default:
				System.out.println("회원정보 서비스를 종료합니다");
				System.exit(0);
			}

		}

	}
}
