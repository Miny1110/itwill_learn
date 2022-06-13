package com.day10;

/*
상속(부모가 자식한테 주는 것)
1. 부모꺼는 내꺼다.
2. private로 선언한 것은 상속이 안된다.
3. protected로 선언한 것은 상속이 가능하다.
4. 내꺼는 내꺼다.
5. 부모와 같은 객체(메소드, 변수(인스턴스변수 포함))를 가지고 있다면 내꺼 쓴다.
*/

class SuperC {	//연산 없음
	
	
	//입력
	private String title;
	private int area;
	
	public void set(String title, int area) {
		this.title = title;
		this.area = area;
	}
	
	
	//출력
	public void print() {
		System.out.println(title + ":" + area);
	}
	
}


class Rect extends SuperC {	//Rect 클래스는 원래 출력메소드 없음. 상속을 통해 SuperC 클래스의 출력메소드(set(String title, int area){}) 사용 가능.
	
	
	//기본생성자 생략되어 있음
	//Rect(){}
	
	private int w, h;

	
	//생성자 오버로딩
	public Rect(int w, int h) {
		//부모생성자 호출 생략되어 있음
		//자녀생성자의 첫줄엔 super생성자 호출이 숨겨져있기 때문에 자식생성자는 무조건 부모생성자 호출을 먼저 한다. 따라서 자식이 메모리에 올라가기 전에 부모가 먼저 올라간다. 
		//super();
		
		this.w = w;
		this.h = h;
	}
	
	
	//연산
	public void rectArea() {
		int a = w * h;
		set("사각형1", a);	//1. 부모꺼는 내꺼다.
	}
}


public class Test1 {

	public static void main(String[] args) {

		
		//매개변수 있는 생성자로 오버로딩을 했는데 기본생성자는 생략했기 때문에, 기본생성자 호출은 불가능하다. 오버로딩 생성자로만 객체생성이 가능하다.
		//Rect ob = new Rect(); 불가능
		
		Rect ob = new Rect(10, 20);
		
		ob.rectArea();	//자식객체 메소드 호출
		ob.print();		//(상속관계인) 부모객체 메소드 호출
						//1. 부모꺼는 내꺼다.
		
	}

}
