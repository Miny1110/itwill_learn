package com.score3;

public class ScoreVO { //Value Object. 데이터를 저장하는 저장공간으로 사용할거다.

	//String hak; //외부에서 접근 가능
	private String hak; 
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	//tot는 내부적으로 만들어진다. setter가 필요하지 않다. getter로 값을 꺼내기만 하면 된다.
	
//-----------------------------------------------------------------------------------------------
/*	
	//main메소드에서 ScoreVO 객체생성을 하기 위해서 기본생성자가 명시되어야 한다.
	//밑에 오버로딩 생성자가 있기 때문에
	public ScoreVO() {}


	public ScoreVO(String hak, String name, int kor, int eng, int mat) {
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
*/
//-----------------------------------------------------------------------------------------------
	
	public void set(String hak, String name, int kor, int eng, int mat) {
		this.hak = hak;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

//-----------------------------------------------------------------------------------------------
/*	
	//getter, setter
	//변수초기화 메소드
	public void setHak(String hak) {
		this.hak = hak;
	}
	public String getHak() {
		return hak;
	}
	
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}

	
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getKor() {
		return kor;
	}
	
	
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getEng() {
		return eng;
	}
	
	
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getmat() {
		return mat;
	}
*/	
//-----------------------------------------------------------------------------------------------

	//Getter, Setter
	public String getHak() {
		return hak;
	}
	
	public void setHak(String hak) {
		this.hak = hak;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getKor() {
		return kor;
	}
	
	public void setKor(int kor) {
		this.kor = kor;
	}
	
	public int getEng() {
		return eng;
	}
	
	public void setEng(int eng) {
		this.eng = eng;
	}
	
	public int getMat() {
		return mat;
	}
	
	public void setMat(int mat) {
		this.mat = mat;
	}
	
	//tot는 Setter 없어도 된다. 위에서 받은 값으로 연산이 되기 때문에.
	//Getter와 Setter 둘 다 꼭 필요한 것은 아니다.
	public int getTot() {
		return kor + eng + mat;
	}
	
	
	


	@Override
	public String toString() {

		if(hak==null || hak.equals("")) {
			return null;
		}

		String str = String.format("%5s %6s %4d %4d %4d %4d %4.1f",
				hak, name, kor, eng, mat, getTot(), getTot()/3.0);

		return str;
	}




	/*
	public String print() {

		//String은 ==이 아니라 equals를 통해 비교해야 하지만, 여기서는 ==로도 비교가 가능하다.
		if(hak==null || name==null) {
			return null;
		}

		String str = String.format("%5s %6s %4d %4d %4d %4d %4.1f",
				hak, name, kor, eng, mat, (kor+eng+mat), (kor+eng+mat)/3.0);

		return str;

	}
	 */





}
