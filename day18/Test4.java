package com.day18;

import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;

public class Test4 {

	public static void main(String[] args) throws Exception {
		
		int data;
		
		System.out.print("문자열 입력? ");
		
		Reader rd = new InputStreamReader(System.in);
		Writer wr = new OutputStreamWriter(System.out);
		
		while((data=rd.read())!=-1) { //입력값을 읽어서
			wr.write(data); //내보낸다
			wr.flush(); //flush를 사용해야 콘솔창에서 입력값이 보인다.
		}
	}
}
