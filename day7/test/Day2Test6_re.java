package com.day7.test;

import java.util.Scanner;

class Tri {
	
	//변수 선언
	int w, h;
	
	
	//입력받기
	void input() {
		
		Scanner sc = new Scanner(System.in);

		System.out.println("밑변을 입력하세요: ");
		w = sc.nextInt();
		
		System.out.println("높이를 입력하세요: ");
		h = sc.nextInt();

	}
	
	
	//넓이구하기
	int area() {
		
		int a = w * h / 2;
		return a;
		
	}
	
	
	//출력하기
	void print(int a) {
		
		System.out.println("삼각형의 넓이: " + a);
	}
	
}




public class Day2Test6_re {

	public static void main(String[] args) {
		
		Tri t = new Tri();
		
		t.input();
		int a = t.area();
		t.print(a);
		
		
		
/*		
		//"밑변(W)과 높이(h)를 입력받아 삼각형의 넓이(a)를 구하시오."
		//밑변? 23.5
		//높이? 34.7
		//넓이 : xxx.xx
		//넓이 : (밑변 * 높이)/2

		//[선언]
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		double w,h,a;
		
		//[입력]
		// br.readLine()과 throws IOException는 함께 있어야 값이 출력이 된다!!
		System.out.print("밑변의 값은 무엇인가? ");
		w = Double.parseDouble(br.readLine());
		
		
		System.out.print("높이의 값은 무엇인가? ");
		h = Double.parseDouble(br.readLine());
		
		//[연산]
		a = ( w * h ) / 2;
		
		//[출력]
		System.out.println("넓이: " + a);
		System.out.printf("삼각형 넓이의 값 = %.2f ", a);
		
*/		
		
		
	}

}
