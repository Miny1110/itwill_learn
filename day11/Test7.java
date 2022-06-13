package com.day11;

//Wrapper 클래스
//무언가를 감싸는 클래스
//기본 자료형을 객체(클래스)로 사용할 수 있게 해준다.

/*
자료형: 
boolean, byte, char, short, int, long, float, double (String은 클래스)

reference 자료형 (class 자료형): 
Boolean, Byte, Character, Short, Integer, Long, Float, Double
*/

//Auto-Boxing: stack에 있는 값이 heap 영역으로 넘어가서 처리되는 것
//Auto-UnBoxing: heap영역에 있는 데이터가 stack박스로 넘어가서 처리되는 것


public class Test7 {

	public static void main(String[] args) {

		int a = 24;
		
		System.out.println(a); //24
		System.out.println(Integer.toString(a));
		
		
		System.out.println(a + 10);
		System.out.println(Integer.toString(a) + 10);
		System.out.println(Integer.toString(a, 2));
		
		int n1 = 10;
		int n2; //지역변수 자료형이니까 초기값: 쓰레기값
		Integer num1; //클래스니까 초기값: null값
		Integer num2 = new Integer(20);
		
		num1 = n1; //Auto-Boxing
		n2 = num1; //Auto-Unboxing
		
		System.out.println(n1 + ":" + num1);
		System.out.println(n2 + ":" + num2);
	
	}

}

/*

int a = 10;
float b;

b = a;			암시적 형변환 (10.0) -- O
b = (float)a;	명시적 형변환 (10.0) -- O

a = b;			에러 -- X
a = (int)b;		가능 -- O

큰값을 작은값에 넣기 위해서는 명시적 형변환을 해주어야 한다. 암시적 형변환 불가능
작은값을 큰값에 넣을 때에는 명시적/암시적 형변환 둘 다 가능하다.

---------------------------------------------------------------
B(부모클래스) - A(자식클래스)
부모가 큰 개념. 자식이 작은 개념
클래스 안에 클래스 넣기 가능하다.

B = A;			UPCAST(자식을 부모에게 넣기) -- O
B = (B)A;		명시적 UPCAST -- O

A = B;			에러 -- X
A = (A)B;		명시적 DOWNCAST -- O

*/