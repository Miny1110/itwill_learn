package com.day17;

//인터럽트: 우선순위가 높은 프로그램을 먼저 실행시키고 다시 돌아옴

class MyThread7 extends Thread{
	
	private Thread next;
	
	public void setNext(Thread next) {
		this.next = next;
	}
	
	@Override
	public void run() {

		for(int i=1;i<=20;i++) {
			
			try {
				sleep(2000);
			} catch (Exception e) {
			
			}
			
			System.out.println(getName() + ":" + i);
		
			//스레드가 살아있으면 그 스레드를 멈춰라
			//스레드가 멈추면 다음 스레드가 자동으로 실행된다.
			if(next.isAlive()) {
				next.interrupt();
			}
		}
	}
}



public class Test7 {

	public static void main(String[] args) {

		//스레드 생성
		MyThread7 t1 = new MyThread7();
		MyThread7 t2 = new MyThread7();
		MyThread7 t3 = new MyThread7();
		
		t1.setNext(t2);
		t2.setNext(t3);
		t3.setNext(t1);
		
		t1.start();
		t2.start();
		t3.start();
		
		t1.interrupt(); //t1 스탑해 라는 명령. run의 try가 아니라 catch가 받고 그 아래 코드를 실행한다.
		
		try {
			
			t1.join();
			t2.join();
			t3.join();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("main 종료...");
		
	}
}
