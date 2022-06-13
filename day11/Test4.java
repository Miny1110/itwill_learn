package com.day11;

public class Test4 {

	public static void main(String[] args) {

		//StringBuffer는 자료형처럼 쓸 수 없다. 객체를 생성해주어야 한다.
		StringBuffer sb = new StringBuffer();
		
		//데이터 입력 (append)
		//서울데이터 위에 부산데이터를 덮는 것이 아니라 계속 데이터가 누적된다.
		//쓰레기값이 없다.
		sb.append("서울");
		sb.append("부산");
		
		System.out.println(sb);
		
		//StringBuffer의 toString 메소드 (Object의 메소드를 오버라이드 한 것)
		String str = sb.toString();
		System.out.println(str);
		
		
		
		
	}

}
