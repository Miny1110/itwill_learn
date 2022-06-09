package com.day8;

import java.util.Calendar;

public class Test3 {

	public static void main(String[] args) {
		
		//static멤버라 객체생성이 필요없다.
//		MyData ob = new MyData();
//		ob.print();
		
		//클래스이름.메소드이름 으로 바로 사용 가능하다.
		MyData.getInstance();

		
		
//		Calendar cal = new Calendar();
		Calendar cal = Calendar.getInstance();
		
		
		
		
	}

}
