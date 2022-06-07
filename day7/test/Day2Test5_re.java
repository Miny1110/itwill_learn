package com.day7.test;

import java.util.Scanner;

class Sub1 {
	
	String name;
	int tot, kor, eng;
	
	Scanner sc = new Scanner(System.in);
	
	public String input1() {
		
		System.out.print("이름? ");
		name = sc.next();
		
		return name;
		
	}
	
	public void input2() {
		
		System.out.print("국어? ");
		kor = sc.nextInt();
		
		System.out.print("영어? ");
		eng = sc.nextInt();
		
	}
	
	
	
	
	public int total() {
		
		tot = kor + eng;
		
		return tot;
		
	}
	
	void print(String n, int t) {
		System.out.println("이름: " + n + ", 총합: " + t);
	}
}




public class Day2Test5_re {

	public static void main(String[] args) {

		Sub1 s1 = new Sub1();
		
		String n = s1.input1();
		s1.input2();
		int t = s1.total();
		s1.print(n, t);
		
		
	}

}
