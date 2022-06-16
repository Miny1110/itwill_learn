package com.day13;

//3. 내부클래스(중첩)

class Outer3 {
	
	static int a = 10;
	int b = 20;
	
	//static이라 메모리상에 먼저 올라간다. 그래서 Inner클래스에서 Outer3 클래스의 객체를 생성할 수 있다.
	public static class Inner3 {
		
		int c = 30;
		
		public void write() {
			
			System.out.println(a);
			//System.out.println(b);
			System.out.println(c);
			
			Outer3 ob = new Outer3();
			System.out.println(ob.b);
		}
		
		
	}
}


public class Test6 {

	public static void main(String[] args) {

		Outer3 out = new Outer3();
		
		Outer3.Inner3 inner = new Outer3.Inner3();
		inner.write();
		
		
	}

}

/*
순서????????????????????????????????????????????????

1. static멤버가 먼저 메모리상에 올라간다. static멤버는 객체생성 없이 사용 가능하기 때문이다. 변수 a, Inner3 클래스가 올라간다. 

, 변수 c가 올라가고 write 메소드가 올라감과 동시에 실행이 된다. (Outer3의 객체는 생성되지 않은 상태에서 write메소드에서 변수 b를 출력하려고 하니까 에러가 발생한다.)
2. write메소드에서 바깥클래스인 Outer3의 객체생성을 한 후 해당 클래스의 변수b를 출력할 수 있다.
*/



