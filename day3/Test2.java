package com.day3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Test2 {

	public static void main(String[] args) throws IOException {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int su = 0;
		
		System.out.print("수 입력? ");
		su = Integer.parseInt(br.readLine());
		
		String str;
		
		// 삼항 연산자 : ( 조건 ? 조건의 값이 true : 조건의 값이 false )
		str = su % 2 == 0 ? "짝수" : "홀수";
		
		str = su > 0 ? "양수" : (su <0 ? "음수" : "영");
		//조건은 거의 2개를 사용함. 3개까지 사용하기도 한다.
		
		str = su % 4 == 0 && su % 100 != 0 || su % 400 == 0 ? "윤년" : "평년";
		// A && B (A and B) : A, B 둘 다 true일 때 값이 true
		// A || B (A or B) : A, B 둘 중 하나만 true이면 값이 true
		// == : 같다. != : 같지 않다.
		// 변수가 같기 때문에 값이 덮어씌워져서 결국에는 맨 아래에 있는 식으로 값이 출력이 된다.
		
		System.out.println(su + " : " + str);
		
	}

}
