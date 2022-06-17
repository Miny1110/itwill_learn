package com.day14;

import java.util.Collections;
import java.util.Iterator;
import java.util.Vector;

public class Test2 {

	private static String city[] = {"서울", "부산", "대구", "인천", "광주", "대전", "울산"};
	
	public static void main(String[] args) {

		
		//Vector안에 들어갈 데이터의 타입을 String으로 제한한다.
		Vector<String> v = new Vector<>();

		
		//데이터 넣지 않은 Vector의 기본 길이
		System.out.println("초기 용량: " + v.capacity() + "개" );
		for(String c : city) {
			v.add(c);
		}
		
		
		//타입을 String으로 제한했기 때문에 다른 타입을 넣으려고 하면 에러 발생
		//v.add(10);
				
		
		String str;
		
		//firstElement: 첫번째 value값을 읽어와라. (인덱스 0번째 값)
		str = v.firstElement(); //인덱스 0번쨰 값
		System.out.println(str);
		
		str = v.get(1); //인덱스 1번째 값
		System.out.println(str);
		
		//lastElement: 마지막 value값을 읽어와라. (마지막 인덱스 값)
		str = v.lastElement(); //(여기에선) 인덱스 6번째 값
		System.out.println(str);
		
		
		
		//데이터 넣은 Vector 길이
		System.out.println(v.size() + "개" );
		
		
		
		//for문
		for(int i=0;i<v.size();i++) {
			System.out.print(v.get(i) + " ");
		}
		System.out.println();
		
		//for each문
		for(String c : v) {
			System.out.print(c + " ");
		}
		System.out.println();
		
//--------------------------------------------------------------------------------------------------	
		
		//Iterator: 반복자 (컬렉션의 자체 for문)
		//copy의 개념. v에 있는 데이터를 복사해서 it로
		Iterator<String> it = v.iterator();
		
		//Iterator에서의 출력은 move의 개념. 대입하면 변수에는 값이 들어가고 it에는 해당 값이 삭제된다. 
		//str = it.next();
		System.out.println(it.next());
		
		
		//위에서 "서울"을 출력했기 때문에 아래 반복문에서는 "부산"부터 출력된다.
		//Iterator에서의 출력은 move 개념이기 때문에, 아래 반복문이 끝나면 모든 값이 출력됐기 때문에 it는 null값이 된다.
		//it.hasNext: it 안에 데이터가 있을 때까지 (it가 데이터를 가지고 있을 때까지)
		//데이터가 몇개 있는지 모르니까 while문 사용
		while(it.hasNext()) { 
			str = it.next(); 
			System.out.print(str + " ");
		}
		System.out.println();
		
		
		//위에서 데이터를 다 출력했기 때문에 여기에서는 it에 남아있는 데이터가 없어서 출력할 값이 없다.
		while(it.hasNext()) {
			str = it.next();
			System.out.print(str + " ");
		}
		
		
		//it에 다시 v의 데이터를 넣어주면 출력이 가능하다.
		it = v.iterator();
		while(it.hasNext()) {
			str = it.next();
			System.out.print(str + " ");
		}
		System.out.println();
		
//--------------------------------------------------------------------------------------------------		
		
		//변경
		v.set(0, "Seoul");
		v.set(1, "Busan");
		
		for(String c : v) {
			System.out.print(c + " ");
		}
		System.out.println();
		
		
		
		//삽입
		//새로운 데이터가 해당 위치에 삽입되고 그 이후 데이터들은 자리가 뒤로 밀린다.
		v.insertElementAt("대한민국", 0);
		System.out.println(v.size() + "개");
		
		for(String c : v) {
			System.out.print(c + " ");
		}
		System.out.println();
		
		
		
		//검색
		int idx = v.indexOf("대구");
		if(idx != -1) {
			System.out.println("검색성공: " + idx);
		} else {
			System.out.println("검색실패: " + idx);
		}
		
		
		
		//오름차순
		//출력할때만 자리바꿈 한 것이 아니라 완전히 순서가 바뀐다.
		Collections.sort(v);
		for(String c : v) {
			System.out.print(c + " ");
		}
		System.out.println();
		
		
		//내림차순
		//Collections.reverseOrder() 방법으로 v를 정렬해라
		//Collections.sort(정렬할 데이터, 정렬할 방법); (정렬방법의 디폴트값은 오름차순)
		Collections.sort(v, Collections.reverseOrder());
		for(String c : v) {
			System.out.print(c + " ");
		}
		System.out.println();
		
		
		
		//삭제
		v.remove("Busan"); //remove(7)도 가능. Busan의 인덱스값이 7이라서
		for(String c : v) {
			System.out.print(c + " ");
		}
		System.out.println();
		
		
		
		System.out.println("공간 개수: " + v.capacity() + "개");
		System.out.println("데이터 개수: " + v.size() + "개");
		
		
		
		//공간 증가
		for(int i=1;i<=20;i++) {
			//에러 발생. v에는 String 값만 들어갈 수 있기 때문이다.
			//v.add(i);
			v.add(Integer.toString(i));
		}
		for(String c : v) {
			System.out.print(c + " ");
		}
		System.out.println();
		System.out.println("공간 개수: " + v.capacity() + "개"); //40 > 데이터 개수보다 넉넉하게 늘림
		System.out.println("데이터 개수: " + v.size() + "개");
		
		
		
		//범위 삭제
		for(int i=1;i<=10;i++) {
			v.remove(5);
		}
		for(String c : v) {
			System.out.print(c + " ");
		}
		System.out.println();
		System.out.println("공간 개수: " + v.capacity() + "개");
		System.out.println("데이터 개수: " + v.size() + "개");
		//데이터가 늘어나면 공간도 자동으로 늘어나지만, 데이터를 삭제한다고 해서 자동으로 공간도 줄어드는 것은 아니다. 수동으로 지워주어야 한다.
		
		
		
		//빈 공간 삭제
		v.trimToSize();
		System.out.println("공간 개수: " + v.capacity() + "개");
		System.out.println("데이터 개수: " + v.size() + "개");
		
		
		//모든 데이터 삭제
		v.clear();
		System.out.println("공간 개수: " + v.capacity() + "개");
		System.out.println("데이터 개수: " + v.size() + "개");
		
		
	}

}
