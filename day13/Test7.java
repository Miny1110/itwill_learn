package com.day13;

//4. 내부클래스(무명의, 익명의 Annonymous 클래스)
public class Test7 {

	public Object getTitle() { //upcast(String이 Object로)
		
		//String str = "무명의 클래스";
		
		return new Object() {
			@Override
			public String toString() {
				return "무명의 클래스";
			}
		};
	}
	
	
	public static void main(String[] args) {

		Test7 ob = new Test7();
		
		System.out.println(ob.getTitle());
		
		
	}

}
