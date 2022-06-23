package com.score5;

import java.io.Serializable;

//직렬화때문에 implements Serializable 필요
public class ScoreVO implements Serializable {

	private String name;
	private String birth;
	private int score;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	@Override
	public String toString() {

		return String.format("%6s %10s %4d", name, birth, score);
		
	}
	
}
