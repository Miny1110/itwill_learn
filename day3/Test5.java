package com.day3;

import java.util.Scanner;

public class Test5 {

	public static void main(String[] args) {
		System.out.println("[If~else문]");
		System.out.println();
		
		Scanner sc = new Scanner(System.in);
		String name;
		int kor;
		
		System.out.print("이름 : ");
		name = sc.next();
		
		System.out.print("국어 점수 : ");
		kor = sc.nextInt();
		
		String pan;
		
		if(kor>=90) {
			pan = "수";
		} else if(kor>=80) {
			pan = "우";
		} else if(kor>=70) {
			pan = "미";
		} else if(kor>=60) {
			pan = "양";
		} else {
			pan = "가";
		}
		
		System.out.println(name + "의 국어 점수는 " + kor + "점이고 " + "환산 점수는 [" + pan + "]입니다.");
		System.out.printf("%s의 국어 점수는 %d점이고 환산 점수는 [%s]입니다.", name, kor, pan);
		
		sc.close(); //생략해도 오류 나지 않는다. 
	}


}
