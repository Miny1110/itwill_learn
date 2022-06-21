package com.day16;

//내가 만든 클래스에 예외처리하는 기능을 추가하고 싶다. > 예외처리 클래스를 상속받는다.
class MyException extends Exception {

	//없어도 됨. 노란색 밑줄 지우고싶으면 쓰면됨
	//private static final long serialVersionUID = 1L;


	//MyException 오버로딩 생성자
	public MyException(String msg)	{

		//사용자한테 메세지를 받아서 Exception이 가지고있는 오버로딩된 생성자를 찾아가서 메세지를 넣는다.
		super(msg);
	}

}



public class Test3 {

	private int value; //초기값 0

	public void setValue1(int value) throws MyException {

		if(value<0) {
			throw new MyException("수는 0보다 작을 수 없습니다");
		} else {
			this.value = value;
		}

	}



	public void setValue2(int value) throws MyException {

		if(value>10) {
			throw new MyException("수는 10보다 클 수 없습니다");
		} else {
			this.value = value;
		}

	}



	public int getValue() {
		return value;
	}

	public static void main(String[] args) {

		Test3 ob = new Test3();

		try {

			//ob.setValue1(-20);
			ob.setValue2(20);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		System.out.println(ob.getValue());
	}

}
