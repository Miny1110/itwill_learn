package com.day6;

public class Test4_re {

	public static void main(String[] args) {

		//Bubble Sort
		
		int num[] = {28, 62, 41, 19, 75};
		
		int i, j, temp;
		
		for(int n : num) {
			System.out.printf("%4d", n);
		}
		
		for(i=1;i<num.length;i++) {
			for(j=0;j<num.length-1;j++) {
				if(num[j]>num[j+1]) {
					temp = num[j];
					num[j] = num[j+1];
					num[j+1] = temp;
				}
			}
		}
		
		System.out.println();
		for(int n : num) {
			System.out.printf("%4d", n);
		}
		
	}

}
