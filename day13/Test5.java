package com.day13;

//2. 내부클래스(Local): 클래스를 메소드 안에 만든다.

class Outer2 {
	
	static int a = 10;
	int b = 20;
	
	public void write() {
		
		int c = 30;
		final int d = 40;
		
		class Inner2 {
			public void print() {
				System.out.println(a);
				System.out.println(b);
				System.out.println(c);
				System.out.println(d);
			}
		}
		
		Inner2 ob = new Inner2();
		ob.print();
		
	}
	
}


public class Test5 {

	public static void main(String[] args) {

		Outer2 out = new Outer2();
		out.write();
		
	}

}

/*
순서

1. Outer2 객체 생성 > 변수 a, 변수 b, write메소드 메모리상에 올라간다.
2. write메소드 실행 > 변수 c, 변수 d 메모리상에 올라간다. Inner2 객체 생성한다. Inner클래스의 print메소드가 메모리상에 올라간다. 
3. print 메소드 실행한다. abcd값이 출력된다. 
*/
