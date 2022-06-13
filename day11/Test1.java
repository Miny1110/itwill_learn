package com.day11;

//Object : 모든 클래스의 최상위 부모
//모든 클래스는 Object클래스를 상속받고 있다.
class Test {
	
	private int a = 10;
	
	public void write() {
		System.out.println("a: " + a);
	}
}


public class Test1 {

	public static void main(String[] args) {

		Test ob1 = new Test();
		Test ob2 = new Test();
		
		//ob1==ob2 는 객체주소값을 비교하는 것이기 때문에 false가 나옴
		System.out.println("ob1==ob2: " + (ob1==ob2));	//false
		System.out.println("ob1.equals(ob2): " + ob1.equals(ob2));	//false
		
											//[클래스이름@해쉬코드]
		System.out.println("ob1: " + ob1);	//Test@7852e922
		System.out.println("ob2: " + ob2);	//Test@4e25154f
		
		System.out.println("ob1.toString(): " + ob1.toString());
		
		
		
	}
}


