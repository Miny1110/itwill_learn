package com.day6;

import java.util.Scanner;

public class Test3 {

	public static void main(String[] args) {

		//10명 이내의 이름과 점수를 입력받아 석차 구하기
		
		//이름: String	점수: int
		
		Scanner sc = new Scanner(System.in);
		
		String[] name;
		int[] score;
		int[] rank;
		
		int i,j,temp1,inwon;
		String temp2;
		
		
		do {
			System.out.print("인원수[1~10]? ");
			inwon = sc.nextInt();
		}while(inwon<1 || inwon>10);
		
		
		//배열의 메모리 할당(배열 객체 생성)
		//new -> 객체를 생성했다는 말
		name = new String[inwon];
		score = new int[inwon];
		rank = new int[inwon];
		
		
		//Selection Sort(내림차순)
		for(i=0;i<inwon;i++) {
			System.out.print((i+1) + "번: 이름? 점수? ");
			name[i] = sc.next();
			score[i] = sc.nextInt();
		}
		
		
		//석차(rank 배열) 초기화
		for(i=0;i<inwon;i++) {
			rank[i] = 1;
		}
		
		
		
		//Selection Sort(석차 계산)
		for(i=0;i<inwon-1;i++) {
			
			for(j=i+1;j<inwon;j++) {
			
				//낮은 점수의 rank에 +1
				if(score[i]<score[j]) {
					rank[i]+=1;
				} else if(score[i]>score[j]) {
					rank[j]+=1;
				} 
				
			}
		}
		
		//출력
		for(i=0;i<inwon;i++) {
			System.out.printf("이름: %s | 점수: %d | [%d등]\n", name[i], score[i], rank[i]);
			
			
		}
		
	}

}
