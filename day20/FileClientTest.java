package com.day20;

import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Scanner;

public class FileClientTest {

	public static void main(String[] args) {
		
		int port= 7777;
		String host =  "192.168.16.1";
				
			Socket sc = null;
			ObjectOutputStream oos = null;
		
		Scanner scn = new Scanner(System.in);
		
		String path;
		
		try {
			
			System.out.println("전송할 파일 경로 및 파일명? ");
			path = scn.next();
			
			File f = new File(path);
			
			if(!f.exists()) {
				System.out.println("파일이  없습니다.");
				System.exit(0);
			}
			
			
			//서버 연결
			sc = new Socket(host, port);
			
			oos = new ObjectOutputStream(sc.getOutputStream());
			oos.flush();
			
			
			//파일전송시작
			FileInfo info;
			
			info = new FileInfo();
			info.setCode(100);
			info.setData(f.getName().getBytes());
			info.setSize((int)f.length());
			
			oos.writeObject(info);
			System.out.println(f.getName() + "파일전송시작!!"); //클라이언트에 뜨는건 !! 서버에 뜨는건 ..으로 작성
			
			
			Thread.sleep(30); //병목현상 방지 쉬는시간
			
			
			//파일내용전송
			FileInputStream fis = new FileInputStream(f);
			
			int byteData = 0;
			
			byte[] buffer = new byte[1024];
			
			while((byteData=fis.read(buffer, 0, 1024))!=-1) {
				
				info = new FileInfo();
				
				info.setCode(110);
				info.setSize(byteData);
				info.setData(buffer);
				
				oos.writeObject(info);
				
				System.out.println(byteData + "bytes 전송중!!");
				
				buffer = new byte[1024];
				
				Thread.sleep(300);
			}
			
			fis.close();
			
			
			//파일전송종료
			info = new FileInfo();
			info.setCode(200);
			info.setData(f.getName().getBytes());
			info.setSize((int)f.length());
			
			oos.writeObject(info);
			System.out.println(f.getName() + "파일전송끝!!");
			
			Thread.sleep(300);
			
			oos.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
