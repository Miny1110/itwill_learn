package com.day15;

class Box<T> { 
	
	private T t;
	
	public void set(T t) {
		this.t = t;
	}
	
	public T get() {
		return t;
	}
}


public class Test4 {

	public static void main(String[] args) {

		Box b1 = new Box();
		
		b1.set(30); //Object에 Integer가 들어감. upcast
		Integer i = (Integer)b1.get(); //get으로 가져오면 object 타입이기 때문에 int타입인 i에 넣기 위해서 downcast
		System.out.println(i);
		
		Box<Integer> b2 = new Box<>();
		b2.set(20);
		i = b2.get();
		System.out.println(i);
		
		Box<String> b3 = new Box<String>();
		b3.set("서울");
		String s = b3.get();
		System.out.println(s);
		
	}
}
