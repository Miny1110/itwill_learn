package com.day6.test;

import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

public class Test2 {

	public static void main(String[] args) throws IOException {

/*
2. 1~10사이의 난수를 발생시켜 발생시킨 난수를 3번안에 알아 맞추는 게임
   (3번안에 알아맞추지 못하면 발생된 난수를 출력)
*/
		Scanner sc = new Scanner(System.in);
		Random rd = new Random();
		
		while(true) {
			
			int n = rd.nextInt(10)+1;
			int a, i;
			char ch;
			
			for(i=1;i<4;i++) {
				
				System.out.print("정수입력?[" + i + "번째기회] : ");
				a = sc.nextInt();
				
				if(n==a) {
					System.out.println("맞았어요!!");
					break;
				} else {
					System.out.println("틀렸어요!!");
				}
				
			}
			
			System.out.printf("\n정답은 %d입니다.", n);
			System.out.println("\n\n계속할래?[Y/N] : ");
			ch = (char) System.in.read();
			
			if(ch!='n' && ch!='N') {
				
			} else {
				break;
			}
		}
		
		
	}

}
