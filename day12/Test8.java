package com.day12;

abstract class SortInt {

	private int[] value;

	abstract void sorting(); //추상메소드

	//private 배열변수를 초기화하기 위한 일반메소드
	public void sort(int[] value) {
		this.value = value;

	/*	자식의 sorting 메소드가 실행된다. 부모가 자식의 메소드를 사용했다. 원래는 안되는데 예외임 (책에서는 예외라고 설명한다.) 원래는 위에있는 sorting메소드를 실행해야 한다. 하지만 추상메소드라 실행문이 없다. 근데 같은 이름의 메소드(오버라이드한 메소드)가 자식에게 있으니까 내꺼(자식클래스에 있는 메소드) 쓴다. */
		sorting();
	}

	//배열의 길이(개수)를 세는 메소드
	public int length() {
		if(value==null) {
			return 0;
		}
		return value.length;
	}

	protected final int compare(int i, int j) {
		if(value[i]==value[j]) {
			return 0;
		} else if(value[i]>value[j]) {
			return 1;
		} else {
			return -1;
		}
	}

	protected final void swap(int i, int j) {
		int temp;

		temp = value[i];
		value[i] = value[j];
		value[j] = temp;
	}

	public void print() {
		if(value==null) {
			return; //stop
		}

		for(int su : value) {
			System.out.printf("%4d", su);
		}
		System.out.println();
	}
}


class SortTest extends SortInt {

	@Override
	void sorting() {

		//selection sort
		for(int i=0;i<length()-1;i++) {
			for(int j=i+1;j<length();j++) {
				if(compare(i, j)>0) {
					swap(i, j);
				}
			}
		}
	}
}


public class Test8 {

	public static void main(String[] args) {

		SortTest ob = new SortTest();

		int[] value = {50,30,10,70,20};

		ob.sort(value);
		ob.print();
	}

}
