package com.day3.test;

import java.util.Scanner;


/*
6. 이름과 3과목의 점수를 입력 받아 다음조건에 따라 출력
	-모든 과목의 점수가 40점 이상이고 평균이 60점 이상이면 합격
	-한과목이라도 40점 미만이고 평균이 60점 이상이면 과락
	-평균이 60점 미만이면 불합격

이름 ? 홍길동
세과목 점수 ? 60 70 80
이름 : 홍길동
총점 : 210, 평균 : 70, 판정 :합격
 */


public class Test6 {

	public static void main(String[] args) {
		
		String name = "";
		String result = "";
		int num1, num2, num3;
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("이름? ");
		name = sc.next();
		
		System.out.print("세 과목 점수? ");
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		num3 = sc.nextInt();
		
		int sum = num1 + num2 + num3;
		float avg = sum / 3;
		
		if(num1>=40 && num2>=40 && num3>=40 && avg>=60) {
			result = "합격";
		} else if((num1<40 || num2<40 || num3 <40) && avg >=60) {
			result = "과락";
		} else if(avg<60) {
			result = "불합격";
		}
			
		System.out.printf("이름 : %s%n", name);
		System.out.printf("총점 : %d, 평균 : %.1f, 판정 : %s", sum, avg, result);
		
	}

}
