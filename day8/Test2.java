package com.day8;

//static
//알아서 메모리에 올라감(메모리 할당을 받음) 객체생성을 따로 해주지 않아도.
//객체를 1000번 생성해도 메모리 공간은 1개

public class Test2 {
	 
	public static int a = 10;	//class 변수
	//클래스 변수 또는 클래스 메소드는 클래스가 로딩되는 순간 메모리할당이 이루어지며, [클래스이름.객체 또는 메소드명]를 통해 접근 가능하다..
	//즉, new를 통해서 메모리할당을 받지 않아도 사용 가능하다.
	//로딩=실행(run하는 것). 객체생성 아님. 객체생성과 실행은 별개
	
	public int b = 20;			//instance 변수
	//인스턴스 변수는 new를 통해서 메모리 할당을 받아야만 사용 가능하고, 클래스 메소드에서는 접근이 불가능하다.
	
	
	//static 없음 > 인스턴스 메소드
	public void write() {
		System.out.println("class 변수: " + a);
		System.out.println("instance 변수: " + b);
	}
	
	
	//static 있음 > 클래스 메소드
	public static void print() {
		System.out.println("class변수: " + a);
//		System.out.println("instance 변수: " + b);
	}
	
	
	public static void main(String[] args) {
		
		System.out.println("class변수: " + a);
		System.out.println("class변수: " + Test2.a);
		//System.out.println("instance변수: " + b);
		//인스턴스 변수는 객체생성을 해야 사용 가능해서 에러
		//밑에서 new Test2로 객체생성한 이후에는 사용 가능
		
		
		//new로 객체생성을 해야 사용 가능해서 에러
		//write();

		
		print();
		Test2.print();
		
		Test2 ob = new Test2();
		
		
		System.out.println(ob.a);
		//에러는 안나는데 굳이 이렇게 안씀. 객체가 필요없으니까. 근데 ob가 객체니까
		System.out.println(Test2.a);
		
		ob.write();
		
		ob.print();
		//에러는 안나는데 굳이 이렇게 안씀. 객체가 필요없으니까. 근데 ob가 객체니까
		Test2.print();
		
		
		//로딩과 객체생성은 다르다. 는 것을 보여주는 예시 
		System.out.println(ob.a);
		System.out.println(ob.b);
		
		System.out.println("----------------------------");
		
		Test2 ob1 = new Test2();
		
		ob1.a = 100;
		ob1.b = 200;
		System.out.println(ob1.a); //100
		System.out.println(ob1.b); //200
		
		System.out.println("----------------------------");
		
		Test2 ob2 = new Test2();
		
		System.out.println(ob2.a); //100
		System.out.println(ob2.b); //20
		
		System.out.println("----------------------------");
		
		Test2 ob3 = new Test2();
		
		System.out.println(ob3.a); //100
		System.out.println(ob3.b); //20
		
	}

}
