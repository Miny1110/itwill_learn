package com.day12;

class Test {
	
	protected int a = 10, b = 20;
	
	public void write() {
		
		System.out.println("부모클래스 write()...");
		System.out.println("a: " + a + ", b: " + b);
		
	}
}


class Demo extends Test {
	
	protected int b = 30, c = 40;
	
	@Override
	public void write() {
		System.out.println("자식클래스 write()...");
		System.out.println("a: " + a + ", b: " + b + ", c: " + c);
		System.out.println("super.b: " + super.b);
	}
	
	public void print1() {
		System.out.println("자식클래스 print1()...");
		write();
	}
	
	public void print2() {
		System.out.println("자식클래스 print2()...");
		super.write();
	}
}


public class Test4 {

	public static void main(String[] args) {

		Demo ob = new Demo();
		
		ob.write();
		ob.print1();
		ob.print2();
		
		System.out.println(ob.b); //30
		//System.out.println(super.b); //외부에서는 super 사용이 불가능하다. 부모자식관계 클래스 내 메소드 안에서만 사용 가능하다. 
		
		System.out.println(((Test)ob).b); //20
		//ob를 Test로 형변환. 자식을 부모로 형변환.: UPCAST
		
		((Test)ob).write();
		//write메소드 안에 출력메소드가 있기 때문에, 출력메소드 안에 출력메소드를 넣는 것은 안된다.
		//메소드는 형변환을 해도 자기자신의 메소드를 사용한다. (변수는 형변환 하면 형변환한 메소드의 변수를 사용한다.)
	}

}
