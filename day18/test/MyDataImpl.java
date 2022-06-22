package com.day18.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class MyDataImpl implements MyData{

	Scanner sc = new Scanner(System.in);
	private List<MyDataVO> lists;
	String str = "c:\\doc\\mydata.txt";
	
	
	public MyDataImpl() throws Exception {
		File f = new File(str);
		try {
			if(!f.exists()) {
				lists = new ArrayList<>();
			} else {
				FileInputStream fis = new FileInputStream(str);
				ObjectInputStream ois = new ObjectInputStream(fis);
				lists = (List<MyDataVO>)ois.readObject();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	
	@Override
	public void input() throws Exception {
		
		MyDataVO vo = new MyDataVO();
		
		System.out.print("이름? ");
		vo.setName(sc.next());
		
		System.out.print("생일? ");
		vo.setBirth(sc.next());
		
		System.out.print("점수? ");
		vo.setScore(sc.nextInt());
		
		lists.add(vo);
		
	}

	
	@Override
	public void print() throws Exception {
		
		Iterator<MyDataVO> it = lists.iterator();
		while(it.hasNext()) {
			MyDataVO vo = it.next();
			System.out.println(vo.toString());
		}
	}

	
	@Override
	public void save() throws Exception {
		
		FileOutputStream fos = new FileOutputStream("c:\\doc\\mydata.txt");
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		
		oos.writeObject(lists);
		oos.close();
		fos.close();
		
	}
	
}
