package com.day11;

import java.util.Scanner;

class Sum {
	
	protected int num1, num2, result;
	
	protected String oper;
	
	public void write() {
		System.out.printf("%d %s %d = %d", num1, oper, num2, result);
	}

}


class Calc extends Sum {
	
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
				
				char ch = user.charAt(n);
				
				switch(ch) {
				case '+':
					result = num1 + num2; break;
				case '-':
					result = num1 - num2; break;
				case '*':
					result = num1 * num2; break;
				case '/':
					result = num1 / num2; break;
				}
				
				super.oper = Character.toString(ch);
			
			}
		}
	}
}


public class Test8 {

	public static void main(String[] args) {

		Calc ob= new Calc();
		
		ob.input();
		ob.calc();
		ob.write();
		
	}

}
