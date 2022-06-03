package com.day5;

import java.util.Scanner;

public class Test2 {

	public static void main(String[] args) {
		System.out.println("[배열을 이용하여 만년달력 만들기]");
		System.out.println();

		Scanner sc = new Scanner(System.in);

		//배열은 12개를 만든 것이고, 그 배열 안에 값을 넣은것이다.
		//배열에 들어가는 값이 정해져있을 때는 배열을 만들면서 값을 초기화한다.
		int months[] = {31,28,31,30,31,30,31,31,30,31,30,31};

		int y, m, nalsu, i, week;
		
		do {
		
			System.out.print("원하는 년도를 입력하시오."); //2022
			y = sc.nextInt();
	
		} while(y<1); 
		
		do {
		
			System.out.print("원하는 달을 입력하시오."); //6
			m = sc.nextInt();
		
		} while (m<1 || m>12);
		
		//y년이 윤년인지 확인해줘야 한다.
		//윤년이 아니라면 값을 건너뛰고 처음에 지정한 값으로 출력된다.
		if(y%4==0 && y%100!=0 || y%400==0) {
			months[1] = 29;
		}
		
		//1년 1월 1일부터 (y-1)년 12월 31일까지 날의 수를 계산한다.
		// &&(AND)는 빼기 ||(OR)은 더하기
		nalsu = (y-1)*365 + (y-1)/4-(y-1)/100 + (y-1)/400;
		
		//int yy = (y-1)/4-(y-1)/100+(y-1)/400;
		//System.out.println(nalsu);
		//System.out.println(yy);
		
		//(m-1)월 까지의 날의 수를 계산한다.
		// 월(m) :   1, 2  3  4  5  6  7  8  9 10 11 12
		//months : {31,28,31,30,31,30,31,31,30,31,30,31};
		//index  :   0  1  2  3  4  5  6  7  8  9 10 11
		for(i=0; i<m-1; i++) {
			nalsu += months[i];
		}

		//System.out.println(nalsu);

		//m월 1일의 날 수
		nalsu += 1; // nalsu = nalsu + 1;
		
		week = nalsu % 7;
		
		//System.out.println(week);
		
		//디자인 부분
		System.out.println("\n  일  월  화  수  목  금  토"); 
		System.out.println("------------------------------");
		// 스페이스 바 : 1byte, 한글 :  2byte, "  일" : 4byte
		// 0에서 부터 week 직전까지 공백을 넣어주어야 원하는 요일에 1일이 표시가된다.
		
		// 특정요일부터 시작하도록 공백 지적
		for(i=0;i<week;i++) {
			System.out.print("    "); //공백 4칸을 입력
		}
		
		//해당 월의 날짜 출력
		for(i=1; i<=months[m-1];i++) {
			
			System.out.printf("%4d", i);
			
			week++;
			
			if(week%7==0) {
				System.out.println();
			}
			
		}
		
		if(week%7 != 0) {
			System.out.println();
		}
		
		System.out.println("------------------------------");
		
		

	}

}
