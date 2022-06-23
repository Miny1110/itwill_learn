package com.day18;

import java.io.FileOutputStream;

//파일로 값을 내보낸다. 

public class Test6 {

	public static void main(String[] args) {

		try {
			
			FileOutputStream fos = new FileOutputStream("c:\\doc\\out.txt");
			
			int data;
			
			System.out.print("문자열 입력");
			
			//한줄씩 읽는다 read는 반환값이 int. 아스키값으로 돌려주는 것이다. 
			while((data=System.in.read())!=-1) {
				fos.write(data);
				fos.flush();
				//엔터를 쳐야 마지막 문장까지 데이터가 저장된다.
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

}
