package com.day3.test;

import java.util.Scanner;

/*
 2.두 개의 정수를 입력 받고, 큰 숫자와 작은 숫자를 구분해서 출력.(if문 이용)
예) 20, 30 입력시 -> 큰 숫자 30, 작은 숫자 20
 */


public class Test2 {

	public static void main(String[] args) {
		
		int num1, num2;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("두 개의 수를 입력하세요.");
		
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		
		if(num1>num2) {
			System.out.printf("큰 숫자: %d, 작은 숫자: %d", num1, num2);
		} else if(num2>num1){
			System.out.printf("큰 숫자: %d, 작은 숫자: %d", num2, num1);
		} else {
			System.out.println("수가 같습니다.");
		}
		
		
	}

}
