package com.day7;

import java.util.Scanner;

//사용자가 입력한 숫자까지의 누적합 구하기

class Hap {
	
	
	//정의
	int su;
	
	
	//입력메소드
	public void input() {

		Scanner sc = new Scanner(System.in);
		System.out.print("정수입력?: ");
		su = sc.nextInt();
		//입력만 받은 것이기 때문에 리턴값이 필요가 없다.

	}

	
	//연산메소드
	public int cnt() {
		
		int sum = 0;
		
		for(int i=1;i<=su;i++) {
			sum += i;
		}
		return sum;
		//메소드 안에서 어떠한 연산과정을 거친 후에 새로운 값이 도출되어서 리턴값이 필요하다.
	}
	
	//출력메소드
	public void print(int result) {
		System.out.println("1부터 " + su + "까지의 합: " + result);
	}
}



public class Test3 {

	public static void main(String[] args) {

		Hap h = new Hap();
			
		h.input();
		int sum = h.cnt();
		h.print(sum);
		
		
	}

}
