package com.day4.test;

import java.util.Scanner;

public class Test5 {

	public static void main(String[] args) {

/*
5. 두수를 입력받아 적은 수에서 큰수까지의 합
1~100 까지의 합 : 5050
 */
		
		Scanner sc = new Scanner(System.in);
		
		int num1, num2, sum=0;
		
		System.out.println("숫자 두 개를 입력하세요 ");
		
		num1 = sc.nextInt();
		num2 = sc.nextInt();
		
		int i=num1, j=num2;
		
		if(i<j) {
			for(i=i;i<=j;i++) {
				sum += i;
			}
		} else if(j<i) {
			for(j=j;j<=i;j++) {
				sum += j;
			}
		}
		
		if(num1<num2) {
			System.out.printf("%d~%d 까지의 합 : %d", num1, num2, sum );
		} else if(num2<num1) {
			System.out.printf("%d~%d 까지의 합 : %d", num2, num1, sum );
		}
		
	}

}
