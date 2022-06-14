package com.day12;

import java.util.Calendar;
import java.util.Scanner;

public class Test2 {

	public static void main(String[] args) {

		//만년달력
		Calendar cal = Calendar.getInstance();
		Scanner sc = new Scanner(System.in);

		int y, m, i, week;
		week = 0;

		do {
			System.out.print("년도? ");
			y = sc.nextInt();
		} while(y<1);
		
		do {
			System.out.print("월? ");
			m = sc.nextInt();
		} while(m<1 || m>12);
		
		
		cal.set(y, m-1, 1);
		for(i=1;i<y;i++) {
			week += cal.getActualMaximum(Calendar.DAY_OF_YEAR);
		}
		System.out.println(week);
		
		for(i=1;i<cal.getActualMaximum(Calendar.DAY_OF_MONTH);i++) {
			week += i;
		}
		
		
		week = cal.get(Calendar.DAY_OF_WEEK); //1~7 (1:일요일 7:토요일)
		
		
		
		//출력
		
		
		
		
		

	}

}
