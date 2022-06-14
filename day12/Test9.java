package com.day12;

class TestA {
	public void print() {
		System.out.println("TestA 클래스");
	}
}


class TestB extends TestA{
	public void print() {
		System.out.println("TestB 클래스");
	}
}


public class Test9 {

	public static void main(String[] args) {

		TestA a = new TestA();
		TestB b;
		
		//자료형이 다르기때문에 에러
		//b = a;
		//b = (TestB)a;
		
		//상속관계 설정 후 형변환을 하면 가능하다.
		b = (TestB)a;
	}

}
