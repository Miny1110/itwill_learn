package com.day3;

import java.util.Scanner;

public class Test7 {

	public static void main(String[] args) {
		System.out.println("[단일 if문을 활용한 예제]");
		System.out.println();

		System.out.println("3개의 수를 입력 받아 작은 값에서 큰 값 순서로 정렬하시오.");
		System.out.println();

		Scanner sc = new Scanner(System.in);

		int num1, num2, num3, temp;

		System.out.print("세 개의 수를 입력하시오."); //50 30 10
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		num3 = sc.nextInt();

		if(num1>num2) {
			temp = num1;
			num1 = num2;
			num2 = temp;
		}
		if(num2>num3) {
			temp = num2;
			num2 = num3;
			num3 = temp;
		} 
		if(num1>num2) {
			temp = num1;
			num1 = num2;
			num2 = temp;
		}
		System.out.println(num1+":"+num2+":"+num3);
		System.out.printf("%d %d %d", num1, num2, num3);


	}

}
