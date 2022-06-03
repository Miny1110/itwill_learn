package com.day2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Test5 {

	public static void main(String[] args) throws IOException {

		//[선언]
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		String name;
		int kor,eng,tot;
		
		//[입력]
		System.out.print("이름?"); //suzi
		name = br.readLine(); 
		//반환값 : string name의 값도 string, br의 값도 string으로 변환되기 때문에 int값으로 바꾸거나 하는 작업은 필요X
		//한글 이름으로 값을 입력하고 싶다면 반드시 콘솔창에 커서를 클릭한 후에 작성할 것
		//영어는 커서를 입력하지 않고 작성해도 되지만 한글의 경우 에러가 뜬다.
		
		System.out.print("국어?"); //60
		kor = Integer.parseInt(br.readLine());
		//br.readLine();의 값이 string이기 때문에 국어의 점수를 물어보는 kor에는 int로 값을 변환해주는 작업을 해야함.
		
		System.out.print("영어?"); //80
		eng = Integer.parseInt(br.readLine());
		
		//[연산]
		tot = kor + eng;
		
		//[출력]
		System.out.println("이름: " + name);
		System.out.println("총점: " + tot);
		
	}

}
