package com.day9;

//Overload
//Overloading
//메소드 중복정의
//하나의 클래스 안에서 비슷한 작업을 하는 메소드의 이름은 동일하지만, 매개변수의 개수가 다르거나 자료형이 다르면 다른 메소드로 인식한다.
//매개변수 자료형과 개수가 같다면 변수명이 달라도 같은 메소드로 인식한다.

class Rect {
	
	private int w, h;	//private은 외부에서 접근 불가
	
	public void set(int w, int h) {
		//인스턴스변수와 매개변수 이름이 똑같으니까 this로 둘을 구분한다.
		this.w = w;
		this.h = h;
		
	}
	
	
	public int area() {
		//area는 매개변수가 없으니까 혼동가능성이 없어서 this 생략
		return w*h;
	}

	
	public int length() {
		//length는 매개변수가 없으니까 혼동가능성이 없어서 this 생략
		return (w+h)*2;
	}
	
	
	public void print(int a, int l) {
		System.out.println("가로: " + w);
		System.out.println("세로: " + h);
		System.out.println("넓이: " + a);
		System.out.println("둘레: " + l);
	}

	
	public void print() {
		System.out.println("가로: " + w);
		System.out.println("세로: " + h);
	}
	
	
	public void print(int a) {
		System.out.println("가로: " + w);
		System.out.println("세로: " + h);
		System.out.println("넓이: " + a);
	}
	
	//위 메소드와 매개변수 개수는 같지만 자료형이 다르기때문에 오버로딩
	public void print(double l) {
		System.out.println("가로: " + w);
		System.out.println("세로: " + h);
		System.out.println("둘레: " + l);
	}
	
}


public class Test1 {

	public static void main(String[] args) {

		Rect ob = new Rect();
		
		ob.set(10, 20);
		
		int area = ob.area();
		int length = ob.length();
		
		ob.print();
		ob.print(area);
		ob.print(area, length);
		//length가 int타입이기때문에 형변환을 안하면 print(int a)로 인식해서 인수 형변환이 필요하다.
		ob.print((double)length);
		
		
		
		
	}

}
