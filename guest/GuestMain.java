package com.guest;

import java.util.Scanner;

public class GuestMain {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		int ch;
		Guest ob = new Guest();
		
		while(true) {
			
			do {
				System.out.println("1.기본정보입력 2.방명록작성 3.방명록수정 4.방명록삭제 5.방명록확인 6.종료");
				
				ch = sc.nextInt();
				
			}while(ch<1 || ch>7);
			
			
			switch(ch) {
			
			case 1: ob.insert(); break;
			case 2: ob.write(); break;
			case 3: ob.modify(); break;
			case 4:
			case 5:
			case 6:
			default: break;
			
			
			}
			
			
			
			
		}
		
		
		
		
	}

}
