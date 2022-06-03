package com.day2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Test4 {

	public static void main(String[] args) throws IOException {

		BufferedReader br = new BufferedReader(
				new InputStreamReader(System.in));
		
		//System.in : 키보드로 입력한 1byte 문자를 입력받음.
		//알파벳을 쓰지 않는 나라의 언어들은 2byte
		//InputStreamReader : System.in으로 받은 문자를  1byte에서 2byte로 변경
		//BufferedReader : 2byte로 변경된 문자를 저장해놓는 곳
		//br에 있는 값을 읽어내는 method : readLine();
		
		int r;
		double area, length;
		
		System.out.print("반지름?"); 
		
		r = Integer.parseInt(br.readLine()); 
		//BufferedReader를 통해 숫자를 문자로 만들었기 때문에 다시 숫자로 변경하는 작업이 필요
	    //그래서 int를 사용한다.
		
		//r = Double.parseDouble(br.readLine());
		//r을 int로 지정했기 때문에 double을 사용하면 값이 오류가 남
		
		
		area = r*r*3.14;
		length = r*2*3.14;
		
		System.out.println("반지름: " + r);
		System.out.println("넓이: " + area);
		System.out.println("둘레: " + length);
		
	}

}
