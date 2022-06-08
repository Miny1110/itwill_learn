package com.day8.test;

import java.util.Scanner;

public class HealthData {

	
	Info[] data;
	Scanner sc = new Scanner(System.in);
	int inwon;
	int i, j;
	
	
	//인원수만큼의 공간 생성
	public void set() {
		
		do {
			System.out.print("인원수? ");
			inwon = sc.nextInt();
		} while(inwon<1 || inwon>10);
	
		data = new Info[inwon];
	
	}
	
	
	//사용자에게 입력정보 받기
	public void input() {
		
		String[] title = {"나이? ", "몸무게? ", "신장? "};
		
		for(i=0;i<inwon;i++) {
			data[i] = new Info();
			
			System.out.print("이름? ");
			data[i].name = sc.next();
			
			for(j=0;j<3;j++) {
				
				System.out.print(title[j]);
				data[i].info[j] = sc.nextInt();
				
			}
			
			data[i].BMI = data[i].info[1] / ((float)data[i].info[2]/100 * data[i].info[2]/100);
					
			
		}
		
	}
	
	
	//출력하기
	public void print() {
		
		String[] title = {"세", "kg", "cm"};
		
		for(i=0;i<inwon;i++) {
			System.out.printf("%4s", data[i].name);
			
			for(j=0;j<3;j++) {
				System.out.printf("%6d%s", data[i].info[j], title[j]);
			}
			
			System.out.printf("%6.1f\t", data[i].BMI);
			
			
			if(data[i].BMI>=30) {
				System.out.println("고도비만입니다.");
			} else if(data[i].BMI>=25) {
				System.out.println("비만입니다.");
			} else if(data[i].BMI>=23) {
				System.out.println("과체중입니다.");
			} else if(data[i].BMI>=18.5) {
				System.out.println("정상입니다.");
			} else {
				System.out.println("저체중입니다.");
			}
			
			
		
		}
		
	}
	
	
	
}
