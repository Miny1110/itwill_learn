package com.day20;

import java.net.InetAddress;
import java.util.Scanner;

//Network

public class Test3 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		
		String host;
		
		//www : 호스트 네임
		//naver.com : 도메인 네임
		//http:// : 프로토콜 (hyper text transfer protocol)
		System.out.print("호스트[www.naver.com]");
		host = sc.next();
		
		try {
			
			InetAddress ia = InetAddress.getByName(host);
			System.out.println("ip주소: " + ia.getHostAddress());
			System.out.println("호스트: " + ia.getHostName());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
