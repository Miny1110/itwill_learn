package com.day13;

interface Test {
	
	public int total();
	public void write();
	
}


//인터페이스를 구현하기 위한 클래스
class TestImpl implements Test {

	private String hak, name;
	private int kor, eng;
	
	
	/*기본생성자+메소드로 private 변수 초기화하는 방법
	public TestImpl() {}
	
	public void set(String hak, String name, int kor, int eng) {
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
	}
	*/
	
	
	//오버로딩 생성자를 통해 변수 초기화
	public TestImpl(String hak, String name, int kor, int eng) {
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
	}
	
	
	@Override
	public int total() {
		return kor + eng;
	}

	@Override
	public void write() {
		System.out.println(hak + ":" + name + ":" + total());
	}
	
	
	//Object의 equals를 오버라이드
	@Override
	public boolean equals(Object ob) { //upcast
		
		boolean flag = false;
		
		//ob의 데이터타입이 TestImpl이면 true
		//instanceof: 원래의 데이터타입을 물어본다.
		if(ob instanceof TestImpl) {
			
			TestImpl t = (TestImpl)ob; //downcast
			
			if(this.hak.equals(t.hak) && name.equals(t.name)) {
				flag = true;
			}
		}
	
		return flag;
	}
	
	
}


public class Test2 {

	public static void main(String[] args) {
		
		//오버로딩 생성자로 초기화
		Test ob1 = new TestImpl("1111", "배수지", 80, 90);
		Test ob2 = new TestImpl("1111", "배수지", 100, 100);
		
		
//원래는 Object의 equals라서 주소값을 비교하는데, TestImpl 클래스에서 equals메소드를 오버라이드 했기 때문에 ob1과 ob2는 같다.
//equals는 Object의 equals로 뜨지만, 실제로는 임플리먼트 클래스에서 오버라이드한 메소드가 사용된다. ob1이 부모타입이니까 보여지는건 부모의 메소드가 맞는데, 메소드는 자기 본연의 메소드를 사용하기 때문이다.
		if(ob1.equals(ob2))
			System.out.println("ob1과 ob2는 동일 인물..");
		else
			System.out.println("ob1과 ob2는 안동일 인물..");

		ob1.write();
		ob2.write();
	}

}

/*

public boolean equals(Object ob)
if(ob1.equals(ob2))
TestImpl 타입의 ob2가 Object ob 자리에 매개변수로 들어간다. upcast가 일어났다.
(객체가 변수의 원래 데이터 타입이 된다. 객체가 알맹이. 변수타입은 껍데기. 원래 데이터타입이 뭔지 물으면 new를 통해 생성된 객체가 원래 데이터타입이다.)

TestImpl t = (TestImpl)ob;
위에서 ob는 Object 타입이 됐다. 근데 TestImpl로 다시 형변환. downcast가 일어났다.

if(this.hak.equals(t.hak) && name.equals(t.name))
여기에서 equals는 String의 equals
hak과 name이 String 타입이니까.
그래서 주소값이 아니라 데이터값을 비교한다.

Test ob1 = new TestImpl("1111", "배수지", 80, 90);
인터페이스에 있는 메소드만 사용한다면(임플리먼트 된 클래스에만 있는 메소드를 사용하지 않는다면) 객체의 타입과 그 객체주소를 담는 변수의 타입이 달라도 에러가 발생하지 않는다.

*/



