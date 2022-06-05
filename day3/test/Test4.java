package com.day3.test;

import java.util.Scanner;


/*
4. 년도를 입력받고, 윤년인지 아닌지를 출력.
예) 2010 입력시 -> 2010 => 평년
    2012 입력시 -> 2012 => 윤년
 */


public class Test4 {

	public static void main(String[] args) {
		
		int year;
		String str;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("년도를 입력하세요.");
		
		year = sc.nextInt();
		
		str = (year%4 == 0 && year%100 != 0 || year%400 == 0) ? "윤년" : "평년"; 
		
		System.out.println(str);
		
		
	}

}
