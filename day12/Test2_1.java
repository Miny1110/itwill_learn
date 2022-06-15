package com.day12;

import java.util.Calendar;
import java.util.Scanner;

class Cal {
	
	//변수선언
	Calendar cal = Calendar.getInstance();
	Scanner sc = new Scanner(System.in);
	
	private int y, m, week, i;
	String[] title = {"일", "월", "화", "수", "목", "금", "토"};
	
	
	//날짜 세팅
	public void set() {
		
		//년도 입력
		do {
			System.out.print("년도? ");
			y = sc.nextInt();
		} while(y<1);
		
		
		//월 입력
		do {
			System.out.print("월? ");
			m = sc.nextInt();
		} while(m<1 || m>12);
		
		
		//입력값으로 날짜 설정
		cal.set(y, m-1, 1);
		
		week = cal.get(Calendar.DAY_OF_WEEK); //1~7 (1:일, 2:월 ... 7:토)
	}
	
	
	//출력메소드
	public void print() {
		
		//요일 출력
		for(i=0;i<title.length;i++) {
			System.out.printf("%s\t", title[i]);
		}
		System.out.println();
		
		
		//일 출력
		for(i=1;i<week;i++) {
			System.out.print("\t");
		}
		
		for(i=1;i<=cal.getActualMaximum(Calendar.DATE);i++) {
			System.out.printf("%d\t", i);
			
			if(week%7==0) {
				System.out.println();
			}
			week++;
		}
	}
}


public class Test2_1 {
	
	public static void main(String[] args) {

		Cal ob = new Cal();
		ob.set();
		ob.print();
		
	}
}
