package com.day3.test;

import java.util.Scanner;


/*
1.정수를 입력 받아서 짝수, 홀수를 구별해서 출력.
예) 3 입력시 -> 3 => 홀수
예) 4 입력시 -> 4 => 짝수
 */
 

public class Test1 {

	public static void main(String[] args) {
		
		int num;
		String str;
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("수를 입력하세요. ");
		num = sc.nextInt();
		
		str = (num == 0) ? "영" : (num%2 == 0 ? "짝수" : "홀수");
		
		System.out.println(str);
	}

}
