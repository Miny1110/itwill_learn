package com.day3;

import java.util.Scanner;

public class Test_homework_correct {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.println("[답안지]");

		System.out.println("1) 정수를 입력 받아서 짝수, 홀수를 구별해서 출력하시오.");
		//		예) 3 입력시 -> 3 => 홀수
		//		예) 4 입력시 -> 4 => 짝수


		System.out.println();
		System.out.println("2) 두 개의 정수를 입력 받고, 큰 숫자와 작은 숫자를 구분해서 출력하시오.(if문 이용)");
		//		예) 20, 30 입력시 -> 큰 숫자 30, 작은 숫자 20
		int a1, b1;
		System.out.print("첫번째 정수입력 ?");
		a1 = sc.nextInt();

		System.out.print("두번째 정수입력 ?");
		b1 = sc.nextInt();

		if (a1 > b1) 
			System.out.println("큰 숫자 : " + a1 + " 작은 숫자 : " + b1);
		else
			System.out.println("큰 숫자 : " + b1+ " 작은 숫자 : " + a1);


		System.out.println();
		System.out.println("3) 네 개의 정수를 입력 받고, 제일 큰 숫자와 제일 작은 숫자를 구분해서 출력하시오.(if문 이용)");		
		//		예) 20, 30, 40, 50 입력시 -> 제일 큰 숫자 50, 제일 작은 숫자 20
		int a,b,c,d,max=0,min=0;

		System.out.print("4개의 정수입력 ?");

		a=sc.nextInt();
		b=sc.nextInt();
		c=sc.nextInt();
		d=sc.nextInt();

		max = min = a;

		if(a > max)
			max = a;

		if(a < min)
			min = a;

		if(b > max)
			max = b;

		if(b < min)
			min = b;

		if(c > max)
			max = c;

		if(c < min)
			min = c;

		if(d > max)
			max = d;

		if(d < min)
			min = d;

		//else if나 삼항 연산자로는 불가능

		System.out.println("제일 큰 숫자 "+ max +", 제일 작은 숫자 "+ min);


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
		
		int cnt, qty=15800;
		double sum=0;

		System.out.print("구입 수량을 입력하세요 : ");

		cnt = sc.nextInt();

		if(cnt >=30)
			sum=cnt*qty*0.8;
		else if(cnt >=20)
			sum=cnt*qty*0.85;
		else if(cnt >=10)
			sum=cnt*qty*0.9;
		else
			sum=cnt*qty;

		System.out.println("구입수량 : " + cnt + "개, 판매총금액 : " + sum +"원");


		System.out.println();
		System.out.println("6) 이름과 3과목의 점수를 입력 받아 다음조건에 따라 출력하시오.");

		//		-모든 과목의 점수가 40점 이상이고 평균이 60점 이상이면 합격
		//		-한과목이라도 40점 미만이고 평균이 60점 이상이면 과락
		//		-평균이 60점 미만이면 불합격

		//	    이름 ? 홍길동
		//		세과목 점수 ? 60 70 80
		//		이름 : 홍길동
		//		총점 : 210, 평균 : 70, 판정 :합격

		String name;
		int kor,eng,mat,tot,avg;
		String pan;

		System.out.print("이름 ? ");
		name=sc.next();
		System.out.print("세과목 점수 ?");
		kor=sc.nextInt();
		eng=sc.nextInt();
		mat=sc.nextInt();

		tot=kor+eng+mat;
		avg=tot/3;

		if(kor>=40&&eng>=40&&mat>=40&&avg>=60)
			pan="합격";
		else if(avg>=60)
			pan="과락";
		else
			pan="불합격";

		System.out.println("이름 : " + name);
		System.out.println("총점 : " + tot + " 평균 : " + avg + " 판정 : " + pan);

	}

}
