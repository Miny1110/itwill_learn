package com.day11;

//StringBuffer : 동기화 작업을 지원함 (StringBuilder보다 속도가 느림) 
//StringBuilder : 동기화 작업을 지원 안함 (StringBuffer보다 속도가 빠름)
//둘다 클래스
//java.lang에 속해있기 때문에 사용해도 import 되지 않는다.


public class Test3 {

	public void stringTime() {

		System.out.println("String...");

		//둘중 아무거나 써도 됨
		//시작시간
		//long start = System.currentTimeMillis();
		long start = System.nanoTime();

		String str = "A";
		for(int i=1;i<50000;i++) {
			str += "A";
		}

		//종료시간
		long end = System.nanoTime();

		System.out.println("실행시간: " + (end - start) + "ms");

	}


	public void stringBufferTime() {

		System.out.println("StringBuffer...");

		long start = System.nanoTime();

		StringBuffer str = new StringBuffer("A");
		for(int i=1;i<50000;i++) {
			//append: 문자열 누적 메소드
			str.append("A");
		}

		long end = System.nanoTime();

		System.out.println("실행시간: " + (end - start) + "ms");

	}


	public void stringBuilderTime() {

		System.out.println("StringBuilder...");

		long start = System.nanoTime();

		StringBuffer str = new StringBuffer("A");
		for(int i=1;i<50000;i++) {
			//append: 문자열 누적 메소드
			str.append("A");
		}

		long end = System.nanoTime();

		System.out.println("실행시간: " + (end - start) + "ms");

	}


	public static void main(String[] args) {

		Test3 ob = new Test3();

		ob.stringTime();
		ob.stringBufferTime();
		ob.stringBuilderTime();

	}

}
