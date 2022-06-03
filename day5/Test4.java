package com.day5;

public class Test4 {

	public static void main(String[] args) {
		System.out.println("[Selection sort]\n");

		int num[] = {35, 27, 13, 7, 2};

		int i, j, temp;

		System.out.print("Source Data: ");
		for(i=0;i<num.length;i++) {
			System.out.printf("%4d", num[i]);
		}
		System.out.println();

		for(i=0;i<num.length-1;i++) {

			for(j=i+1;j<num.length;j++) {

				if(num[i]>num[j]) {

					temp = num[i];
					num[i] = num[j];
					num[j] = temp;

				}

			}

		} System.out.print("Source Data: ");
		for(i=0;i<num.length;i++) {
			System.out.printf("%4d", num[i]);
		}
		System.out.println();

	} 

}
