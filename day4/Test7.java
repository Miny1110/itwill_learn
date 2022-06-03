package com.day4;

import java.util.Scanner;

public class Test7 {

	public static void main(String[] args) {
		System.out.println("[Switch문]");
		System.out.println();
		//모든 자료형과 string 사용할 수 있다.
		
		Scanner sc = new Scanner(System.in);
		
		int su;
		
		System.out.print("1~3 이내의 수를 입력하시오.");
		su = sc.nextInt();
		
		switch(su) {
		
		case 3:
			System.out.println("***");
			break;
		case 2:
			System.out.println("**");
			break;
		case 1:
			System.out.println("*");
			break;
		default: // else와 같이 생략이 가능하다.
			System.out.println("숫자 입력 오류!!");
			break; //생략 가능, 어차피 마지막 값이기 때문에.
		
		}
		
		
	}

}
