package com.day11;

//String: 기본자료형이 아니고 class이다.
//저장할 데이터는 크고 사용빈도는 높기 때문에  String을 자료형처럼 사용했다. 사용빈도가 높으니까 그때마다 객체생성하는 것이 귀찮아서 자료형처럼 사용.
//String은 불변의 법칙을 가지고 있다. 한번 만들어 놓은 것은 절대 변하지 않는다.

public class Test2 {

	public static void main(String[] args) {

		String ob1 = "Seoul";
		String ob2 = "Seoul";
		String ob3 = new String("Seoul");
		
		
		System.out.println("ob1==ob2: " + (ob1==ob2));	//true
		System.out.println("ob1==ob3: " + (ob1==ob3));	//false
		System.out.println("ob1.equals(ob3): " + ob1.equals(ob3));	//true
		
		ob2 = "korea";
		System.out.println("ob1==ob2: " + (ob1==ob2));	//false
		
		ob2 = "japan";
		System.out.println("ob1==ob2: " + (ob1==ob2));	//false
		
		ob2 = "china";
		System.out.println("ob1==ob2: " + (ob1==ob2));	//false
		
		ob2 = "Seoul";
		System.out.println("ob1==ob2: " + (ob1==ob2));	//true
		
		//String은 주소값이 아니라 저장되어 있는 데이터를 출력한다.
		//클래스임에도 끝까지 자료형 흉내를 낸다.
		//int같은 자료형들은 데이터를 대입하고 출력했을 때 주소가 아닌 그 데이터값이 출력된다.
		System.out.println(ob2);	//Seoul

		//Stirng의 toString 사용. ob2가 String이니까
		System.out.println(ob2.toString());	//Seoul 
		
	}
}
