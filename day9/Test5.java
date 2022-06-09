package com.day9;

import java.io.IOException;
import java.util.Scanner;

class Calc {
	
	private int num1, num2;
	
	private char oper;
	
	public boolean input() throws IOException {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("두 개의 수? "); //20 10
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		
		System.out.print("연산자? "); //+-*/
		oper = (char)System.in.read();
		
		
		//연산자 확인
		if(oper!='+' && oper!='-' && oper!='*' && oper!='/') {
			return false;
		}
		
		return true;
		
	}
	
	public int result() {
		
		//지역변수니까 초기화 필요
		int sum = 0;
		
		switch(oper) {
		case '+': sum = num1 + num2; break;
		case '-': sum = num1 - num2; break;
		case '*': sum = num1 * num2; break;
		case '/': sum = num1 / num2; break;
		}
		
		return sum;
		
	}
	
	
	public void print(int r) {
		System.out.printf("%d %c %d = %d\n", num1, oper, num2, r);
	}
	
}




public class Test5 {

	public static void main(String[] args) throws IOException {

		Calc ob = new Calc();
		
		//boolean flag = ob.input();
		
		if(!ob.input()) {
			System.out.println("연산자 오류!");
			return; //stop
		}
		
		int r = ob.result();
		ob.print(r);
	
		
		
		
		
		
		
	}

}
