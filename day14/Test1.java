package com.day14;

import java.util.Vector;

//Collection

/*
배열의 단점
크기가 정해지면 늘리거나 줄이거나 삽입이 불가능하다.
길이를 정해주어야 한다.

컬렉션의 장점
크기를 늘리고 줄이고 삽입하는 것이 가능하다.
기본적으로 10. 꽉 차면 자동으로 늘어난다. 비어있으면 메소드를 통해 빈 공간을 삭제할 수 있다.(길이를 줄일 수 있다.)

인터페이스를 구현하는, 이미 만들어져있는 클래스
List (Interface) - ArrayList(class), Vector(class) ...
Map (Interface) - HashMap(class), HashTable(class) ...
*/


public class Test1 {

	private static String city[] = {"서울", "부산", "대구", "인천", "광주", "대전", "울산"};
	
	
	public static void main(String[] args) {

		//<E>: Generic. Vector가 어떤 자료형을 갖도록 할지, 자료형을 적는다.
		//아무것도 적지 않으면 기본타입 Object
		Vector v = new Vector<>(); //Vector의 자료형: Object
		
		v.add("서울"); //upcast: String타입을 Object타입에
		v.add(30); //upcast: Integer타입을 Object타입에 (int아님 int는 자료형임)
		v.add('A'); //upcast: Character타입을 Object타입에 (char아님 char는 자료형임)
		
		 
		
		String str = (String) v.get(0); //downcast
		System.out.println(str);
		
		Integer i = (Integer) v.get(1); //downcast
		System.out.println(i);
		
		Character c = (Character) v.get(2); //downcast
		System.out.println(c);
		
		
		for(int j=0;j<v.size();j++) {
			
			Object ob = v.get(j);
			
			if(ob instanceof String) {
				str = (String)ob;
				System.out.println(str);
			} else if(ob instanceof Integer) {
				i = (int)ob;
				System.out.println(i);
			} else if(ob instanceof Character) {
				c = (char)ob;
				System.out.println(c);
			}
		}
		
	}

}
