package com.day4;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

public class Test4 {

	public static void main(String[] args) throws IOException {

		//어떤 수를 입력받아 1에서부터 수 까지의 합계를 구하시오.

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int su, sum = 0;
		char ch;

		while(true) { //무한루프

			do {

				System.out.print("원하는 수를 입력하시오.");
				su = Integer.parseInt(br.readLine()); 
				//숫자 앞에 엔터값[null]이 들어가기 때문에 오류가 생기는 것임.

			} while(su<1 || su>5000);

			sum = 0; // 초기화 작업을 해주지 않으면 값이 계속 누적이 된다.

			for(int i=1; i<=su; i++) {

				sum=sum+i;

			}

			System.out.println("1~" + su + "까지의 합 : " + sum);

			System.out.print("계속 입력하시겠습니까?[Y/N]");
			ch = (char)System.in.read(); // Ye

			if(ch != 'y' && ch != 'Y') {

				System.out.println("프로그램을 종료합니다.");

				break; 
				
			}
			
			System.in.skip(2);
		}

	}

}
/*
 Scanner는 enter값을 초기화 시켜서 상관이 없지만 BufferedReader를 사용할 경우에는
 System.in.skip(2); 값을 넣어서 엔터값을 초기화 시켜주어야 한다.
 엔터의 아스키코드는 2글자이기 때문에 System.in.skip(2);로 작성한다.
 */
