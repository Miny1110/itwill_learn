package com.day9.test;

import java.util.Scanner;

public class Score2 {

	Record2[] rec;
	Scanner sc = new Scanner(System.in);
	String subjectTitle[] = {"국어? ", "영어? ", "수학? "};
	
	private int i, j;
	private int inwon;
	
	public void set() {
		
		
		System.out.print("인원수? ");
		inwon = sc.nextInt();
		
		rec = new Record2[inwon];
		
		
	}
	
	
	public void input() {
		
		
		for(i=0;i<inwon;i++	) {
			rec[i] = new Record2();
			
			System.out.print("이름? ");
			rec[i].name = sc.next();
			
			for(j=0;j<3;j++) {
				System.out.print(subjectTitle[j]);
				rec[i].score[j] = sc.nextInt();
				
				rec[i].tot += rec[i].score[j];
			}
		
			rec[i].avg = rec[i].tot / 3;
			
		}
		
	}
	
	
	private void grade() {
		
		for(i=0;i<inwon;i++) {
			for(j=0;j<3;j++) {
				
				if(rec[i].score[j]>=90)
					rec[i].grade[j] = "A";
				else if(rec[i].score[j]>=80)
					rec[i].grade[j] = "B";
				else if(rec[i].score[j]>=70)
					rec[i].grade[j] = "C";
				else if(rec[i].score[j]>=60)
					rec[i].grade[j] = "D";
				else
					rec[i].grade[j] = "F";
				
			}
		}
		
	}
	
	
	public void print() {
		
		grade();
		
		for(i=0;i<inwon;i++) {
			System.out.printf("%4s: ", rec[i].name);
			for(j=0;j<3;j++) {
				System.out.printf("%4d점(%s)", rec[i].score[j], rec[i].grade[j]);
			}

			System.out.printf("\t총점:%4d점   평균:%4d점\n", rec[i].tot, rec[i].avg);
			
		}
		
	}
	
}