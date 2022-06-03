package com.day2;

public class Test7 {

	public static void main(String[] args) {

		float f = 0;  //0.0
		double d = 0;  //0.0
		
		for(int i=1; i<=10000 ; i++) {
			
			f = f + 100000; 
			d = d + 100000; 
			
		}
		 System.out.println("float: "+ (f/100000)); //100000
		 System.out.println("double: "+ (d/100000)); //100000
	}

}

//단순한 더하기 빼기 연산을 할 때는 float과 double의 값이 같지만
//더블 - 공간이 8byte, 소수점을 저장할 공간이 충분함.
//플롯 - 공간이 4byte, 용량이 작아 소수점을 저장할 공간이 없기 때문에 이진수를 통해 값이 변한다.
//1000번 반복할 때 까지는 문제가 없음.