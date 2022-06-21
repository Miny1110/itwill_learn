package com.day17;

import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

//정해진 시간마다 특정 작업을 수행

public class Test9 extends Thread {

	private int num = 0;
	
	public Test9() {
		
		//생성자 안에 코딩
		TimerTask task = new TimerTask() {
			
			@Override
			public void run() { //반복 실행할 작업
				
				num = 0;
				
			}
		};
		
		Timer t = new Timer();
		Calendar now = Calendar.getInstance();
		
		/*
		내일 0시 0분 0초부터 하루에 한번씩 반복
		now.add(Calendar.DATE, 1);
		now.set(Calendar.HOUR, 0); //오후1시:13
		now.set(Calendar.MINUTE, 0);
		now.set(Calendar.SECOND, 0);
		now.set(Calendar.MILLISECOND, 0);
		t.schedule(task, now.getTime(), 1000*60*60*24); //1000*60*60*24: 밀리세컨,초,분,시
		*/
		
		//현재 시점으로부터 5초마다 실행
		t.schedule(task, now.getTime(), 5000);
		
	}
	
	@Override
	public void run() {
		
		while(true) {
			
			System.out.println(num++);
			
			try {
				sleep(1000);
			} catch (Exception e) {

			}
		}
	}
	
	public static void main(String[] args) {

		//객체생성과 메소드호출을 한번에
		new Test9().start();
		
		//Test9 ob = new Test9();
		//ob.start();
		
	}
}
