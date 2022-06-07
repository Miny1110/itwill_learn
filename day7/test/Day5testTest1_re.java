package com.day7.test;

import java.util.Scanner;

class Sub2 {
	
	int n[] = new int[5];
	int i, j, temp;
	
	public void input() {
		Scanner sc = new Scanner(System.in);
		System.out.print("다섯개의 정수를 입력하세요: ");
		
		for(i=0;i<5;i++) {
			n[i] = sc.nextInt();
		}
	}
	
	
	
	public void sort() {
		
		for(i=0;i<n.length-1;i++) {
			for(j=i+1;j<n.length;j++) {
				if(n[i]<n[j]) {
					temp = n[i];
					n[i] = n[j];
					n[j] = temp;
				}
			}
		}
	}
	
	
	
	public void print1() {
		
		System.out.print("입력값(내림차순): ");
		for(i=0;i<5;i++) {
			System.out.print(n[i] + " ");
		}
		System.out.println();
		
	}
	
	
	public int max() {
		int max = n[0];
		return max;
	}
	
	
	public int min() {
		int min = n[4];
		return min;
	}
	
	
	
	public void print2(int max, int min) {
		System.out.println("가장 큰 수: " + max);
		System.out.println("가장 작은 수: " + min);
	}
	
	
}





public class Day5testTest1_re {

	public static void main(String[] args) {

		Sub2 s = new Sub2();
		
		s.input();
		s.sort();
		s.print1();
		int a = s.max();
		int b = s.min();
		s.print2(a, b);
		
		
	}

}
