package com.day17;

import java.util.Calendar;

class TClock implements Runnable{

	@Override
	public void run() {
	
	//1초마다 시간을 읽어와서 현재 날짜와 시간을 찍게끔 코딩
	
		while(true) {
			
			System.out.printf("%1$tF %1$tT\n", Calendar.getInstance());
			
			try {
				Thread.sleep(1000);
			} catch (Exception e) {
			}
			
			/*
			Calendar를 while문 안으로 넣어서 계속 날짜와 시간을 읽어오고, 그 값을 출력하도록 해야 한다.
			
			Calendar now = Calendar.getInstance();
			
			System.out.printf("%tF: ", now); 
			System.out.printf("%tT\n", now); 
			
			try {
				Thread.sleep(1000);
			}catch (Exception e) {
			}
			*/
		}
	}
}


public class Test3 {

	public static void main(String[] args) {

		Thread t = new Thread(new TClock());
		
		t.start();
		
	}

}
