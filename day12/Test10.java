package com.day12;

class SuperTest {
		
	public int a=10, b=20;
	
	public void write() {
		System.out.println("슈퍼클래스 write()...");
	}
	
	public int hap() {
		return a + b;
	}
	
}


class SubTest extends SuperTest {
	
	public int b=100, c=200;
	
	public void print() {
		System.out.println("서브클래스 print()...");
	}
	
	@Override
	public int hap() {
		return a + b + c; //10+100+200=310
	}
	
}

public class Test10 {

	public static void main(String[] args) {

		SubTest ob1 = new SubTest();
	///System.out.println(ob1);
		
		System.out.println("ob1.b: " + ob1.b); //100
		
		SuperTest ob2 = ob1; //upcast: 자식클래스를 부모클래스로
		//SuperTest ob2 = (SuperTest)ob1;
	//System.out.println(ob1);
	//System.out.println(ob2);
		
		System.out.println("ob2.b: " + ob2.b); //20
	
		System.out.println("합: " + ob2.hap()); //310
		//ob2는 부모클래스를 가리키고 있고 hap메소드도 부모의 메소드를 사용하는 것으로 나오지만, 메소드는 클래스 형변환을 해도 원래 클래스의 메소드가 실행되기 때문에 자식클래스의 메소드가 실행된다.
		
		ob2.write();
		//write메소드는 메소드 안에 출력문이 있기 때문에 이렇게 쓴다.
		
		//ob2.print();
		//ob2는 부모라 자식의 메소드를 사용할 수 없다.
		//상속특징 4. 내꺼는 내꺼다.
		
		((SubTest)ob2).print(); //downcast: 부모를 자식으로 형변환
		
	}

}

/*
upcast / downcast

SubTest클래스의 주소값이 ob1에 들어간다. ob1는 SubTest를 가리킨다.
ob1에 있는 값을 ob2에 대입한다. ob1과 ob2는 같은 값(SubTest의 주소값)이 들어있기 때문에 둘 다 자식클래스를 가리킨다.
하지만 ob2는 부모클래스 타입이기 때문에 자식클래스와 연결되어도, 자식클래스를 통해 부모클래스로 들어갈 뿐이다. 그래서 ob2는 부모클래스의 데이터만 사용 가능하다. 반면 ob1은 자식클래스 타입이기 때문에 자식클래스와 부모클래스의 데이터 모두를 사용할 수 있다. 이와 같은 경우를 upcast라고 한다.
부모클래스의 데이터만 사용하던 ob2가 자식클래스의 데이터도 사용하고 싶을 때 일어나는 것이 downcast이다.
따라서 upcast가 일어나지 않으면 downcast가 일어나지 않는다. 일어날 필요가 없다.
부모클래스만 쓰다가 자식클래스를 쓰고 싶을때 일어나는 것이 downcast인데 upcast가 일어나지 않으면 애초에 부모-자식클래스 모두를 사용할 수 있기 때문이다.
*/

