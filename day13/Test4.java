package com.day13;

//1. 내부클래스(Inner): 클래스 안에 클래스를 만든다.

class Outer1 {
	
	static int a = 10; //클래스 변수
	int b = 20; //인스턴스 변수
	
	//클래스 안에 클래스
	public class Inner1 {
		
		int c = 30;
		
		public void write() {
			System.out.println(a);
			System.out.println(b);
			System.out.println(c);
		}
		
	}
	
	public void print() {
		
		System.out.println("print()...");
		
		Inner1 ob = new Inner1();
		ob.write();
		
	}
}

public class Test4 {

	public static void main(String[] args) {

		//외부클래스가 객체생성이 되어야 내부클래스의 객체를 생성할 수 있고, 외부클래스의 객체생성이 되었다고 해서 자동으로 내부클래스의 객체가 생성되는 것은 아니다.
		
		//외부클래스 객체생성 후 외부클래스의 메소드를 이용해서 내부클래스 객체생성
		Outer1 out = new Outer1();
		out.print();
		
		//외부클래스 객체생성 후 외부클래스를 이용해서 내부클래스 객체생성
		Outer1.Inner1 inner = out.new Inner1();
		inner.write();
	}

}
