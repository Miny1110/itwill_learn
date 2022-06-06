package com.day6;

import java.util.Scanner;

public class Test1_re {

	public static void main(String[] args) {

		//10명 이내의 이름과 점수를 입력받아 점수가 높은 사람 순으로 출력
		
		//이름: String	점수: int
		
		Scanner sc = new Scanner(System.in);
		
		String name[];
		int score[];
		int i, j, temp1, inwon;
		String temp2;
		
		
		do {
			System.out.print("인원수?[1~10]: ");
			inwon = sc.nextInt();
		} while(inwon<0 || inwon>10);
		
		
		name = new String[inwon];
		score = new int[inwon];
		
		
		
		for(i=0;i<inwon;i++) {
			System.out.println((i+1) + "번: 이름과 점수를 입력하세요.");
			name[i] = sc.next();
			score[i] = sc.nextInt();
				
			if(score[i]<0 || score[i]>100) {
				System.out.println("오류발생");
				i--;
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
					
				} 
			}
		}
		
		
		for(i=0;i<inwon;i++) {
			System.out.printf("%s: %d\n",name[i], score[i]);
		}
		
		
		
		
		
		
	}

}
