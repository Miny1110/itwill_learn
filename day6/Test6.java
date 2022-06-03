package com.day6;

public class Test6 {

	public static void main(String[] args) {

		//배열의 배열
		
		int[][] arr = new int [6][6];	//초기값 0이 들어가있는 2차원 배열
		
		int i,j;
		int n;
		
		n = 0;
		
		//i: 행		j: 열
		for(i=0;i<5;i++) {
			for(j=0;j<5;j++) {
				n++;
				arr[i][j] = n;
				
				arr[i][5] += n;	//행 누적합
				arr[5][j] += n;	//열 누적합
				arr[5][5] += n;	//총 누적합
			}
		}

		
		for(i=0;i<arr.length;i++) {
			for(j=0;j<arr.length;j++) {
				System.out.printf("%4d", arr[i][j]);
			}
			System.out.println();
		}
		
		System.out.println("=========================");

		//2차원 배열 선언과 초기화 동시에 하는 법
		int[][] a = {{1,2,3}, {4,5,6}, {7,8,9}};
		int[][] b = {{9,8,7}, {6,5,4}, {3,2,1}};
		int[][] sum = new int[3][3];
		
		for(i=0;i<a.length;i++) {
			for(j=0;j<b.length;j++) {
				sum[i][j] = a[i][j]*b[i][j];
				
				System.out.printf("%4d",sum[i][j]);
			}
			System.out.println();
		}
		
		
	}

}
