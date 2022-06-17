package com.score4;

import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class ScoreImpl implements Score {

	private Map<String, ScoreVO> hMap = new TreeMap<>();
	
	Scanner sc = new Scanner(System.in);
	String hak;
	
	
	@Override
	public void input() {
		
		System.out.print("학번? "); //key
		hak = sc.next();
		
		if(searchHak(hak)) {
			System.out.println("학번이 존재합니다. 추가 실패");
			return; //stop
		}
			
		ScoreVO vo = new ScoreVO();
		
		System.out.print("이름? ");
		vo.setName(sc.next());
		
		System.out.print("국어? ");
		vo.setKor(sc.nextInt());

		System.out.print("영어? ");
		vo.setEng(sc.nextInt());
		
		System.out.print("수학? ");
		vo.setMat(sc.nextInt());
		
		
		hMap.put(hak, vo);
		
		System.out.println("추가 성공");
	}

	
	
	@Override
	public boolean searchHak(String hak) {
		
		/*
		if(hMap.containsKey(hak)) {
			return true;
		}
		return false;
		*/
		
		return hMap.containsKey(hak);
	}

	
	
	@Override
	public void print() {
		
		Iterator<String> it = hMap.keySet().iterator();
		
		while(it.hasNext()) {
			String hak = it.next();
			ScoreVO vo = hMap.get(hak);
			
			System.out.println(hak + " " + vo.toString());
		}
		
	}

	
	
	@Override
	public void delete() {
		
		System.out.print("삭제할 학번? ");
		hak = sc.next();
		
		if(searchHak(hak)) {
			hMap.remove(hak);
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}
		
		/*
		System.out.print("삭제할 학번? ");
		String delHak = sc.next();
		
		if(searchHak(delHak)) {
			hMap.remove(delHak);
			return;
		}
		System.out.println("학번이 없습니다");
		*/
	}

	
	
	@Override
	public void update() {
		
		System.out.print("수정할 학번? ");
		hak = sc.next();
		
		if(!searchHak(hak)) {
			System.out.println("수정실패");
			return;
		}
		
		/*
		방법1
		해당학번의 기존데이터를 빼온다. 
		수정을 위한 새로운 객체를 생성한다.
		점수는 사용자에게 입력받아서 새로 입력하고,
		이름은 기존 데이터의 이름을 가져와서(get) 새로운 객체에 입력해준다(set)
		ScoreVO pVO = hMap.get(hak);
		
		ScoreVO vo = new ScoreVO();
		vo.setName(pVO.getName());
		
		System.out.print("국어? ");
		vo.setKor(sc.nextInt());
		
		System.out.print("영어? ");
		vo.setEng(sc.nextInt());
		
		System.out.print("수학? ");
		vo.setMat(sc.nextInt());
		
		hMap.put(hak, vo);
		 */
		
		
		/*
		방법2
		해당 학번의 기존데이터를 꺼낸다.
		사용자가 입력한 데이터로 수정한다.
		*/
		
		ScoreVO vo = hMap.get(hak);
		
		System.out.print("국어? ");
		vo.setKor(sc.nextInt());

		System.out.print("영어? ");
		vo.setEng(sc.nextInt());
		
		System.out.print("수학? ");
		vo.setMat(sc.nextInt());
		
		hMap.put(hak, vo);
		
		System.out.println("수정성공");
		
		
		
		/*
		System.out.print("수정할 학번? "); //점수를 수정
		String upHak = sc.next();
		
		if(searchHak(upHak)) {
			ScoreVO vo = hMap.get(upHak);
			System.out.print("국어? ");
			vo.setKor(sc.nextInt());

			System.out.print("영어? ");
			vo.setEng(sc.nextInt());
			
			System.out.print("수학? ");
			vo.setMat(sc.nextInt());
		}
		*/
	}

	
	
	@Override
	public void findHak() {
		
		System.out.print("검색할 학번? ");
		hak = sc.next();
		
		if(!searchHak(hak)) {
			System.out.println("학번이 존재하지 않습니다. 검색실패");
			return;
		}
		
		ScoreVO vo = hMap.get(hak);
		System.out.println(hak + " " + vo.toString());
		
		/*
		System.out.print("검색할 학번? ");
		String findHak = sc.next();
		
		if(searchHak(findHak)) {
			ScoreVO vo = hMap.get(findHak);
			System.out.println(findHak + " " + vo.toString());
			return;
		}
		System.out.println("학번이 없습니다");
		*/
	}

	
	
	@Override
	public void findName() {
		
		System.out.println("검색할 이름? ");
		String name = sc.next();
		
		Iterator<String> it = hMap.keySet().iterator();
		
		boolean flag = false;
		
		while(it.hasNext()) {
			
			String hak = it.next();
			ScoreVO vo = hMap.get(hak);
			
			if(name.equals(vo.getName())) {
				System.out.println(hak + " " + vo.toString());
				flag = true;
			}
			
		}
		
		if(flag) {
			System.out.println("검색성공");
		} else {
			System.out.println("이름이 존재하지 않습니다. 검색실패");
		}
		
		
		/*
		System.out.print("검색할 이름? ");
		String findName = sc.next();
		
		Iterator<String> it = hMap.keySet().iterator();
		
		while(it.hasNext()) {
			String hak = it.next();
			ScoreVO vo = hMap.get(hak);

			if(vo.getName().equals(findName)){
				System.out.println(hak + " " + vo.toString());
				break;
			}
		}
		*/
	}

	
}
