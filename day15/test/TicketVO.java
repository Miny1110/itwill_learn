package com.day15.test;

public class TicketVO {

	private String pName; //작품명
	private String seatArea; //좌석구역
	private int seatRow; //좌석열번호
	private int seatNum; //좌석번호
	private String cName; //예매자명
	private int phoneNum; //핸드폰뒷자리
	
	
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getSeatArea() {
		return seatArea;
	}
	public void setSeatArea(String seatArea) {
		this.seatArea = seatArea;
	}
	public int getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(int seatRow) {
		this.seatRow = seatRow;
	}
	public int getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(int phoneNum) {
		this.phoneNum = phoneNum;
	}
	
	
	@Override
	public String toString() {
		String str = String.format("%6s %3s구역-%d열-%d번 %4s(%d)",
				pName, seatArea, seatRow, seatNum, cName, phoneNum);
		
		return str;
	}
}
