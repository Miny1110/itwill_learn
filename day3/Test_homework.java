package com.day3;

import java.util.Scanner;

public class Test_homework {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		  
		System.out.println("1) 정수를 입력 받아서 짝수, 홀수를 구별해서 출력하시오.");
//		예) 3 입력시 -> 3 => 홀수
//		예) 4 입력시 -> 4 => 짝수
		int su;
		System.out.println();
		System.out.print("숫자를 입력하세요. ");
		
		su = sc.nextInt();
		
		String str; 
		str = su  == 0 ? "영" : (su %2 == 0 ? "짝수" : "홀수");
		
		System.out.println(su + " : " + str);
		
		System.out.println();
		System.out.println("2) 두 개의 정수를 입력 받고, 큰 숫자와 작은 숫자를 구분해서 출력하시오.(if문 이용)");
//		예) 20, 30 입력시 -> 큰 숫자 30, 작은 숫자 20
		int a, b;
		a = sc.nextInt();
		b = sc.nextInt();
		if(a>b) {
			System.out.println("큰 숫자 :" + a + ", 작은 숫자 :" + b);
		} else if (b>a) {
			System.out.println("큰 숫자 :" + b + ", 작은 숫자 :" + a);
		}
			
		System.out.println();
		System.out.println("3) 네 개의 정수를 입력 받고, 제일 큰 숫자와 제일 작은 숫자를 구분해서 출력하시오.(if문 이용)");		
//		예) 20, 30, 40, 50 입력시 -> 제일 큰 숫자 50, 제일 작은 숫자 20
		int c,d,e,f;
		c = sc.nextInt();
		d = sc.nextInt();
		e = sc.nextInt();
		f = sc.nextInt();
		
		if((c>d) && (c>e) && (c>f)) {
			System.out.println("제일 큰 숫자 : " + c);
		} else if((d>c) && (d>e) && (d>f)) {
			System.out.println("제일 큰 숫자 : " + d);
		} else if((e>c) && (e>d) && (e>f)) {
			System.out.println("제일 큰 숫자 : " + e);
		} else {
			System.out.println("제일 큰 숫자 : " + f);
		}
		
		if((c<d) && (c<e) && (c<f)) {
			System.out.println("제일 작은 숫자 : " + c);
		} else if((d<c) && (d<e) && (d<f)) {
			System.out.println("제일 작은 숫자 : " + d);
		} else if((e<c) && (e<d) && (e<f)) {
			System.out.println("제일 작은 숫자 : " + e);
		} else {
			System.out.println("제일 작은 숫자 : " + f);
		}
		
		System.out.println();
		System.out.print("4) 년도를 입력받고, 윤년인지 아닌지를 출력하시오.");
		
//		예) 2010 입력시 -> 2010 => 평년
//			2012 입력시 -> 2012 => 윤년
		int day;
		day = sc.nextInt();
		String year;
		year = day % 4 == 0 && day % 100 != 0 || day % 400 == 0 ? "윤년" : "평년";
		System.out.println(day + " => " + year );
		
		System.out.println();
		System.out.println("5) 단가 15,800원짜리 상품을 일정 수량 이상 구입시 할인을 해줍니다. 판매금액을 계산하시오.");
//		System.out.println();
//		할인율은 다음과 같습니다.
//		10개 이상 -> 10%
//		20개 이상 -> 15%
//		30개 이상 -> 20%
//		예) 구입수량 15개인 경우 -> 구입수량: 15개, 판매 총 금액: 213300원
//		판매금액을 계산해봅니다.

		int money = 15800;
		int num1;
		float sum;
		
		System.out.println();
		System.out.print("구입 수량을 입력하세요.");
		num1 = sc.nextInt();
		
		if(num1>=30) {
			sum = num1*money*0.8f;
		} else if (num1>=20) {
			sum = num1*money*0.85f;
		} else if (num1>=10) {
			sum = num1*money*0.9f;
		} else {
			sum = num1*money;
		}
		System.out.println();
		System.out.printf("판매 총 금액 : " + "%.0f\n", sum);
		
		System.out.println();
		System.out.println("6) 이름과 3과목의 점수를 입력 받아 다음조건에 따라 출력하시오.");
	
//		-모든 과목의 점수가 40점 이상이고 평균이 60점 이상이면 합격
//		-한과목이라도 40점 미만이고 평균이 60점 이상이면 과락
//		-평균이 60점 미만이면 불합격

//	    이름 ? 홍길동
//		세과목 점수 ? 60 70 80
//		이름 : 홍길동
//		총점 : 210, 평균 : 70, 판정 :합격
		
		String name, result = "";
		int kor, eng, math, tot, avg;
		
		System.out.print("이름? ");
		name = sc.next();

		System.out.print("3과목 점수는? :");
		kor = sc.nextInt();
		eng = sc.nextInt();
		math = sc.nextInt();

		tot = kor + eng + math;
		avg = (kor + eng + math)/3;
		
		if(kor >= 40 && eng >= 40 && math >= 40 && avg >= 60) {
			result = "합격";
		} else if (kor >= 40 || eng >= 40 || math >= 40 && avg >= 60 ) {
			result = "과락";
		} else if (avg < 60) {
			result = "불합격";
		}
	
		System.out.print("이름 : "+ name);
		System.out.print("총점 : " + tot + ", " + "평균 : " + avg + ", " + "판정 : " + result);
		
		
	}

}
