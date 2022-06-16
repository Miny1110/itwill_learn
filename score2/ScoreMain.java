package com.score2;

public class ScoreMain {

	public static void main(String[] args) {

		Score ob = new ScoreImpl();
		
		ob.set();
		ob.input();
		ob.print();
		//ob.panjung(int score);
		//사용불가. 인터페이스타입에 클래스객체를 연결했으면 인터페이스에 있는 메소드만 사용해야 하기 때문이다. 그런데 pangjung 메소드는 인터페이스에 없는, 클래스 자기자신이 선언한 메소드이기 때문에 호출할 수 없다.
		
	}

}
