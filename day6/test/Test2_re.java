package com.day6.test;

import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

public class Test2_re {

	public static void main(String[] args) throws IOException {

/*
2. 1~10사이의 난수를 발생시켜 발생시킨 난수를 3번안에 알아 맞추는 게임
   (3번안에 알아맞추지 못하면 발생된 난수를 출력)
*/
	
		Random rd = new Random();
		Scanner sc = new Scanner(System.in);
		
		int n, num, i;
		char a;
		
		
		while(true) {
			num = rd.nextInt(10)+1;
			
			for(i=0;i<3;i++) {
				System.out.printf("정수입력?[%d번째기회] : ", i+1);
				n = sc.nextInt();
				
				if(n<0 || n>10) {
					System.out.println("잘못된 접근");
				} else if(num!=n) {
					System.out.println("틀렸어요!!");
				} else {
					System.out.println("맞았어요!!");
					break;
				}
			}
			
			System.out.printf("\n정답은 %d입니다.\n", num);
			
			System.out.println("계속할래?[Y/N]");
			
			a = (char)System.in.read();
			
			if(a!='N' && a!='n') {
				
			} else {
				break;
			}
			
				
		}
	}

}
