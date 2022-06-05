package com.day3.test;

import java.util.Scanner;


/*
3. 네 개의 정수를 입력 받고, 제일 큰 숫자와 제일 작은 숫자를 구분해서 출력.(if문 이용)
예) 20, 30, 40, 50 입력시 -> 제일 큰 숫자 50, 제일 작은 숫자 20
 */


public class Test3 {

	public static void main(String[] args) {
		
		int num1, num2, num3, num4;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("네 개의 수를 입력하세요.");
		
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		num3 = sc.nextInt();
		num4 = sc.nextInt();
		
		int max = 0;
		int min = 0;
		
		if(num1>max) {
			max = num1;
		} 
		if(num2>max) {
			max = num2;
		}
		if(num3>max) {
			max = num3;
		}
		if(num4>max) {
			max = num4;
		}
		
		if(num1>min) {
			min = num1;
		} 
		if(num2<min) {
			min = num2;
		}
		if(num3<min) {
			min = num3;
		}
		if(num4<min) {
			min = num4;
		}
		
		System.out.printf("제일 큰 숫자: %d, 제일 작은 숫자: %d", max, min);
	}

}
