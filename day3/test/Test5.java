package com.day3.test;

import java.util.Scanner;


/*
5.단가 15,800원짜리 상품을 일정 수량 이상 구입시 할인을 해줍니다.
할인율은 다음과 같습니다.
10개 이상 -> 10%
20개 이상 -> 15%
30개 이상 -> 20%
판매금액을 계산해봅니다.
예) 구입수량 15개인 경우 -> 구입수량: 15개, 판매총금액: 213300원
 */


public class Test5 {

	public static void main(String[] args) {
		
		int num;
		int price = 0;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("구입수량");
		num = sc.nextInt();
		
		if(num>=30) {
			price = num * 15800 / 100 * 80;
		} else if(num>=20) {
			price = num * 15800 / 100 * 85;
		} else if(num>=10) {
			price = num * 15800 / 100 * 90;
		} else {
			price = num * 15800;
		}
		
		System.out.printf("구입수량: %d개, 판매총금액: %d원", num, price);
	}

}
