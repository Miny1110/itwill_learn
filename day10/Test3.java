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
			
		//super()로 쓰면 에러발생. 왜냐하면 부모클래스에 기본생성자가 없기 때문이다. 오버로딩 생성자는 있는데 기본생성자는 없으면 개발자의 의도가 반영된 것으로 판단하기 때문에, 이러한 경우에는 부모의 기본생성자를 호출할 수 없다.
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
