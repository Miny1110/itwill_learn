package com.day9;

//Call By Value
//stack영역의 value가 heap영역으로 넘어감

//Call by Reference
//heap영역의 주소가 stack영역으로 넘어감

class Test{
	
	public int x = 10;
	
	public void sub(int a) {
		x += a; //x=x+a;
	}
}




public class Test6 {

	public static void main(String[] args) {

		Test ob = new Test();
		
		//Call By Value
		int a = 20;
		
		System.out.println("sub()메소드 실행전 x: " + ob.x); //10
		ob.sub(a);
		System.out.println("sub()메소드 실행후 x: " + ob.x); //30
		
		
		//Call by Reference
		Test ob1; //null
		
		//new 객체생성이 아니라 ob의 객체 주소값을 ob1에 대입한다.
		//결과적으로 ob와 ob1은 같은 객체를 가리킨다.
		//ob와 ob1의 자료형은 동일해야 한다.
		ob1 = ob;
		
		System.out.println("ob.x: " + ob.x); //30
		System.out.println("ob1.x: " + ob1.x); //30
		
		ob1.x = 100;
		System.out.println("ob.x: " + ob.x); //100
		System.out.println("ob1.x: " + ob1.x); //100
		
		
	}

}
