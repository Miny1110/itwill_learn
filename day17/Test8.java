package com.day17;

class MyThread8 implements Runnable{

	private int bank = 10000; //잔고
	private int getBank() {
		return bank;
	}

	private int drawMoney(int m) {
		bank -= m; //bank=bank-m;
		return m;
	}

	@Override
	public void run() {

		int money_need = 6000; //인출금액
		int money;
		String msg = "";

		try {

			//동기화 블럭: 하나의 스레드가 들어와서 완벽하게 처리하기 전까지 다른 스레드가 들어오지 못하게 하는 것
			//돈을 다룰 때 마이너스 통장이 생기지 않도록 하기 위해 사용한다
			//this: 이 객체
			synchronized (this) { 
				
				if(getBank()>=money_need) {

					money = drawMoney(money_need);
					msg = "인출성공";
				} else {

					money = 0;
					msg = "인출실패";
				}

			}

			System.out.println(Thread.currentThread().getName() + msg + ", 인출금액: " + money + ", 잔고: " + getBank());

		} catch (Exception e) {

		}
	}
}



public class Test8 {

	public static void main(String[] args) {

		MyThread8 ob = new MyThread8();

		Thread t1 = new Thread(ob);
		Thread t2 = new Thread(ob);

		//Thread t1 = new Thread(new MyThread8());
		//Thread t2 = new Thread(new MyThread8());

		t1.start();
		t2.start();

	}

}
