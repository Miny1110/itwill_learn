package com.day15;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class Test1 {

	public static void main(String[] args) {

		ArrayList<String> lists = new ArrayList<>();
		
		lists.add("서울");
		lists.add("부산");
		lists.add("대구");
		
		
		Iterator<String> it = lists.iterator();
		while(it.hasNext()) {
			String str = it.next();
			System.out.print(str + " ");
		}
		System.out.println();
		
		
		//ListIterator
		//이터레이터와 사용방법은 똑같다.
		ListIterator<String> it1 = lists.listIterator();
		while(it1.hasNext()) {
			System.out.print(it1.next() + " ");
		}

		System.out.println();
		
		//역순으로 출력
		while(it1.hasPrevious()) {
			System.out.print(it1.previous() + " ");
		}
		System.out.println();
		
		
		List<String> lists1 = new ArrayList<>();
		
		//한 칸에 모든 데이터가 들어가는 것이 아니라 lists의 모든 데이터가 lists1의 각 칸에 하나씩 들어가는 개념
		lists1.addAll(lists);
		lists1.add("인천");
		
		int n = lists1.indexOf("부산");
		lists1.add(n+1, "광주");
		
		for(String s : lists1) {
			System.out.print(s + " ");
		}
		System.out.println();
		
		
		String str;
		Iterator<String> it2 = lists1.iterator();
		
		while(it2.hasNext()) {
			str = it2.next();
			if(str.startsWith("부")) {
				System.out.println(str);
			}
		}
	}
}
