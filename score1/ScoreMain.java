package com.score1;

public class ScoreMain {

	public static void main(String[] args) {

		Score ob = new Score();
		
		ob.set();
		ob.input();
		
		//private는 외부에서 사용할 수 없다.
		//ob.ranking;
		//ob.inwon = 4;
		
		ob.print();
		
	}
	
}
