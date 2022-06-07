package com.day7.test;

import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

/*
2. 1~10사이의 난수를 발생시켜 발생시킨 난수를 3번안에 알아 맞추는 게임
   (3번안에 알아맞추지 못하면 발생된 난수를 출력)
 */


class Game {
	
	Random rd = new Random();
	Scanner sc = new Scanner(System.in);
	
	int randomNum;
	int i, n;
	char ch;
	
	//난수생성
	public void random() {
		randomNum = rd.nextInt(10)+1;
	}
	
	
	//반복입력 실행
	public void input() {
		
		for(i=0;i<3;i++) {
			System.out.printf("정수입력[%d번째기회]", i+1);
			n = sc.nextInt();
			
			if(n==randomNum) {
				System.out.println("정답입니다.\n");
				break;
			} else {
				System.out.println("오답입니다.\n");
			}
		}
	
		System.out.printf("\n정답은 %d 입니다.\n", randomNum);
			
	}
	

	//진행여부 입력받기
	public char user() throws IOException {
		
		System.out.println("계속할래?[Y/N]: ");
		ch = (char)System.in.read();
		return ch;
		
	}
}
	
	


public class Day6testTest2_re {

	public static void main(String[] args) throws IOException  {
		
		Game g = new Game();
		
		while(true) {
			g.random();
			g.input();
			char ch = g.user();
			
			if(ch!='N' && ch!='n') {
			} else {
				break;
			}
			
		}
		
	}

}
