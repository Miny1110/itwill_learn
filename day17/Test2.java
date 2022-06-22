package com.day17;

class MyTread2 implements Runnable{

	private int num;
	private String name;

	public MyTread2(int num, String name) {
		this.num = num;
		this.name = name;
	}

	@Override
	public void run() {

		int i=0;

		while(i<num) {

			System.out.println(name + i);
			i++;

			try {
				Thread.sleep(100);	
			} catch (Exception e) {

			}
		}
	}
}



public class Test2{

	public static void main(String[] args) {

		System.out.println("main 시작...");

		//인터페이스로 연결하면 스레드 생성이 필요하다
		Thread t1 = new Thread(new MyTread2(100,"첫번째: "));
		Thread t2 = new Thread(new MyTread2(200,"두번째: "));
		
		t1.start();
		t2.start();
		
		System.out.println("main 종료...");

	}
}
