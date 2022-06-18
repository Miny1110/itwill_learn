package com.day15;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Set;
import java.util.Stack;

public class Test3 {
	
	public static void main(String[] args) {
	
		//Set: 중복값 허용 안함
		
		Set<String> s = new HashSet<>();
		
		s.add("서울");
		s.add("부산");
		s.add("대구");
		
		System.out.println(s);
		
		Iterator<String> it = s.iterator();
		while(it.hasNext()) {
			String str = it.next();
			System.out.println(str);
		}
		
		s.add("서울"); //위에서 넣은 데이터와 중복이기때문에 추가되지 않는다.
		System.out.println(s); //서울을 두번 넣었지만 중복값이기 때문에 한번만 출력된다.
		
//---------------------------------------------------------------------------------------------
		
		//Stack
		//데이터를 입력한 순서 반대로 출력된다.
		//제일 먼저 넣은게 맨 아래에 깔려있고 제일 늦게 넣은게 맨 위에 있어서, 제일 늦게 넣은 것을 맨 처음으로 꺼내게 되는 논리
		Stack<String> st = new Stack<>();
		
		st.push("서울");
		st.push("부산");
		st.add("광주");
		
		while(!st.empty()) {
			System.out.print(st.pop() + " ");
		}
		System.out.println();
		
//---------------------------------------------------------------------------------------------

		//Queue
		
		Queue<String> q = new LinkedList<>();
		
		q.offer("부산");
		q.offer("대구");
		q.add("울산");
		
		while(q.peek()!=null) {
			System.out.print(q.poll() + " ");
		}
		System.out.println();
		
		
		List<String> list1 = new LinkedList<>();
		list1.add("a");
		list1.add("b");
		list1.add("c");
		list1.add("d");
		list1.add("e");
		list1.add("f");
		list1.add("g");
		list1.add("h");
		list1.add("i");
		
		List<String> list2 = new LinkedList<>();
		list2.add("서울");
		list2.add("부산");
		list2.add("대구");
		
		list2.addAll(list1);
		
		System.out.println("list1...");
		for(String ss : list1) {
			System.out.print(ss + " ");
		}
		System.out.println("\n----------");
		
		System.out.println("list2...");
		for(String ss : list2) {
			System.out.print(ss + " ");
		}
		System.out.println("\n----------\n");
		
		//list에서 특정 범위값 지우기
		list2.subList(2, 5).clear(); 
		for(String ss : list2) {
			System.out.print(ss + " ");
		}
		System.out.println("\n----------\n");

//---------------------------------------------------------------------------------------------

		//배열
		
		String[] str = {"나", "마" ,"라" ,"가" ,"바", "다"};
		
		for(String sss : str) {
			System.out.print(sss + " ");
		}
		System.out.println();
		
		//배열 데이터를 자동으로 정렬
		Arrays.sort(str);
		for(String sss : str) {
			System.out.print(sss + " ");
		}
	}
}
