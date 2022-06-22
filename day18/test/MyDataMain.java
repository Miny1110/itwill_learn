package com.day18.test;


import java.util.Scanner;

public class MyDataMain {

	public static void main(String[] args) throws Exception {

		Scanner sc = new Scanner(System.in);
	
		MyDataImpl ob = new MyDataImpl();
		
		int ch;
		
		while(true) {
			
			do {
				System.out.println("--------------------");
				System.out.print("1.입력 2.출력 3.종료\n");
				System.out.println("--------------------");
				System.out.print("숫자를 입력하세요: ");
				ch = sc.nextInt();
			} while(ch<1);
			
			
			switch(ch) {
			case 1:
				ob.input(); break;
			case 2:
				ob.print(); break;			
			default:
				ob.save();
				System.exit(0); //무조건 프로그램 종료
			}
			
		}
		
		
		
	}

}


