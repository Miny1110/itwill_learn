package com.day10;

class SuperD {
	
	private String title;
	protected int area;
	
	//public SuperD() {}
	public SuperD(String title) {
		this.title = title;
	}
	
	public void print() {
		System.out.println(title + ":" + area);
	}
	
}

class RectD extends SuperD {
	
	//public RectD() {
		/*
		this() 는 작성 불가.
		왜냐하면 기본생성자(RectD())에서 기본생성자(RectD())를 호출하는 것이기 때문에
		
		부모의 기본생성자 호출
		부모클래스에 기본생성자가 없다면 에러 발생
		super("a");
		*/
	//}
		
	private int w, h;
		
	public RectD(int w, int h) {
			
		//super() 생략되어 있음
		super("사각형");
			
		this.w = w;
		this.h = h;
	}
		
	public void rectArea() {
			area = w * h;
	}
	
}


public class Test3 {

	public static void main(String[] args) {

		RectD ob = new RectD(10, 20);
		
		ob.rectArea();
		ob.print();
		
	}
}
