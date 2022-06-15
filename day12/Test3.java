package com.day12;

import java.util.Calendar;
import java.util.Scanner;

public class Test3 {

	public static void main(String[] args) {

		//오늘을 기준으로 x일 후 년-월-일 요일
		//년도? 2022
		//월? 6
		//일? 14
		//며칠 후? 100
		//만난 날: 2022년 6월 14일 화요일
		//100일 후: ~~
		
		Calendar cal = Calendar.getInstance();
		Scanner sc = new Scanner(System.in);
			
		int y, m, d, x, i;
		String title[] = {"일", "월", "화", "수", "목", "금", "토"};
			
		do {
			System.out.print("년도? ");
			y = sc.nextInt();
		} while(y<1);
		
		do {
			System.out.print("월? ");
			m = sc.nextInt();
		} while(m<1 || m>12);
			
		
		//입력년, 월의 1일을 날짜로 세팅
		cal.set(y, m-1, 1);
		
		do {
			System.out.print("일? ");
			d = sc.nextInt();
		} while(d<1 || d>cal.getActualMaximum(Calendar.DATE));
		
		
		//입력년, 월, 일로 날짜 재세팅
		cal.set(y, m-1, d);
		String week = title[cal.get(Calendar.DAY_OF_WEEK)-1];
		
		
		do {
			System.out.print("며칠 후? ");
			x = sc.nextInt();
		} while(x<1);
		
		
		y = cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1;
		d = cal.get(Calendar.DATE);
		
		System.out.printf("만난 날: %d년 %d월 %d일 %s요일\n", y, m, d, week);
		
		cal.add(Calendar.DATE, x);
		week = title[cal.get(Calendar.DAY_OF_WEEK)-1];
		y = cal.get(Calendar.YEAR);
		m = cal.get(Calendar.MONTH)+1;
		d = cal.get(Calendar.DATE);
		System.out.printf("%d일 후: %d년 %d월 %d일 %s요일", x, y, m, d, week);
		
		
		
		
		
	}

}
