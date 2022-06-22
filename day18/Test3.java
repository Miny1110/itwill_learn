package com.day18;

import java.io.InputStreamReader;
import java.io.Reader;

/*
InputStreamReader
System.in이 읽은 1byte 스트림을 2byte의 스트림으로 변환
(System.in: 키보드로 입력한 1byte의 문자를 읽을 때 쓰는 것. 파일,외부컴퓨터에서 보내는 값, 키보드에서 입력하는 값을 모두 담아낼 수 있다.)
변환만 해준다. InputStreamReader가 데이터를 가지고 있을 수 없다.
일종의 다리 역할을 하기 때문에 Bridge Stream라고도 한다.
*/

public class Test3 {

	public static void main(String[] args) throws Exception{
		
		int data;
		System.out.print("문자열 입력? ");
		
		Reader rd = new InputStreamReader(System.in);
		
		//while문 구조 기억하기
		while((data=rd.read())!=-1) {
			char ch = (char)data;
			System.out.print(ch);
		}
	}
}
