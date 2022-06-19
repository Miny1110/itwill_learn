package com.day15.test;

import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class HealthImpl implements Health {

	private Map<String, HealthVO> hMap = new TreeMap<>();
	
	Scanner sc = new Scanner(System.in);
	String ID;

	@Override
	public void input() {

		System.out.print("아이디? ");
		ID = sc.next();

		if(searchID(ID)) {
			System.out.println("아이디가 존재합니다.등록실패!!");
			return;
		}

		HealthVO vo = new HealthVO();

		System.out.print("이름? ");
		vo.setName(sc.next());

		System.out.print("나이? ");
		vo.setAge(sc.nextInt());

		System.out.print("키? ");
		vo.setHeight(sc.nextInt());

		System.out.print("몸무게? ");
		vo.setWeight(sc.nextInt());

		hMap.put(ID, vo);

		System.out.println("등록성공!!");
	}


	@Override
	public boolean searchID(String ID) {
		return hMap.containsKey(ID);
	}


	@Override
	public void print() {

		Iterator<String> it = hMap.keySet().iterator();

		while(it.hasNext()) {
			String ID = it.next();
			HealthVO vo = hMap.get(ID);

			System.out.println(ID + ": " + vo.toString());
		}
	}


	@Override
	public void delete() {

		System.out.println("삭제할 아이디? ");
		ID = sc.next();
		
		if(searchID(ID)) {
			hMap.remove(ID);
			System.out.println("삭제성공!!");
		} else {
			System.out.println("아이디가 존재하지 않습니다.삭제실패!!");
		}

	}


	@Override
	public void update() {

		System.out.print("수정할 아이디? ");
		ID = sc.next();

		if(!searchID(ID)) {
			System.out.println("아이디가 존재하지 않습니다.수정실패!!");
			return;
		}
		
		HealthVO vo = hMap.get(ID);

		System.out.print("나이? ");
		vo.setAge(sc.nextInt());

		System.out.print("키? ");
		vo.setHeight(sc.nextInt());

		System.out.print("몸무게? ");
		vo.setWeight(sc.nextInt());

		System.out.println(ID + ": " + vo.toString());
		System.out.println("수정완료!!");
	}


	@Override
	public void fidnID() {

		System.out.print("검색할 아이디? ");
		ID = sc.next();
		if(!searchID(ID)) {
			System.out.println("아이디가 존재하지 않습니다.검색실패!!");
			return;
		}
		HealthVO vo = hMap.get(ID);
		System.out.println(ID + ": " + vo.toString());
	}


	@Override
	public void findName() {

		System.out.print("검색할 이름? ");
		String name = sc.next();
		boolean flag = false;

		Iterator<String> it = hMap.keySet().iterator();

		while(it.hasNext()) {
			String ID = it.next();
			HealthVO vo = hMap.get(ID);

			if(vo.getName().equals(name)) {
				System.out.println(ID + ": " + vo.toString());
				flag = true;
			}

		}
		if(flag) {
			System.out.println("검색성공!!");
		} else {
			System.out.println("이름이 존재하지 않습니다.검색실패!!");
		}
	}


}


