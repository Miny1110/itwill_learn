package com.day6;

public class Test4 {

	public static void main(String[] args) {

		//Bubble Sort
		
		int[] num = {28,20,15,10,8};
		
		int i,j,temp;
		
		System.out.printf("Source Data: ");
		for(int su : num) {
			System.out.printf("%4d", su);
		}
		
		System.out.println();
		
		
		for(i=1;i<num.length;i++) {
			
			for(j=0;j<num.length-i;j++) {
				
				if(num[j]>num[j+1]) {
					temp = num[j];
					num[j] = num[j+1];
					num[j+1] = temp;
				}
			}
		
		}
		
		
		
		
		
		
		System.out.printf("Sorted Data: ");
		for(int su : num) {
			System.out.printf("%4d", su);
		}
		
		System.out.println();

	}

}
