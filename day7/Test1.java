package com.day7;

public class Test1 {

	public static void main(String[] args) {

		Rect ob1 = new Rect();
		
		ob1.input();
		int a = ob1.area();
		int l = ob1.length();
		ob1.print(a, l);
		
		
		Rect ob2 = new Rect();
		ob2.input();
		a = ob2.area();
		l = ob2.length();
		ob2.print(a, l);
		
		
	}

}
