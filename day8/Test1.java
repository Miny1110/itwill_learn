package com.day8;

import java.util.Scanner;

//this: 클래스, 자기자신(Circle)
class Circle{
	
	private int r;	//정보의 은닉(캡슐화)
	
	public void setData(int r) {	//setData(int r, Circle this)
		
		//지역변수 r과 인스턴스변수 r 혼동가능성이 있기 때문에, 인스턴스변수 r 앞에 this를 붙인다.
		this.r = r;
	}
	
	
	public double area() {		//area(Circle this)
		//변수 혼동 가능성이 없기 때문에 this 생략
		return r * r * 3.14;
	}
	
	
	public void write(double a) {		//write(double a, Circle this)
		System.out.println("반지름: " + r);
		System.out.println("넓이: " + a);
	}
}


public class Test1 {

	public static void main(String[] args) {
	
		Circle ob = new Circle();
		
		Scanner sc = new Scanner(System.in);
		System.out.println("반지름? ");
		int r = sc.nextInt();
		
		//private이기때문에 외부에서 접근 불가
		//ob.r = 10;
		
		ob.setData(r);			//setData(r, ob)
		double a = ob.area();	//area(ob)
		ob.write(a);			//write(a, ob)
		
		
	}
	
}
