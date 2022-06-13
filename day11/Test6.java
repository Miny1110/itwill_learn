package com.day11;

//String 메소드로 계산기 만들기

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Test6 {

	public static void main(String[] args) throws IOException {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("수식[3+5]? "); //12+56
		String str = br.readLine();
		
		//모든공백 없애기 (앞뒤 뿐 아니라 중간 공백도 찾아서 널값으로 바꾼다.)
		str = str.replaceAll("\\s", "");
		
		
		//String[] op = {"+", "-", "*", "/"};
		//for(String o : op) {
		
		//위 두 줄을 한줄로 바꾼 것
		for(String op : new String[] {"+", "-", "*", "/"}) {	
			//입력값: 123+56
			//인덱스: 012345
			int pos = str.indexOf(op); //3
			
			if(pos>-1) {
				int num1 = Integer.parseInt(str.substring(0, pos)); //123
				int num2 = Integer.parseInt(str.substring(pos+1)); //56
			
				int result = 0;
				char oper = str.charAt(pos); //+
				
				switch(oper) {
				case '+':
					result = num1 + num2; break;
				case '-':
					result = num1 - num2; break;
				case '*':
					result = num1 * num2; break;
				case '/':
					result = num1 / num2; break;
				}

				//System.out.printf("%d %c %d = %d", num1, oper, num2, result);
				String s = String.format("%d %c %d = %d", num1, oper, num2, result);
			}
		}
	}
}
