package com.day17;

class MyTread1 extends Thread{
	
	private int num;
	private String name;
	
	public MyTread1(int num, String name) {
		this.num = num;
		this.name = name;
	}

	//Thread의 run메소드 오버라이드 필수
	@Override
	public void run() {

		int i = 0;
		
		while(i<num) {
			//this.getName: 스레드 이름
			System.out.println(this.getName() + ":" + name + i);
			i++;
			
			//번갈아가면서 출력되게 만들기 위해 작성
			//sleep은 반드시 try-catch문으로 묶어주어야 한다
			try {
				sleep(100); //1000=1초 -> 100=0.1초
			} catch (Exception e) {

			}
		}
	}
}



public class Test1 {

	public static void main(String[] args) {

		System.out.println("main 시작...");
		
		MyTread1 t1 = new MyTread1(100, "첫번째: ");
		MyTread1 t2 = new MyTread1(200, "두번째: ");

		t1.start(); //run()메소드 실행
		t2.start(); //run()메소드 실행
		
		System.out.println("main 종료...");
		
	}

}
