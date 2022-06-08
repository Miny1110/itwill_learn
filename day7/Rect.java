package com.day7;

import java.util.Scanner;

public class Rect {

	//전역변수, instance 변수
	int w, h;
	
	
	//input이라는 부서. 누구나 들어올 수 있음(public). 뭐 들고올 것 없다.(매개변수 없음). 돌려주는 것 없다(void)
	public void input() {
		
		//클래스를 복사할거야 > new
		//클래스 복사본 > sc
		Scanner sc = new Scanner(System.in);
		
		//지역변수, 로컬변수
		//int w, h;
		
		
		System.out.println("가로? ");
		w = sc.nextInt();
		
		System.out.println("세로? ");
		h = sc.nextInt();
		
		//void에서는 return 생략 가능
		//return;
	}
	

	
	//넓이구하기
	public int area() {
		
		//지역변수
		//바깥에서 사용(인식)할 수 없다.
		int result;
		
		//w, h는 input메소드에 있는 지역변수. 그래서 area메소드에서 사용 불가(주석처리 된 것)
		//그래서 복도로 변수를 빼준다. 그것이 전역변수
		result = w * h;
		
		//메소드를 호출한 곳으로 return값을 돌려준다.
		return result;
		
	}
	
	
	
	//둘레구하기
	public int length() {
		
		//area()에서 세줄로 작성했던 코드형식을 한줄로 줄인 것
		return (w+h)*2;
		
	}

	
	
	//출력
	public void print(int a, int l) {
		
		System.out.println("가로: " + w);
		System.out.println("세로: " + h);
		System.out.println("넓이: " + a);
		System.out.println("둘레: " + l);
		
	}
	
	
}
