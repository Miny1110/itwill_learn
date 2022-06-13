package com.day11;

import java.util.Scanner;

class Sum1 {
	
	protected int num1, num2, result;
	
	protected String oper;
	
	public void write() {
		System.out.printf("%d %s %d = %d", num1, oper, num2, result);
	}

}


class Calc1 extends Sum1 {
	
	String user;
	
	public void input() {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("수식 입력하세요 [ex. 3+5] ");
		
		user = sc.nextLine();
		
		user = user.replaceAll("\\s", "");
				
	}
	
	
	public void calc() {
		
		String oper[] = {"+", "-", "*", "/"};
		
		for(int i=0;i<oper.length;i++) {
			int n = user.indexOf(oper[i]);
			
			if(n>-1) {
				num1 = Integer.parseInt(user.substring(0, n));
				num2 = Integer.parseInt(user.substring(n+1));
				
				super.oper = user.substring(n, n+1);
				
				switch(super.oper) {
				case "+":
					result = num1 + num2; break;
				case "-":
					result = num1 - num2; break;
				case "*":
					result = num1 * num2; break;
				case "/":
					result = num1 / num2; break;
				}
			
			}
		}
		
	}
	
}


public class Test8_1 {

	public static void main(String[] args) {

		Calc1 ob= new Calc1();
		
		ob.input();
		ob.calc();
		ob.write();
		
	}

}
