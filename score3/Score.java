package com.score3;

public interface Score {

	//abstract 생략되어 있다. Interface니까
	
	public int input(); //입력
	public void print(); //출력
	public void deleteHak(); //학번삭제
	public void searchHak(); //학번검색
	public void searchName(); //이름검색
	public void descSortTot(); //총점 내림차순 정렬
	public void ascSortHak(); //학번 오름차순 정렬
	
}
