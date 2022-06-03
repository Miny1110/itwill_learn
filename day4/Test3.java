package com.day4;

public class Test3 {

	public static void main(String[] args) {
		System.out.println("[제어문]");
		System.out.println();
		
		int n,sum;
		
		sum=0;
		
		System.out.println("[100까지의 합]");
		for(n=1;n<=100;n++) {
			sum += n; 
			//sum = sum + n
		}
		System.out.println("결과: " +  sum);
		System.out.println();
		
		sum=0;
		
		System.out.println("[홀수의 합]");
		for(n=1;n<=100;n+=2) {
			sum += n;
		}
		
		System.out.println("결과: " +  sum);
		System.out.println();
		
		sum=0;
		
		System.out.println("[짝수의 합]");
		for(n=2;n<=100;n+=2) {
			sum += n;
		}
		System.out.println("결과: " +  sum);
		System.out.println();
		
		System.out.println("[홀수 구하기]");
		int cnt=0;
		for(n=1;n<=100;n++) {
			if(n%2!=0) {
				cnt++; 
				//cnt=cnt+1
			}
		}
		System.out.println("홀수의 갯수 :" + cnt);
		
	}

}
