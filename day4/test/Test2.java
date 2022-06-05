package com.day4.test;

public class Test2 {

	public static void main(String[] args) {

/*
2. 1에서 100까지 수의 홀수의 합, 짝수의 합, 전체의 합
짝수합 : 2550
홀수합 : 2500
합 : 5050
 */
		
		int i=0, sum1=0, sum2=0, sum3=0;

		for(i=1;i<=100;i++) {
			
			if(i%2 == 0) {
				sum1 += i;
			}
			
			if(i%2 != 0) {
				sum2 += i;
			}
			
			sum3 += i;
		}
		
		System.out.println("짝수합 : " + sum1);
		System.out.println("홀수합 : " + sum2);
		System.out.println("합 : " + sum3);
		
		
	}

}
