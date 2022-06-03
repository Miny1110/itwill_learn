package com.day4;

import java.util.Scanner;

public class Test1 {

	public static void main(String[] args) {
		System.out.println("[반복문을 이용해 구구단 만들기]");
		System.out.println();

		//반복문(for, while, do~while)

		Scanner sc = new Scanner(System.in);

		int dan;

		System.out.print("단 입력 : "); //7
		dan = sc.nextInt(); //형 변환
		System.out.println();

		/*
		for문
		for(초기값;최대값;증가값) { }
		 */
		//시작값과 끝값을 명확하게 알 떄
		System.out.println("[for문]");
		for(int i=1;i<=9;i++) {

			System.out.println(dan + "*"+ i + "=" + (dan*i));
			// System.out.printf("%d*%d=%d\n",dan,i,(dan*i)); printf로 출력하기

		}

		System.out.println("--------------------------");
		System.out.println("[while문]");
		/*
		while문
		초기값
		while(최대값){증가값}
		증가값을 입력하지 않으면 무한루프에 걸리게 된다.
		 */
		//초기값이 0일 경우 부등호 =는 빼준다.
		//while문에서는 보통 초기값으로 0을 준다.(배열때문에)
		// 부등호 =을 입력하면 9단이 아닌 10단까지 출력이된다.
		// 이 값을 몇번이나 출력해야할지 모르겠을때는 while문 이용
		int j = 0;
		while(j<9) {
			j++;
			System.out.println(dan + "*"+ j + "=" + (dan*j));

		}

		System.out.println("--------------------------");
		System.out.println("[do~while문]");
		/*
		 do~while문 
		 초기값
		 do {증가값} while (최대값)
		 */
		//조건이 false라도 무조건 한번은 실행한다.
		//일단 한 번은 실행 한 후 나중에 생각하는 것으로 보면된다.
		//처음 값이 false면 그 다음부터는 값이 출력이 되지 않는다.
		int k = 0;
		do {
			k++;
			System.out.println(dan + "*"+ k + "=" + (dan*k));
		} while (k<9);


	}

}
