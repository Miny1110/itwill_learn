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
	
	
	private String panjung(int jumsu) {
		
		String pan;
		
		//int를 10으로 나누면 소수점 아래는 생략되니까 원점수가 0으로 끝나지 않더라도 case 경우에 무조건 속하게 된다.
		switch(jumsu/10) {
		
		case 10:
		case 9:
			pan = "수"; break;
		case 8:
			pan = "우"; break;
		case 7:
			pan = "미"; break;
		case 6:
			pan = "양"; break;
		default:
			pan = "가"; break;

		}
		return pan;
	}
	
	
	public void print() {
		
		grade();
		
		for(i=0;i<inwon;i++) {
			System.out.printf("%4s: ", rec[i].name);
			for(j=0;j<3;j++) {
				System.out.printf("%4d점(%s,%s)", rec[i].score[j], rec[i].grade[j], panjung(rec[i].score[j]));
			}

			System.out.printf("\t총점:%4d점   평균:%4d점\n", rec[i].tot, rec[i].avg);
			
		}
		
	}
	
}
