package com.day9;

import java.util.Scanner;

//생성자
/*
생성자를 사용하는 이유
1. 메모리 할당 (객체 생성)
2. 변수 초기화

생성자의 특징
1. 클래스의 이름과 동일하다.
2. 리턴값이 없기때문에 property(void같은 것)가 없다.
3. 중복정의가 가능하다.
4. 생성자에서 다른 생성자를 호출할 수 있다. 단, 맨 선두에서 한번만 호출 가능하다.
*/

public class Test2_re {

	private int x;
	
	//기본생성자 (인수가 없다.)
	public Test2_re() {
		
		//오버로딩된 생성자 Test2_re(int x)호출
		//하지만 Test2_re 클래스에서 Test2_re 생성자를 호출했기 때문에 이름이 같아서 에러발생. Test2_re 대신 this로 작성
		//this(30);
		
		System.out.println("기본생성자");
		
		//생성자는 변수초기화가 가능하기때문에 private 변수x 초기화가 가능하다.
		x = 10;
		System.out.println("x: " + x);
	}
	
	
	//생성자 중복정의 (오버로딩된 생성자)
	public Test2_re(int x) {
		
		System.out.println("오버로딩된 생성자");
		
		this.x = x;
		System.out.println("x: " + x);
	}
	
	
	public void setData(int x) {
		
		this.x = x;
		
	}
	
	
	


	public static void main(String[] args) {
		
		Test2_re ob1 = new Test2_re();
		//Test2_re()가 public Test2_re(){}를 호출. 
		
		System.out.println(ob1.x); //10
		ob1.setData(100);
		System.out.println(ob1.x); //100
		
		//----------------------------------
		
		Test2_re ob2 = new Test2_re(20);
		System.out.println(ob2.x);
		
		
		Test2_re ob3 = new Test2_re();
		Test2_re ob4 = new Test2_re(60);
		
		
	
		
		
		
	}

}













