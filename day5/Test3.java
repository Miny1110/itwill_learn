package com.day5;

import java.util.Scanner;

public class Test3 {

	public static void main(String[] args) {
		System.out.println("[원하는 요일 출력하기]\n");
		// 년(y), 월(m), 일(d)
		// 2022년 6월 20일 월요일

		Scanner sc = new Scanner(System.in);

		int months[] = {31,28,31,30,31,30,31,31,30,31,30,31};

		int y, m, d, nalsu, i, week;

		do {

			System.out.print("원하는 년도 입력 : "); //2022
			y = sc.nextInt();

		} while(y<1); 

		do {

			System.out.print("원하는 달을 입력 : "); //6
			m = sc.nextInt();

		} while (m<1 || m>12);

		//y년이 윤년인지 확인해줘야 한다.
		/*
		윤년은 년도만 입력하면 확인할 수 있기 때문에 년도 아래에 위치해도 된다.
		위치 아니면 달 아래에 입력하기, 일수 아래에 입력하면 윤년 계산이 안되서 
		2월 30일과 같이 없는 날짜의 값이 출력이 된다.
		*/
		
		if(y%4==0 && y%100!=0 || y%400==0) {
			months[1] = 29;
		}
		
		do {

			System.out.print("원하는 일수 입력 : "); //20
			d = sc.nextInt();

		} while (d<1 || d>months[m-1]);

		nalsu = (y-1)*365 + (y-1)/4-(y-1)/100 + (y-1)/400;

		for(i=0; i<m-1; i++) {
			nalsu += months[i];
		}
		
		//m월 d일의 날 수
		nalsu += d;

		week = (nalsu % 7);
		
		String day[] = {"일","월","화","수","목","금","토"};
		
		System.out.printf("%d년 %d월 %d일 %s요일", y, m, d, day[week] );
		
		
	}
	
}