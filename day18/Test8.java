package com.day18;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Scanner;

public class Test8 {

	//파일을 복사하는 메소드(복사성공:true / 복사실패:false)
	public boolean fileCopy(String str1, String str2) {

		File f = new File(str1);
		
		//파일이 존재하지 않으면 false. 존재하면 아래 try-catch문 실행
		if(!f.exists()) {
			return false;
		}
		
		try {

			//FileInputStream fis = new FileInputStream(f);
			//FileOutputStream fos = new FileOutputStream(f);
			//위아래 같은 코드. 왜냐하면 f가 주소도 가지고 있기 때문에
			FileInputStream fis = new FileInputStream(str1);
			FileOutputStream fos = new FileOutputStream(str2);

			int data;
			byte[] buffer = new byte[1024];

			//0~1024자만큼 읽어내서 내보내라
			while((data=fis.read(buffer, 0, 1024))!=-1) {
				fos.write(buffer, 0, data);
			}

			fos.close();
			fis.close();

		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}


	public static void main(String[] args) {

		//Test8 안에 있는 메소드를 사용해야 하기때문에 객체생성
		Test8 ob = new Test8();

		Scanner sc = new Scanner(System.in);

		String str1, str2;

		System.out.print("원본파일? ");
		str1 = sc.next();
		
		System.out.print("대상파일? ");
		str2 = sc.next();
		
		if(ob.fileCopy(str1, str2)) {
			System.out.println("파일복사 성공");
		} else {
			System.out.println("파일복사 실패");
		}

	}

}
