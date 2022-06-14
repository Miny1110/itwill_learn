package com.day12;

import java.util.Calendar;
import java.util.Scanner;

public class Test2 {

	public static void main(String[] args) {

		//만년달력
		Calendar cal = Calendar.getInstance();
		Scanner sc = new Scanner(System.in);
		
		//변수선언
		int y, m, i, week;
		
		//년도 입력. 입력값이 1 미만이면 다시 질문 (반복문 실행)
		do {
			System.out.print("년도? ");
			y = sc.nextInt();
		} while(y<1);
		
		//월 입력. 입력값이 1 미만 또는 12 초과면 다시 질문 (반복문 실행)
		do {
			System.out.print("월? ");
			m = sc.nextInt();
		} while(m<1 || m>12);
		
		
		//set(): 원하는 값으로 날짜나 시간 설정
		//cal.set(year, month, date);
		//Calendar에서 MONTH는 0~11이기 때문에(1월:0, 2월:1, 3월:2...) 입력값-1로 넣어주어야 한다.
		cal.set(y, m-1, 1);

		
		//입력한 년도-월의 1일의 요일값(을 숫자로)을 나타낸다.
		//입력한 년도-월의 1일이 수요일이면 week는 4
		week = cal.get(Calendar.DAY_OF_WEEK); //DAY_OF_WEEK: 1~7 (1:일요일 , 7:토요일)

		
		//요일을 담은 배열
		String[] day = {"일","월","화","수","목","금","토"};
		
		
		//배열에 있는 요일을 반복문을 통해 출력
		for(i=0;i<day.length;i++) {
			System.out.printf("%s\t", day[i]);
		}
		
		//요일 아래에 날짜 출력을 위한 엔터
		//엔터 안하면 요일 옆에 날짜 출력된다.
		System.out.println();
		
		
		//해당 월의 1일이 시작되는 요일 전까지 공백을 출력한다.
		for(i=1;i<week;i++) {
			System.out.print("\t");
		}
		
		
		//getActualMaximum(Calendar.DATE): 이 달의 마지막 일자
		//1일부터 해당 월의 마지막 날까지 출력한다.
		for(i=1;i<=cal.getActualMaximum(Calendar.DATE);i++) {
			System.out.printf("%d\t", i);
			//만약 요일값을 7로 나눈 나머지가 0이라면: 토요일이라면
			//엔터: 줄바꾸고 일요일부터 새로 시작
			if(week%7==0) {
				System.out.println();
			}
			//week도 1씩 증가한다. (8:일, 9:월, 10:화, 11:수...)
			//증가하지 않으면 week는 입력한 날의 1일 요일값으로 고정되어 있다.
			week++;
		}

	}

}

/*
참고블로그
https://12716.tistory.com/entry/Java-Calendar-%ED%81%B4%EB%9E%98%EC%8A%A4%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EB%8B%AC%EB%A0%A5calendar
*/


