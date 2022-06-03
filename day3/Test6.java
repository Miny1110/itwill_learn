package com.day3;

import java.util.Scanner;

//Scanner : 단락 문자의 패턴을 사용해 구분한다.
//BufferedReader가 입력해야할 것이 많고 귀찮아 대신해서 사용하는 경우가 많음
// ,와 같은 별도의 기호를 사용하는 공식은 많이 사용하지 않는다.

public class Test6 {

	public static void main(String[] args) {

		System.out.println("[Scanner와 BufferedReader의 차이점]");
		System.out.println();
		
		Scanner sc = new Scanner(System.in);
		
		String name;
		int kor, eng, mat;
		
		//System.out.print("이름 국어 영어 수학?"); 
		//suzi 50 70 80 공백은 기본 단락을 구분짓은 것이다. 공백을 읽을 수는 없다.
		
		System.out.print("이름,국어,영어,수학?"); 
		//suzi,50,70,80 기호로 단락을 구분지을 때는 기호 뒤에 공백이 붙으면 에러가 난다.
		//,를 만나면 멈춘 후 그 뒤에 데이터를 읽는 것이다.
		
		sc = new Scanner(sc.next()).useDelimiter("\\s*,\\s*");
		
		name = sc.next();
		kor = sc.nextInt();
		eng = sc.nextInt();
		mat = sc.nextInt();
		
		System.out.println(name + ":" + (kor+eng+mat) + "점");
		
		sc.close(); //생략할 수 있다. 입력하지 않아도 문제 없이 값이 출력이 됨.
	}

}
