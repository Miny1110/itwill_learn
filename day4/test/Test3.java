package com.day4.test;

public class Test3 {

	public static void main(String[] args) {
		
/*
3. 1-2+3-4+5-6+7-8+9-10
결과 : -5
 */
		int i,sum=0;
		
		
		for(i=1;i<=10;i++) {
			
			if(i%2 != 0) {
				sum += i;
			} else if(i%2 == 0) {
				sum -= i;
			}
			
		}
	
		System.out.println("결과 : " + sum);
	
	}

}
