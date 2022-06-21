package com.day17;

import java.util.Random;
import java.util.Scanner;

class MyThread10 implements Runnable{
	
	Scanner sc = new Scanner(System.in);
	Random rd = new Random();
	
	private static String[] name = 
		{"오세라","안수언","엄희성","김성현","윤다영",
		"김희진","이동우","최재혁","김홍수","서수현",
		"윤재일","정영진","박선미","전은지","류창주",
		"김수지","이은지","박수정","정성경","심민정",
		"윤채련","김영운","안시연","이정민","박수진",
		"윤서혜","정민정"};
	
	
	int num; //인원수
	
	
	//사용자에게 인원수 받기
	public void setNum() {
		
		System.out.print("발표자 인원수? ");
		num = sc.nextInt();
		
	}	
		
	
	public void array() {	
		
		//int 배열에 난수 담기
		int arrInt[] = new int[num];
		
		int n = 0;
		
		while(n<num) {
			
			arrInt[n] = rd.nextInt(27);
			
			for(int i=0;i<n;i++) {
				
				if(arrInt[i]==arrInt[n]) {
					n--;
					break;
				}
			}
			n++;
		}
		
		
		//name배열에서 난수 번호를 인덱스로 데이터 가져오기
		//가져온 데이터를 str 배열에 넣기
		String[] str = new String[num];
		
		for(int i=0;i<num;i++) {
			str[i] = name[arrInt[i]];
		}
		
		System.out.println();
		System.out.println("축하합니다!!,발표자입니다");
		System.out.println();
		
		for(int i=1;i<=num;i++) {
			System.out.printf("%d번 발표자: %s\n", i, str[i-1]);
		}
	}

	
	
	
	
	
	@Override
	public void run() {
		
		System.out.print("고민중");
		
		for(int i=1;i<10;i++) {
			try {
				
				Thread.sleep(300);
				System.out.print(".");
			} catch (Exception e) {
			}
		}
		System.out.println();
	}
}



public class Test10 {

	public static void main(String[] args) {

		MyThread10 ob = new MyThread10();
		
		Thread t = new Thread(ob);
		
		ob.setNum();
		t.start();
		
		try {
			//발표자 먼저 출력하지 말고 고민중... 다 출력될 때까지 기다려
			t.join();
		} catch (Exception e) {
			
		}
		
		ob.array();
		
		
	}

}
