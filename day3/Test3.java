package com.day3;

import java.io.IOException;

public class Test3 {

	public static void main(String[] args) throws IOException {

		System.out.println("[대문자 소문자를 변환하는 아스키 코드 값을 삼항 연산자로 연산]");
		System.out.println();
		
		char ch, result;
		
		System.out.print("한 개의 문자?"); 
		//a(아스키코드:97), A(아스키코드 :65)
		ch = (char) System.in.read(); 
		//숫자97 입력하면 정수로 처리됨 (아스키코드는 57, 55) -> 형변환 작업을 해야한다. (char)입력
		
		result = ch >= 65 && ch <= 90?(char)(ch+32):(ch>='a' && ch <= 'z'?(char)(ch-32):ch);
		/*
		char에는 원래 정수의 값이 들어가지 못함. 
		but (ch+32)는 연산자가 들어가있기 때문에 자동으로 정수로 바뀐다.
		ch >= 65 && ch <= 90 : 대문자 A ~ 대문자 Z의 값을 물어보는 것.
		ch>=97 && ch <= 122 : 소문자 A ~ 소문자 Z의 값을 물어보는 것.
		아스키코드 값을 하나하나 다 기억하지 못할 수도 있기 때문에 'a'~'z'로 표현해도 된다.
		ch = 하나의 문자에 아스키값, 유니코드 값을 저장하고 있는 것이다.
		*/
		
		System.out.println(ch + " : " + result);
		//아스키코드값으로 찍히는게 아닌 우리가 알고 있는 문자로 값이 출력된다.
	}

}


