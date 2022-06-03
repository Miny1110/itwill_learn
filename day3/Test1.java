package com.day3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Test1 {

	public static void main(String[] args) throws IOException {
		
		//[선언문]
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int num1, num2;
		
		//[입력문]
		System.out.print("첫번째 수는?"); 
		num1 = Integer.parseInt(br.readLine());
		
		System.out.print("두번째 수는?"); 
		num2 = Integer.parseInt(br.readLine());
		
		//[연산, 입력 같이]
		System.out.printf("%d + %d = %d\t", num1, num2, (num1+num2));
		System.out.printf("%d - %d = %d\n", num1, num2, (num1-num2));
		System.out.printf("%d * %d = %d\t", num1, num2, (num1*num2));
		System.out.printf("%d / %d = %d\n", num1, num2, (num1/num2)); // 몫을 구하는 기호
		System.out.printf("%d %% %d = %d\n", num1, num2, (num1%num2)); // 나머지을 구하는 기호
		//지금 연산에서는 산술 연산자를 ()로 묶어줘도 되고 안묶어줘도 값이 입력이 된다.
		
		System.out.println("num1>num2 :" + (num1>num2));
		//지금 연산에서는 산술 연산자를 ()로 묶지 않으면 컴퓨터가 연산을 인식하지 못하여 오류가 난다.
		//숫자를 부등호로 비교하면 true 또는 false 문자가 생성된다.
		//부등호 : >, <, >=, <=, == 
		
	}

}
