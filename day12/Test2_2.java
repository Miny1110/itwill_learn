package com.day12;

import java.util.Calendar;
import java.util.Scanner;

public class Test2_2 {

	public static void main(String[] args) {

		Calendar cal = Calendar.getInstance();
		Scanner sc = new Scanner(System.in);
		
		int y, m, i, week;
		
		do {
			System.out.print("년도? ");
			y = sc.nextInt();
		} while(y<1);
		
		do {
			System.out.print("월? ");
			m = sc.nextInt();
		} while(m<1 || m>12);
		
		
		cal.set(y, m-1, 1);

		week = cal.get(Calendar.DAY_OF_WEEK);
		
		
		//출력
		System.out.println("\n  일  월  화  수  목  금  토");
		System.out.println("------------------------------");
		
		for(i=1;i<week;i++) {
			System.out.print("    ");
		}
		
		for(i=1;i<cal.getActualMaximum(Calendar.DATE);i++	) {
			
			System.out.printf("%4d", i);
		}
		
		
		
	}

}
