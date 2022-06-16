package com.day14;

import java.util.Vector;

class Test {
	
	String name;
	int age;
	
}


public class Test3 {

	public static void main(String[] args) {

		Vector<Test> v = new Vector<>();
		
		Test ob = new Test();
		
		ob.name = "배수지";
		ob.age = 27;
		v.add(ob);
		
		//ob = new Test();
		ob.name = "유인나";
		ob.age = 42;
		v.add(ob);
		
		for(Test t : v) {
			System.out.println(t.name + ":" + t.age);
		}
		
	}

}

/*
Vector에 들어갈 수 있는 타입은 Test클래스
Test클래스에는 name과 age 데이터가 있다.
배열의 객체마다 다른값이 저장되어야 하므로, 데이터가 달라질때마다 객체도 새로 생성해주어야 한다. 넣고싶은 데이터의 개수만큼 객체를 생성해주어야 한다.
그렇지 않으면 마지막 값으로 통일된다.
*/



