package com.day17;

//스레드 생명주기

class MyThread6 extends Thread{

	@Override
	public void run() {

		try {

			System.out.println("스레드 시작.."); //5

			System.out.println("스레드 우선순위: " + getPriority()); //6
			System.out.println("스레드 이름: " + getName()); //7

			sleep(500); //쉬는동안 main 남은것 실행
			//0.5초 쉬고 우선순위바꾸기

			setPriority(2);
			System.out.println("변경된 우선순위: " + getPriority()); //9

			System.out.println("스레드 종료"); //10

		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}



public class Test6 {

	public static void main(String[] args) {
		
		Thread t1=Thread.currentThread(); //main현재 스레드 이름을 읽어옴
		Thread t2= new MyThread6();
		//MyThread6 t2= new MyThread6(); 이렇게도 된다. 걍 마이스레드6이 부모한테 물려받은거말고는 다른 메소드가 없어서 저거도 가능
		
		
		System.out.println("메인스레드 우선순위 : " + t1.getPriority()); //메인스레드 우선순위 default 5 //1
		System.out.println("메인스레드 이름 : " + t1.getName()); //main //2
		
		System.out.println("t2.start메소드 호출전 is Alive: " + t2.isAlive()); //살아있는지, (실행 전이라 false가 출력) //3
		
		t2.start(); //스레드 호출
		
		/*t2의우선순위
		System.out.println("t2스레드 우선순위 : " + t2.getPriority());
		System.out.println("메인스레드 이름 : " + t2.getName());
		
		System.out.println("t2.start메소드 호출전 is Alive: " + t2.isAlive());
		*/
		
		//t2의 우선순위
		System.out.println("t2 우선순위: " + t2.getPriority()); //4
		
		t2.setPriority(1); //t2의 우선순위 1로 바꿔라. 5->1
		
		try {
			Thread.sleep(100); //쉬는동안 t2.run 실행
			System.out.println("t2 살아있냐? " + t2.isAlive()); //8
			
			Thread.sleep(1000); //쉬는동안 남은 run 실행
			System.out.println("1초 쉬고 t2 살아있냐?: " + t2.isAlive());
			
			t2.join(); //스레드가 끝날때까지 기다릴때 join 사용
			System.out.println("t2 그래도 살아있냐?: " + t2.isAlive()); //11
			
			
		}catch (Exception e) {

		}
		
		System.out.println("main 종료..."); //12
		
	}
}
