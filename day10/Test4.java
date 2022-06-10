package com.day10;

class Super {
	
	private String title;
	protected double area;
	
	//기본생성자
	public Super() {}				//Recta가 찾아옴
	
	//오버로딩 생성자
	public Super(String title) {	//Circle이 찾아옴
		this.title = title;
	}
	
	public void write() {
		System.out.println(title + ":" + area);
	}
}


class Circle extends Super {
	
	private int r;
	protected static final double PI = 3.14;
	
	//오버로딩 생성자로 초기화
	public Circle(int r) {
		super("원");
		this.r = r;
	}
	
	public void circleArea() {
		area = r * r * PI;
	}
}


class Recta extends Super {
	
	private int w, h;
	
/*
 	//생략되어 있음
 	//Recta 클래스의 기본생성자 생략 + 생성자 내의 첫 문장인 부모의 기본생성자 호출 생략
 	public Recta() {
		super();
	}
*/	
	
	//메소드로 초기화
	public void rectArea(int w, int h) {
		this.w = w;
		this.h = h;
		
		area = w * h;
	}

	//Override(Overriding) 오버라이드(오버라이딩)
	//상위클래스(부모클래스)에 정의되어 있는 메소드를 재정의 한다.(다형성)
	//어노테이션(annotation)
	@Override
	public void write() {
		System.out.println("가로: " + w);
		System.out.println("세로: " + h);
		System.out.println("넓이: " + area);
	}
}


public class Test4 {

	public static void main(String[] args) {

		Circle c = new Circle(10);
		c.circleArea();
		c.write();
		
		Recta r = new Recta();
		r.rectArea(10, 20);
		r.write();	//5. 부모와 같은 객체를 가지고 있다면 내꺼 쓴다.
	}
}
