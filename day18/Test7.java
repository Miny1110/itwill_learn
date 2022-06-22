package com.day18;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Scanner;

public class Test7 {

	public static void main(String[] args) {

		//파일 복사 프로그램

		//원본파일? c:\\doc\\test.txt
		//대상파일? c:\\doc\\out1.txt
		//복사완료

		Scanner sc = new Scanner(System.in);
		
		String str1, str2;
		int data;
		
		try {
			System.out.print("원본파일? ");
			str1 = sc.next();
			
			System.out.print("대상파일? ");
			str2 = sc.next();
			
			FileInputStream fis = new FileInputStream(str1);
			FileOutputStream fos = new FileOutputStream(str2);
			
			while((data=fis.read())!=-1) {
				fos.write(data);
				fos.flush();
			}
			
			fis.close();
			fos.close();

			System.out.println("복사완료");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
