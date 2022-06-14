package com.day12;

import java.util.Calendar;
//import java.util.GregorianCalendar;

//Calendar
//현재 날짜와 시간을 읽어와서 처리해주는 클래스

public class Test1 {

	public static void main(String[] args) {
		
		//둘 중 하나 쓰면 된다.
		
		Calendar now = Calendar.getInstance();
		//Calendar now = new GregorianCalendar(); //UPCAST: 자식을 객체화해서 부모클래스 안에 넣는 것
		
		//YEAR, MONTH, DATE, DAY_OF_WEEK: static 변수
		int y = now.get(Calendar.YEAR); //년
		int m = now.get(Calendar.MONTH) + 1; //월 (0~11로 저장되어 있다.)
		int d = now.get(Calendar.DATE); //일
		int w = now.get(Calendar.DAY_OF_WEEK); //주의 수(1~7로 저장되어 있다. 1:일요일, 7:토요일)
		
		String[] week = {"일","월","화","수","목","금","토"};
		
		System.out.println(y + "-" + m + "-" + d + "-" + week[w-1]);
		
		
		
		//시작일과 말일 출력하기
		int startDay = now.getActualMinimum(Calendar.DATE);
		int endDay = now.getActualMaximum(Calendar.DATE);
		
		System.out.println(startDay + ":" + endDay);
		
		
		
		//날짜와 시간 출력하기
		System.out.printf("%tF\n", now); //now에서 날짜만 출력
		System.out.printf("%tT\n", now); //now에서 시간만 출력
		
		System.out.printf("%tF %tT\n", now, now); //now에서 현재 날짜와 시간을 한줄에 출력
		
		System.out.printf("%1$tF %1$tT\n", now); //1$: 하나의 인수를 같이 사용해라
		
		
		
		//사용자가 입력한 날짜를 출력하기
		now.set(2023, 10-1, 10); //입력(get)할 때 +1 해줬으니까 꺼낼때(set)는 -1
		y = now.get(Calendar.YEAR); //년
		m = now.get(Calendar.MONTH) + 1; //월 (0~11로 저장되어 있다.)
		d = now.get(Calendar.DATE); //일
		w = now.get(Calendar.DAY_OF_WEEK); //주의 수(1~7로 저장되어 있다. 1:일요일, 7:토요일)
		
		System.out.println(y + "-" + m + "-" + d + "-" + week[w-1]);

	}

}
