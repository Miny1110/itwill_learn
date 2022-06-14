package com.day12;

//Singleton
//static
//객체를 여러번 생성해도 메모리 공간은 한개만 생성한다.

class Sing {
	
	private static Sing ob;
	
	public static Sing getInstance() {
		
		if(ob==null) {
			ob = new Sing();
		}
		return ob;
	}
	
}


public class Test5 {

	public static void main(String[] args) {

		Sing ob1 = Sing.getInstance();
		Sing ob2 = Sing.getInstance();
		
		if(ob1==ob2)
			System.out.println("동일 객체...");
	
	}
}

/*
처음에 main메소드로 간다. static 멤버를 메모리상에 올린다. 변수 ob는 null값으로 올라가있다. getInstance 메소드는 메모리상에 올라가있지만 호출해야 실행된다.

main메소드를 순서대로 실행한다. getInstance메소드를 실행한다. ob의 초기값은 null이라 if문의 조건을 성립해서 객체를 생성한다. 그리고 메소드를 호출한 곳에 ob값을 리턴한다.
다음으로 또 getInstance메소드를 실행한다. ob에는 객체주소값이 들어가있다. 따라서 null값이 아니기때문에 if문을 실행하지 않고 빠져나간다. 그리고 메소드를 호출한 곳에 ob값을 리턴한다. 따라서 ob1과 ob2에 들어있는 값(주소값)은 동일하다. 동일 객체를 가리키고 있다.
*/


