package com.day13;

import java.util.Scanner;

interface FruitA {

	String Won = "원";
	
	public int getPrice();
	public String getName();

}

//인터페이스가 인터페이스를 상속 (extends 사용)
interface ItemFruit extends FruitA {
	
	public String getItems();
	
}


class Orange implements ItemFruit {
//인터페이스의 메소드만 있다. 자기 자신의 메소드는 없다.
	
	@Override
	public int getPrice() {
		return 1000;
	}

	@Override
	public String getName() {
		return "오렌지";
	}

	@Override
	public String getItems() {
		return "과일";
	}
	
}


class Apple implements ItemFruit {
//인터페이스의 메소드만 있다. 자기 자신의 메소드는 없다.

	@Override
	public int getPrice() {
		return 1500;
	}

	@Override
	public String getName() {
		return "사과";
	}

	@Override
	public String getItems() {
		return "과일";
	}
	
}


public class Test3 {

	public void packing(ItemFruit ob) {
		//
		System.out.println(ob.getItems());
		System.out.println(ob.getName());
		System.out.println(ob.getPrice() + FruitA.Won);
		
	}
	
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		
		Test3 t = new Test3();
		
		System.out.print("1.오렌지? 2.사과?"); //1,2
		int n = sc.nextInt();
		
		/*
		ItemFruit ob;
		ob = new Orange();
		ob = new Apple();
		과정을 ItemFruit ob을 packing 메소드의 매개변수에 넣는 것으로 했다.
		데이터를 계속 유지할 필요가 없고 덧입혀도 되기 때문이다.)
		*/
		
		if(n==1) 
			t.packing (new Orange());
		else if(n==2)
			t.packing(new Apple());
		
		
		/*
		int ob1;
		ob1 = 10;
		System.out.println(ob1); //10
		
		ob1 = 20;
		System.out.println(ob1); //20
		*/
		
	}

}
