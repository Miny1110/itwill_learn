package com.day7.test;

import java.util.Scanner;

class Cir {
	
	int r;
	
	//반지름 입력받기
	void input() {
		Scanner sc = new Scanner(System.in);
		System.out.println("반지름? ");
		r = sc.nextInt();
	}
	
	
	//넓이구하기
	double area() {
		
		double area;
		area = r * r *3.14;
		return area;
	
	}
	
	
	//둘레구하기
	double len() {
		
		double len;
		len = r * 2 * 3.14;
		return len;
	}
	
	
	//출력하기
	void print(double area, double len) {
		System.out.println("넓이: " + area + ", 둘레: " + len);
	}
	
}



public class Day2Test3_re {

	public static void main(String[] args) {

		Cir c = new Cir();
		
		c.input();
		double area = c.area();
		double len = c.len();
		c.print(area, len);
		
		
		
/*		
		int r = 10;
		float area, length; 
		
		area = 10;
		System.out.println(area);
		
		area = r*r*3.14f;
		
		length = r*2*3.14f;
		
		System.out.printf("반지름:%d, 넓이:%f\n", r, area);
		System.out.printf("반지름:%d, 넓이:%.2f\n", r, area);
		System.out.println("반지름:"+ r + ", 둘레:" + length);
*/
		
	}

}
