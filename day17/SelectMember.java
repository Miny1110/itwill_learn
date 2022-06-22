package com.day17;

import java.util.Random;
import java.util.Scanner;

class MyThread extends Thread{
		
	int cnt = 0;
	String str;
	
	public void run(){
		
		while(true){
						
			System.out.print(".");
						
			try {
				sleep(300);
				
				if(cnt==20)
					break;	
				
				cnt++;				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}		
			
		}
	}
	
}

public class SelectMember{

	//명단만 수정
	private static String[] name = 
		{"오세라","안수언","엄희성","김성현","윤다영",
		"김희진","이동우","최재혁","김홍수","서수현",
		"윤재일","정영진","박선미","전은지","류창주",
		"김수지","이은지","박수정","정성경","심민정",
		"윤채련","김영운","안시연","이정민","박수진",
		"윤서혜","정민정"};
	
	private final static int saram = name.length;//학생 총인원수
		
	public static void main(String[] args) {		
				
		Thread ob = new MyThread();
		
		Scanner sc = new Scanner(System.in);
		Random rd = new Random();
		int[] num;
		int inwon,i,n;	 		
				
		do{
			System.out.print("발표자 인원수?");
			inwon = sc.nextInt();
		}while(inwon<1||inwon>saram);
		
		num = new int[inwon];		
		
		n=0;
		while(n<inwon){
			
			num[n] = rd.nextInt(saram)+1;
			
			for(i=0;i<n;i++){
				
				if(num[i]==num[n]){
					n--;
					break;
				}				
			}			
			
			n++;
		}
				
		
		System.out.print("고민중");
		ob.start();
		
		try {
			ob.join();
									
		} catch (Exception e) {
			// TODO: handle exception
		}
		
				
		//출력		
		System.out.println();
		System.out.println();	
		System.out.println("축하합니다!!,발표자 입니다");
		System.out.println();
		
		int cnt=1;
		for(int su : num){
			
			System.out.printf(cnt + "번 발표자 : %5s\n",name[su-1]);
					
			cnt++;
		}
		
		System.out.println();			
				
	}

}


