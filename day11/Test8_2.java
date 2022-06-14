package com.day11;

import java.util.Scanner;

class Sum2 {
	
	protected int num1, num2, result;
	
	protected String oper;
	
	public void write() {
		System.out.printf("%d %s %d = %d", num1, oper, num2, result);
	}
	
}


class Calc2 extends Sum2 {
	
	public void input() {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("두개의 수(10,20)? ");
		String su = sc.next();
		
		System.out.println("연산자? ");
		oper = sc.next();
		
		su = su.replace(" ", "");
		String[] s = su.split(",");
		
		num1 = Integer.parseInt(s[0]);
		num2 = Integer.parseInt(s[1]);
		
	}
	
	
	public void calc() {
		
		if(oper.equals("+"))
			result = num1 + num2;	
		else if(oper.equals("-"))
			result = num1 - num2;
		else if(oper.equals("*"))
			result = num1 * num2;
		else if(oper.equals("/"))
			result = num1 / num2;

	}
	
}


public class Test8_2 {

	public static void main(String[] args) {

		Calc2 ob = new Calc2();
		ob.input();
		ob.calc();
		ob.write();
		
	}

}
