package com.day16;

import java.util.Scanner;

/*
5~10자 이내의 문자열을 입력받아서 출력하는 프로그램
조건)
1. 5~10자 이내의 문자열
2. 영문자만 입력
3. 영문자와 숫자 혼용
*/

class MyAuthen {
	
	public void inputFormat(String str) throws Exception {
		
		//1. 5~10자 이내의 문자열
		//문자열의 길이는 5~10자입니다
		if(str.length()<5 || str.length()>10) {
			throw new Exception("문자열의 길이는 5~10자입니다: " + str);
		}
		
		
		//2. 영문자만 입력
		/*
		for(int i=0;i<str.length();i++) {
			char ch = str.charAt(i);
			if(((ch<'A' || ch>'Z') && (ch<'a' || ch>'z'))) {
				throw new Exception("영문자만 가능합니다: " + str);
			}
		}
		*/
	
		//3. 영문자 숫자 혼용
		int eng=0, num=0;
		for(int i=0;i<str.length();i++) {
			
			char ch = str.charAt(i);
			
			if(((ch>='A' && ch<='Z') || (ch>='a' && ch<='z'))) {
				eng++;
			} else if(ch>='0' && ch<='9') {
				num++;
			} 
			
		}
		
		if(eng==0 || num==0) {
			throw new Exception("영문자와 숫자를 혼용하세요: " + str);
		} 
		
	}
	
}


public class Test4 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String str;
		
		MyAuthen auth = new MyAuthen();
		
		try {
			
			System.out.print("문자열? ");
			str = sc.next();
			
			auth.inputFormat(str);
			
			System.out.println(str);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}

}
