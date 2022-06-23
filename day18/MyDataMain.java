package com.day18;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class MyDataMain {

	public static void main(String[] args) throws Exception {

		FileOutputStream fos = new FileOutputStream("c:\\doc\\out6.txt");
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		
		/*
		MyData ob1 = new MyData("배수지", 30);
		oos.writeObject(ob1);
		위 두 코드를 하나로 줄인게 아래 코드
		*/
		
		oos.writeObject(new MyData("배수지", 30));
		oos.writeObject(new MyData("유인나", 40));
		oos.writeObject(new MyData("정인선", 30));
		oos.writeObject(new MyData("정인아", 32));
		
		oos.close();
		fos.close();
		
		
		//역직렬화
		FileInputStream fis = new FileInputStream("c:\\doc\\out6.txt");
		ObjectInputStream ois = new ObjectInputStream(fis);
		
		MyData ob = null;
		
		try {

			while(true) {
				
				ob = (MyData)ois.readObject(); //MyData로 downcast 해서 ob에 집어넣는다.
				
				System.out.println(ob.toString());
			}
			
		}catch (Exception e) {

		}
		
		ois.close();
		fis.close();
		
	}
}
