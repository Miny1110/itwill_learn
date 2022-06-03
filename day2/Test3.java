package com.day2;

public class Test3 {

	public static void main(String[] args) {

		int r = 10;
		float area, length; 
		// float : 소수점을 저장하는 변수, 정수는 X
		
		area = 10; // 10.0 실수의 형태로 변경됨
		System.out.println(area);
		
		// r = (int)20.0; 형변환 (실수를 강제로 정수로 만들어버림)
		// System.out.println(r);

		area = r*r*3.14f;
		//숫자를 입력하는 경우 실수라도 float이 아니라 더 큰 값인 double로 판단함
		//오류 나는 이유 : 자바는 소수점을 만나면 무조건 double로 처리
		//double의 값을 float으로 바꾸기 위에 숫자 뒤에 f를 써준다.
		//double은 생략 가능
		//혹은 float area, length;이 값을 double area, length;로 변경해준다.
		
		length = r*2*3.14f;
		
		System.out.printf("반지름:%d, 넓이:%f\n", r, area);
		System.out.printf("반지름:%d, 넓이:%.2f\n", r, area);
		//printf에서만 소수점의 수를 정하기 위해 %.2f를 사용 가능하다.
		System.out.println("반지름:"+ r + ", 둘레:" + length);
		
	}

}
