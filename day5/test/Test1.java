package com.day5.test;

import java.util.Scanner;

public class Test1 {

	public static void main(String[] args) {

/*
1. 5개의 정수를 입력받아 입력받은 수를 출력하고 입력받은 수중
   가장 큰수와 적은수를 출력		
 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("다섯개의 정수를 입력하세요. ");
		
		int[] num = new int[5];
		int i, j, temp;
		
		for(i=0;i<num.length;i++) {
			num[i] = sc.nextInt();
		}
		
		for(i=0;i<num.length-1;i++) {
			
			for(j=i+1;j<num.length;j++) {
				
				if(num[i]>num[j]) {
					temp = num[i];
					num[i] = num[j];
					num[j] = temp;
				}
			}
		}
		
		System.out.println("가장 큰 수: " + num[0]);
		System.out.println("가장 작은 수: " + num[4]);
		
		
	}

}
