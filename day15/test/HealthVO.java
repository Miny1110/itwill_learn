package com.day15.test;

public class HealthVO {

	private String name;
	private int age;
	private int height;
	private int weight;
	private float BMI;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public float getBMI() {
		return weight/(((float)height*height)/10000);
	}


	@Override
	public String toString() {
		String str;
		str = String.format("%4s %2d세 %4dcm %4dkg %4.1f", name, age, height, weight, getBMI());
		return str;
	}
	
}
