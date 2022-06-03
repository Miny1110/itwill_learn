package com.day4;

public class test6 {

	public static void main(String[] args) {
		System.out.println("[다중 for문을 이용해 '*' 찍기]");
		System.out.println();
		
		int i,j;
		
		for(i=1;i<=5;i++) {
		
			for(j=1;j<=5-i;j++) {
				System.out.print(" "); // 공백 한 칸 띄어주기
			}
			
			for(j=1;j<=i;j++) {
				System.out.print("*");
			}
			
			System.out.println();
		
		}

		
		for(i=5;i>=1;i--) {
			
			for(j=1;j<=5;j++) {
				System.out.print(" "); // 공백 한 칸 띄어주기
			}
			
			for(j=1;j<=i;j++) {
				System.out.print("*");
			}
			
			System.out.println();
		
		}
		
		System.out.println();
		
		for(i=1;i<=5;i++) {
			
			for(j=1;j<=5-i;j++) {
				System.out.print(" "); // 공백 한 칸 띄어주기
			}
			
			for(j=1;j<=i*2-1;j++) {
				System.out.print("*");
			}
			
			System.out.println();
		
		}
		
		for(i=5;i>=1;i--) {
			
			for(j=1;j<=5-i;j++) {
				System.out.print(" "); // 공백 한 칸 띄어주기
			}
			
			for(j=1;j<=i*2-1;j++) {
				System.out.print("*");
			}
			
			System.out.println();
		
		}
		
		
		
	}

}

//최대값에 들어가는 값은 1이 아니고 i인 것 유의하기