package com.day2;


public class Test2 {

	public static void main(String[] args) {

		// int : 자료형 (정수)
		// num1 : 변수명(메소드 이름 만드는 것과 동일), 
		// 값을 지정한 후에 새로운 값으로 변경시킬 수 있기 때문에 변수라 부름
		int num1 = 20; //변수 초기화 1 변수를 생성함과 동시에 값을 넣어줌
		int num2;
		num2 = 10; //변수 초기화 2 변수를 생성한 후 에 값을 넣어줌
		
		int num3, num4; 
		//자료형이 같을 경우 변수 여러개를 넣어줄 수 있음.
		//변수를 초기화 하지 않았기 때문에 쓰레기 값이 있다.
		
		System.out.println(num1);
		System.out.println(num2);
		// System.out.println(num3); 컴파일 오류(문법적으로 틀린것)		
		// System.out.println(num4); 쓰레기 값은 보여주지 않는다.
		
		num3 = num1 + num2;
		System.out.println(num3);

		num4 = num1 - num2;
		System.out.println(num4);
		
		System.out.println(num1 + "+" + num2 + "=" + num3);
		System.out.println(num1 + "-" + num2 + "=" + num4);

		
		num1 = 200;
		num2 = 100;
		num3 = num1 + num2;
		num4 = num1 - num2;
		System.out.println(num1 + "+" + num2 + "=" + num3);
		System.out.println(num1 + "-" + num2 + "=" + num4);
		
		//format 
		//printf안에서만 쓸 수 있는 한 줄 띄기 : %n
		System.out.printf("%d+%d=%d%n", num1, num2, num3);
		System.out.printf("%d-%d=%d", num1, num2, num4);

		
	}
	

}
