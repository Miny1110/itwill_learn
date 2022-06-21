package com.day17;

class MyTread4 extends Thread{
	
	private String name;
	
	public MyTread4(String name) {
		this.name = name;
	}
	
	@Override
	public void run() {
		for(int i=1;i<=20;i++) {
			System.out.println(name + ":" + i);
		}
	}
}


public class Test4 {

	public static void main(String[] args) {

		MyTread4 ob1 = new MyTread4("A");
		MyTread4 ob2 = new MyTread4("B");
		MyTread4 ob3 = new MyTread4("C");
		//스레드는 총 4개: ob1~3 + main메소드
		
		
		//스레드 우선순위
		System.out.println("MIN: " + Thread.MIN_PRIORITY); //1(1이 우선순위 가장 낮음)
		System.out.println("MORM: " + Thread.NORM_PRIORITY); //5
		System.out.println("MAX: " + Thread.MAX_PRIORITY); //10(10이 우선순위 가장 높음)
		
		
		//우선순위 출력
		System.out.println(ob1.getPriority()); //5
		System.out.println(ob2.getPriority()); //5
		System.out.println(ob3.getPriority()); //5
		
		ob1.setPriority(Thread.MIN_PRIORITY); //1
		ob2.setPriority(Thread.NORM_PRIORITY); //5
		ob2.setPriority(Thread.MAX_PRIORITY); //10
		
		
		ob1.start();
		ob2.start();
		ob3.start();
		
		
	}

}
