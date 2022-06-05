package com.day4.test;

public class Test1 {

	public static void main(String[] args) {

/*
1. (1)+(1+2)+(1+2+3)+...+(1+2+3+...+10)
결과 : 220		 
*/
		
		int i, sum1=0, sum2=0;
		
			for(i=1;i<=10;i++) {
				sum1 += i;
				sum2 += sum1;
			}
		
		System.out.println("결과 : " + sum2);
		
	}

}
