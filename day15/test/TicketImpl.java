package com.day15.test;

import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class TicketImpl implements Ticket {

	private Map<String, TicketVO> hMap = new TreeMap<>();
	
	Scanner sc = new Scanner(System.in);
	String ID;
	String seatA;
	int seatRow, seatNum;
	
	
	@Override
	public void input() {
		
		System.out.print("ID입력: ");
		ID = sc.next();
		
		if(searchID(ID)) {
			System.out.print("ID가 존재합니다. 예매실패");
			return;
		}
		
		TicketVO vo = new TicketVO();
		
		System.out.print("작품명? ");
		vo.setpName(sc.next());
		
		
		do {
			System.out.print("좌석 구역?(A,B,C) ");
			seatA = sc.next();
			vo.setSeatArea(seatA);
		} while(seatA!="A" && seatA!="B" && seatA!="C");
		
		
		do {
			System.out.print("좌석 열번호?(1~10) ");
			seatRow = sc.nextInt();
			vo.setSeatRow(seatRow);
		} while(seatRow<1 || seatRow>10);
		
		
		do {
			System.out.print("좌석 번호?(1~10) ");
			seatNum = sc.nextInt();
			vo.setSeatNum(seatNum);
		} while(seatRow<1 || seatRow>10);

		
		System.out.print("예매자명?");
		vo.setcName(sc.next());
		
		System.out.print("핸드폰 뒷 네자리? ");
		vo.setPhoneNum(sc.nextInt());
		
		
		hMap.put(ID, vo);
		System.out.println("예매 성공!!");
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
			TicketVO vo = hMap.get(ID);
			
			System.out.println(ID + ": " + vo.toString());
		}
	}

	
	@Override
	public void delete() {
		
		System.out.println("예매취소할 아이디?");
		ID = sc.next();
		
		if(searchID(ID)) {
			hMap.remove(ID);
			System.out.println("예매취소 성공!!");
		} else {
			System.out.println("ID가 없습니다");
		}
	}

	
	@Override
	public void update() {
		 
		System.out.println("좌석변경할 아이디?");
		TicketVO vo = hMap.get(sc.next());
		
			
		do {
			System.out.print("좌석 구역?(A,B,C) ");
			seatA = sc.next();
			vo.setSeatArea(seatA);
		} while(seatA!="A" && seatA!="B" && seatA!="C");
		
		
		do {
			System.out.print("좌석 열번호?(1~10) ");
			seatRow = sc.nextInt();
			vo.setSeatRow(seatRow);
		} while(seatRow<1 || seatRow>10);
		
		
		do {
			System.out.print("좌석 번호?(1~10) ");
			seatNum = sc.nextInt();
			vo.setSeatNum(seatNum);
		} while(seatRow<1 || seatRow>10);
		
		
		System.out.println(ID + ": " + vo.toString());
		System.out.println("좌석변경 성공!!");
		
	}

	
	@Override
	public void searchCname() {
		
	}

	
	@Override
	public void searchPname() {
		
	}

	
}
