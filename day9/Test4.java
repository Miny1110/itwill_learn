package com.day9;

public class Test4 {
	
	int a = 5;
	
	//초기화 블럭
	{
		System.out.println("초기화 블럭a: " + a);
		a = 10;
		System.out.println("초기화 블럭a: " + a);
		
	}
	
	//System.out.println("초기화 블럭: " + a);
	
	static int b;
	
	//static 블럭
	static {
		b = 10;
		System.out.println("초기화 블럭b: " + b);
	}
	
	//상수
	
	final int C;
	
	public Test4() {
		System.out.println("생성자");
		C = 100;
		//C = 200;
		System.out.println("C: " + C);
	}
	
	
	public static void main(String[] args) {
		
		Test4 ob1 = new Test4();
		Test4 ob2 = new Test4();
		
		//static > new(instance변수 또는 메소드) > 생성자
		
	}
}
