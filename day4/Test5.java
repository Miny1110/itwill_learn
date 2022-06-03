package com.day4;

public class Test5 {

	public static void main(String[] args) {
		System.out.println("[다중 for문]");
		System.out.println();
		
		//이중 for문으로 구구단 표현하기
		int i,j;
		
		for(i=2;i<=9;i++) {
			
			System.out.println(i + "단");
			
			for(j=1;j<=9;j++) {
				
				System.out.println(i + " * " + j + " = " + (i*j));
				
			}
			System.out.println();
		}
		
	}

}
