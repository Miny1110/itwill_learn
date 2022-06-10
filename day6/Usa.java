package com.day6;

//Rect는 다른 패키지에 있는 클래스이기 때문에 import
import com.day7.Rect;

public class Usa {

	public static void main(String[] args) {

		Rect ob = new Rect();
		
		ob.input();
		int x = ob.area();
		int y = ob.length();
		ob.print(x, y);
		
		
		
		
		
	}

}
