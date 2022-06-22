package com.day18;

/*
Stream
데이터 입출력시 모든 데이터의 형태와는 관계없이, 일련된 흐름(단방향)으로 데이터를 전송하는 클래스이다.
어떠한 데이터라도 한번 보낼 때 1byte씩만 전송할 수 있다.
스트림은 단방향이기 때문에 항상 쌍으로 이루어진다.

많이 쓰는 스트림
in: 기본 입력 스트림(바이트 스트림) 보통 in.read로 많이 사용한다.
out: 출력 용도의 기본 스트림 보통 out.print로 많이 사용한다.
*/

public class Test1 {

	public static void main(String[] args) throws Exception {
		
		int data;
		
		System.out.print("문자열? ");
		
		//System.in.read(): 기본적으로 정수를 반환한다. 그래서 int타입의 data에 값을 넣어준다. 1byte씩 문자를 읽어올 때 필요하다.
		while((data=System.in.read())!=-1) {
			char ch = (char)data;
			System.out.print(ch);
			
		}
	}
}


/*(내가 이해한 방식은)컴퓨터는 이진수니까 어쨌거나 데이터가 있으면 0 또는 1을 받는다. -1이라는 것은 데이터가 없다는 뜻이다. 그래서 -1이 아니면, 즉 데이터가 있으면 그걸 읽어와서 data에 넣는다. data에 들어간 값은 0 또는 1이라는 정수값이므로 그걸 다시 문자로 바꾸는 작업이 필요하다. 그 과정이 char로의 형변환. 1byte씩밖에 문자를 읽어올 수 없으니, 이 과정을 반복해서 전체 문자열을 출력한다.
 */