package com.day15.test;

import java.util.Scanner;

public class TicketMain {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		Ticket ob = new TicketImpl();
		
		int i;
		
		while(true) {
			
			do {
				System.out.println("----------------------");
				System.out.println("1.작품예매 2.예매확인 3.예매취소 4.좌석변경 5.예매자검색 6.작품검색 7.종료");
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
				ob.searchCname(); break;
			case 6:
				ob.searchPname(); break;
			default:
				System.out.println("예매시스템을 종료합니다.");
				System.exit(0);
			}
		}
	}
}
