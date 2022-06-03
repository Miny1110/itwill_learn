package com.day3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Test4 {

	public static void main(String[] args) throws IOException {
		System.out.println("[제어문]");
		System.out.println();
		/* 제어문의 종류
		 : if문
		 : 반복문(for문, while문, do~while문)
		 : switch문
		 */
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int num;
		String str = ""; 
		//string의 초기값을 넣는 방법 : null로 초기화
		//큰따옴표안에 띄어쓰기를 넣으면 안된다. 아무런 값이 없다는 뜻이다.
		
		System.out.print("숫자를 입력하시오."); //50
		num = Integer.parseInt(br.readLine());
		
		//단일 if문 : if(조건식) {작업} , 조건 1개에 작업 1개
		/*
		if(num%2 == 0) {
			str = "짝수";
		}
		
		if(num%2 != 0) {
			str = "홀수";
		} // ==1과 !=0의 결과값은 같다. 
		*/
		
		//if~else문
		//조건은 1개, 작업은 2개
		//if~else문에는 String의 초기화 값을 넣어주지 않아도 값이 출력이 되긴 하지만 습관처럼 넣어주기
		if(num%2 == 0) {
			str = "짝수";
		} else {
			str = "홀수";
		}
		
		
		System.out.println(num + " : " + str);
	}
	
}
