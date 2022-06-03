package com.day6.test;

import java.util.Random;
import java.util.Scanner;

public class Test3 {

	public static void main(String[] args) {

/*
3. 1~3사이의 난수를 발생시켜 가위,바위,보 게임 프로그램 작성
  1:가위, 2:바위, 3:보
 */
		
		Random rd = new Random();
		Scanner sc = new Scanner(System.in);
		
		int com, user;
		
		String[] game = {"가위", "바위", "보"};

		com = rd.nextInt(3);
		
		System.out.print("1:가위, 2:바위, 3:보 ? ");
		user = sc.nextInt()-1;
		
		System.out.printf("컴퓨터: %s	사람: %s\n", game[com], game[user]);
		
		if(user==0) {
			if(com==0) {
				System.out.println("비겼습니다.");
			}else if(com==1) {
				System.out.println("컴퓨터가 이겼습니다.");
			}else {
				System.out.println("당신이 이겼습니다.");
			}
		}
		
		if(user==1) {
			if(com==0) {
				System.out.println("당신이 이겼습니다.");
			}else if(com==1) {
				System.out.println("비겼습니다.");
			}else {
				System.out.println("컴퓨터가 이겼습니다.");
			}
		}
		
		if(user==2) {
			if(com==0) {
				System.out.println("컴퓨터가 이겼습니다.");
			}else if(com==1) {
				System.out.println("당신이 이겼습니다.");
			}else {
				System.out.println("비겼습니다");
			}
		}
		
	}

}
