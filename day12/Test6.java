package com.day12;

/*
final을 사용할 수 있는 3가지 경우

변수에 final을 붙이면 단 한번만 한번만 초기화가 가능하다.
메소드에 final을 붙이면 Override가 불가능하다.
클래스에 final을 붙이면 상속이 불가능하다.
*/

//final class Super {	final 붙이면 밑에 상속에서 에러 발생
class Super {
	public static final double PI; //상수
	
	static {
		PI = 3.14;
	}
	
	public double area; //인스턴스 변수
	
	public final void write(String title) {
		System.out.println(title + ":" + area);
	}
	
}


public class Test6 extends Super {

/*	@Override
	public void write(String title) {}
	final이 붙은 메소드는 오버라이드 할 수 없다. */
	
	public void circleArea(int r) {
		area = (double)r * r * PI;
		//사실 형변환 필요 없다. 정수*실수 하면 결과는 실수값이 나온다.
	}
	
	public static void main(String[] args) {
		Test6 ob = new Test6();
		
		ob.circleArea(10);
		ob.write("원");
		
	}

}
