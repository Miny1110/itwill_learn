package com.day15;

class Box2<T> {
	
	private T t;
	
	public void set(T t) {
		this.t = t;
	}
	
	public T get() {
		return t;
	}
	
	public <U> void print(U u) { //메소드에도 자료형을 만들 수 있다.
		
		System.out.println(u);
		System.out.println("t 클래스: " + t.getClass().getName());
		System.out.println("u 클래스: " + u.getClass().getName());
	}
}


public class Test5 {

	public static void main(String[] args) {

		Box2<Integer> b= new Box2<Integer>(); //T의 자료형은 Interger가 된다.
		
		b.set(30);
		b.print("test"); //U의 자료형은 String이 된다.
		b.print(50); //U의 자료형은 int가 된다.
		b.print('a'); //U의 자료형은 char가 된다.
		
		
	}

}
