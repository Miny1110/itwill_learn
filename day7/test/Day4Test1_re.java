package com.day7.test;

import java.util.Scanner;

class Gugudan {
	
	//변수선언
	int dan, i;
	
	
	//입력받기
	void input() {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("단을 입력하세요: ");
		dan = sc.nextInt();
	
	}
	
	
	//반복문실행
	void gugu() {
		
		for(i=1;i<10;i++) {
			System.out.println(dan + "*" + i + "=" + dan*i); 
		}
		
	}
	
}

public class Day4Test1_re {

	public static void main(String[] args) {
			
		Gugudan gu = new Gugudan();
		
		gu.input();
		gu.gugu();
		
	}
	
	
}
