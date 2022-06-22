package com.day18;

import java.io.IOException;
import java.io.OutputStream;

//out: 출력 용도의 기본 스트림

public class Test2 {

	public static void main(String[] args) throws IOException{
		
		//콘솔창에 출력할 수 있게 하는 것
		/*
		데이터를 내보낼 때 1byte씩만 내보낼 수 있다. 근데 나는 1byte 데이터가 들어있는 배열을 내보내고 싶다.
		그래서 System.out을 OutputStream으로 감싸준다. OutputStream의 기능도 사용하기 위해서.
		OutputStream을 통해 배열도 출력할 수 있다.
		 */
		OutputStream os = System.out;
		
		//길이가 3인 배열 생성
		byte[] b = new byte[3]; //buffer: 데이터를 저장하기 위한 공간을 의미한다.
		
		b[0] = 65;
		b[1] = 97;
		b[2] = 122;
		
		os.write(b);
		/*
		close를 안하면 데이터를 내보내고 나서 데이터가 나간 자리에 쓰레기값이 남는다.
		그래서 다음에 데이터를 내보낼 때 쓰레기값에 막혀서 안나간다.
		close하면 OutputStream도 닫히고 그것이 감싸고 있던 System.out도 닫힌다.
		그래서 닫고나면 이후 코딩을 콘솔창으로 내보낼 수 없다. ("나 보이냐?" 출력 안됨)
		*/
		os.close();
		
		System.out.println("나 보이냐?");
		
	}
}
