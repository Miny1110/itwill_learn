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
		
		do {
			System.out.print("년도? ");
			y = sc.nextInt();
		} while(y<1);
		
		do {
			System.out.print("월? ");
			m = sc.nextInt();
		} while(m<1 || m>12);
				
		do {
			System.out.print("일? ");
			d = sc.nextInt();
		} while(d<1 || d>cal.getActualMaximum(Calendar.MONTH));
		
		
		
		
		
		
		
		
		
		
	}

}
