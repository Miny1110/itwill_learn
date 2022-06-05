package com.day4.test;

public class Test4 {

	public static void main(String[] args) {

/*
4. 1에서 100까지의 수중 3의 배수의 갯수
3의 배수의 개수 : 33
 */
		
		int i, cnt=0;
		
		for(i=1;i<=100;i++) {
			if(i%3 == 0) {
				cnt++;
			}
		}
		
		System.out.println("3의 배수의 개수 : " + cnt);
		
		
	}

}
