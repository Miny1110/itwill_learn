package com.day15;

import java.util.Hashtable;
import java.util.Iterator;

/*
Map<key,value>

Map이라는 인터페이스를 구현한 클래스에는 다음과 같은 것이 있다.
Hashtable(클래스) - 동기화를 지원한다 (Vector처럼)
HashMap(클래스) - 동기화를 지원하지 않는다. (ArrayList처럼)


Map의 특징
1. key는 중복값을 가질 수 없다.
(Map의 key는 자료형이 Set이라는 컬렉션(인터페이스)이다. 이 Set이 중복값을 허용하지 않는다. 그래서 key자리가 중복값을 허용하지 않는다.)
2. key가 중복값을 가지게 되면 값이 수정된다.(마지막 값이 남는다.)
3. Map은 iterator가 없다. 하지만 쓸 수는 있다. key의 자료형이 Set이라는 컬렉션인데 Set이 이터레이터를 가지고 있기 때문이다. Map의 이터레이터가 아닌, Set의 이터레이터를 사용하는 것이다.
4. 데이터를 넣을 때에는 put, 꺼낼 때에는 get을 사용한다. (put: 추가, get: 가져오기)
*/


public class Test2 {

	public static final String tel[] = {"111-111", "222-222", "333-333", "111-111", "444-444"}; //key
	
	public static final String name[] = {"배수지", "유인나", "정인선", "강아랑", "박신혜"}; //value
	
	public static void main(String[] args) {

		
		Hashtable<String, String> h = new Hashtable<>();
		
		for(int i=0;i<name.length;i++) {
			h.put(tel[i], name[i]);
		}
		
		//Map이 가지고 있는 가장 최적의 방법(빠른 방법)으로 출력한다. 입력순으로 출력되지 않는다.
		System.out.println(h);
		
		String str;
		str = h.get("111-111"); //key를 매개변수로 입력하면 해당 key에 맞는 value를 찾아온다.
		if(str==null) {
			System.out.println("자료없음");
		} else {
			System.out.println(str);
		}
		
		
		//key값 비교
		if(h.containsKey("222-222")) {
			System.out.println("222-222 있다");
		} else {
			System.out.println("222-222 없다");
		}
		
		
		//value값 비교(value에는 일반적으로 클래스를 넣기 때문에, 클래스에는 여러 데이터가 들어있어서 contatinsValue는 활용도가 높지는 않다.)
		if(h.containsValue("강아랑")) {
			System.out.println("강아랑 있다");
		} else {
			System.out.println("강아랑 없다");
		}
		
		
		//Map은 iterator가 없어서 keySet의 iterator를 쓴다.
		Iterator<String> it = h.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next(); //key
			String value = h.get(key); //value를 꺼내온다.
			
			System.out.println(key + " " + value);
			
		}
		
	}

}
