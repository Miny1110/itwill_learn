package com.day18;

import java.io.Serializable;

public class MyData implements Serializable {

	private String name;
	private int score;
	
	public MyData(String name, int score) {
		this.name = name;
		this.score = score;
	}
	
	
	public String toString() {
		return name + ":" + score;
	}
	
	
	
	
	
	
}
