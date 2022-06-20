package com.day15.test;

import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class TicketImpl implements Ticket {

	private Map<String, TicketVO> hMap = new TreeMap<>();

	Scanner sc = new Scanner(System.in);
	String ID;
	int seatRow, seatNum;


	@Override
	public void input() {

		System.out.print("ID입력: ");
		ID = sc.next();

		if(searchID(ID)) {
			System.out.println("ID가 존재합니다. 예매실패");
			return;
		}

		TicketVO vo = new TicketVO();

		System.out.print("작품명? ");
		vo.setpName(sc.next());


		do {
			System.out.print("좌석 구역?(A,B,C) ");
			vo.setSeatArea(sc.next());
		} while(vo.getSeatArea()=="A" && vo.getSeatArea()=="B" && vo.getSeatArea()=="C");


		do {
			System.out.print("좌석 열번호?(1~10) ");
			vo.setSeatRow(sc.nextInt());
		} while(vo.getSeatRow()<1 || vo.getSeatRow()>10);


		do {
			System.out.print("좌석 번호?(1~10) ");
			vo.setSeatNum(sc.nextInt());
		} while(vo.getSeatNum()<1 || vo.getSeatNum()>10);


		System.out.print("예매자명? ");
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

		System.out.print("예매취소할 아이디? ");
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

		System.out.print("좌석변경할 아이디? ");
		TicketVO vo = hMap.get(sc.next());

		if(!searchID(ID)) {
			System.out.println("ID가 존재하지 않습니다");
			return;
		}

		do {
			System.out.print("좌석 구역?(A,B,C) ");
			vo.setSeatArea(sc.next());
		} while(vo.getSeatArea()=="A" && vo.getSeatArea()=="B" && vo.getSeatArea()=="C");


		do {
			System.out.print("좌석 열번호?(1~10) ");
			vo.setSeatRow(sc.nextInt());
		} while(vo.getSeatRow()<1 || vo.getSeatRow()>10);


		do {
			System.out.print("좌석 번호?(1~10) ");
			vo.setSeatNum(sc.nextInt());
		} while(vo.getSeatNum()<1 || vo.getSeatNum()>10);


		System.out.println(ID + ": " + vo.toString());
		System.out.println("좌석변경 성공!!");

	}


	@Override
	public void searchCname() {

		System.out.print("검색할 예매자명? ");
		String cName = sc.next();
		boolean flag = false;

		Iterator<String> it = hMap.keySet().iterator();

		while(it.hasNext()) {
			String ID = it.next();
			TicketVO vo = hMap.get(ID);

			if(cName.equals(vo.getcName())) {
				System.out.println(ID + vo.toString());
				flag = true;
			}

		}
		if(flag) {
			System.out.println("검색성공!!");
		} else {
			System.out.println("검색실패!!");
		}

	}


	@Override
	public void searchPname() {

		System.out.print("검색할 작품명? ");
		String pName = sc.next();
		boolean flag = false;

		Iterator<String> it = hMap.keySet().iterator();

		while(it.hasNext()) {
			String ID = it.next();
			TicketVO vo = hMap.get(ID);
			
			if(pName.equals(vo.getpName())) {
				System.out.println(ID + vo.toString());
				flag = true;
			}
			
		}
		
		if(flag) {
			System.out.println("검색성공!!");
		} else {
			System.out.println("검색실패!!");
		}
		
	}


}
