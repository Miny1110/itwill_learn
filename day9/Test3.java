package com.day9;

class RectA{
	
	private int w, h;
	
	//기본생성자
	public RectA() {}
	
	
	//생성자 오버로딩
	public RectA(int w, int h) {
		this.w = w;
		this.h = h;
		//생성자로 초기화할 수 있게 됨
	}
	
	
	//초기화 메소드
	public void set(int w, int h) {
		this.w = w;
		this.h = h;
	}
	
	
	public int area() {
		return w*h;
	}
	
	
	public int length() {
		return (w+h)*2;
	}
	
	
	public void print(int a) {
		System.out.println("가로: " + w + ", 세로: " + h);
		System.out.println("넓이: " + a);
	}
	
	
	//메소드 오버로딩
	public void print(int a, int l) {
		System.out.println("가로: " + w + ", 세로: " + h);
		System.out.println("넓이: " + a);
		System.out.println("둘레: " + l);
		
	}
	
}



public class Test3 {

	public static void main(String[] args) {

		RectA ob1 = new RectA();
		ob1.set(10, 20);
		int a = ob1.area();
		int l = ob1.length();
		ob1.print(a);
		ob1.print(a, l);
		
		System.out.println("-------------------");
		
		//오버로딩된 생성자를 통해 객체생성+변수초기화 동시에
		RectA ob2 = new RectA(100, 200); //58+59행과 동일
		a = ob2.area();
		l = ob2.length();
		ob2.print(a);
		ob2.print(a, l);
		
		
	}

}
