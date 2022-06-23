package com.day18;

import java.io.FileInputStream;

/*
파일 입출력
FileInputStream
FileOutputStream

파일을 읽어낼 때, 내보낼 때 스트림을 이용한다.
*/

//파일의 값을 불러와 읽어낸다.
public class Test5 {

	public static void main(String[] args) {
		
		try {

			FileInputStream fis = new FileInputStream("C:\\doc\\test.txt");
			
			int data;
			while((data=fis.read())!=-1) {
				
				//System.out.print((char)data); 
				System.out.write(data);
				System.out.flush();
				//flush 안쓰면 엔터가 없는 마지막 줄은 출력되지 않는다.
				//마지막에 엔터가 없는 줄까지 출력하게 하기 위해서는 flush를 작성해야 한다.
			} 
			
			fis.close();
		
		} catch (Exception e) {

		}
	}
}
