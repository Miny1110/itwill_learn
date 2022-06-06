package com.day6;

import java.util.Scanner;

public class Test3_re {

	public static void main(String[] args) {

		//10명 이내의 이름과 점수를 입력받아 석차 구하기
		
		//이름: String	점수: int
		
		Scanner sc = new Scanner(System.in);
		
		String name[];
		int score[];
		int rank[];
		
		int inwon, i, j, temp1, temp3;
		String temp2;
		
		do {
			System.out.print("인원?[1~10]");
			inwon = sc.nextInt();
		} while(inwon<0 || inwon>10);
		
		name = new String[inwon];
		score = new int[inwon];
		rank = new int[inwon];
		
		for(i=0;i<inwon;i++) {
			System.out.print("이름과 점수를 입력하세요 : ");
			name[i] = sc.next();
			score[i] = sc.nextInt();
		}
		
		
		for(i=0;i<inwon;i++) {
			rank[i] = 1;
		}
		
		for(i=0;i<inwon-1;i++) {
			for(j=i+1;j<inwon;j++) {
				if(score[i]<score[j]) {
					rank[i]++;
				} else if(score[i]>score[j]) {
					rank[j]++;
				}
			}
		}
		
		for(i=0;i<inwon-1;i++) {
			for(j=i+1;j<inwon;j++) {
				if(score[i]<score[j]) {
					temp1 = score[i];
					score[i] = score[j];
					score[j] = temp1;
					
					temp2 = name[i];
					name[i] = name[j];
					name[j] = temp2;
					
					temp3 = rank[i];
					rank[i] = rank[j];
					rank[j] = temp3;
				}
			}
		}
		
		for(i=0;i<inwon;i++) {
			System.out.printf("%d등: %s(%d점)\n", rank[i], name[i], score[i]);
		}
		
	}

}
