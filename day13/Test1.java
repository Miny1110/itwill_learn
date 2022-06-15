package com.day13;

/*
Interface

1. 추상클래스의 일종으로 선언만 있고 정의가 없다.
2. 인터페이스 안에는 final 변수만 정의할 수 있다.
3. 인터페이스를 구현하려면 implements를 사용한다.
4. 하나 이상의 인터페이스를 implements한 클래스는 인터페이스의 모든 메소드를 재정의 해야한다.
5. 인터페이스가 다른 인터페이스를 상속받을 수 있으며, 이때는 extends를 사용한다.
6. 클래스와는 다르게 인터페이스는 다중상속이 가능하다.
*/

interface Fruit {
	
	String Won = "원";
	//public, static, final 생략되어 있다. (변수만 final 생략되어 있다.) 변수는 항상 public static final이다. static 변수라 객체생성 없이 [클래스이름.변수명]으로 사용 가능하다.
	
	int getPrice(); //public abstract 생략되어 있다.
	public String getName(); //abstract 생략되어 있다. 
	//구현부가 없어서 static 쓸 수 없다. 메모리상에 올릴 작업이 없다.
	
}


class FruitImpl implements Fruit {
	
	@Override
	public String getName() {
		return "사과";
	}
	
	@Override
	public int getPrice() {
		return 1000;
	}
	
	
	public String getItems() {
		return "과일";
	}
	
}


public class Test1 {

	public static void main(String[] args) {

		FruitImpl ob1 = new FruitImpl();
		
		System.out.println(ob1.getItems());
		System.out.println(ob1.getName());
		System.out.println(ob1.getPrice() + Fruit.Won);
		
		Fruit ob2 = ob1; //upcast
		
		//자식의 getName 메소드 실행된다. 클래스 형변환을 해도 원래 클래스 자기 자신의 메소드를 실행한다. ob2는 부모가 되었지만 getName은 부모, 자식 둘 다 가지고 있기 때문에 자식값을 출력
		System.out.println(ob2.getName());
		
		//부모는 자식 것을 쓸 수 없다. 에러 발생
		//System.out.println(ob2.getItems());
		
	}

}
