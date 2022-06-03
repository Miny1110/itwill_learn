package com.day5;

import java.util.Scanner;

public class Test1 {

	public static void main(String[] args) {
		System.out.println("[배열]");
		System.out.println();
		
		//int[] num = new int[5]; 와 int num[] = new int[5]; 둘 다 같은말임
		//JAVA의 배열은 무조건 0부터 시작한다.
		
		int num[] = new int[5];
		//배열의 갯수는 내가 원하는 숫자만큼 넣을 수 있다.
		//배열의 갯수는 500개로 지정하고 배열의 값은 5개만 넣어도 오류 X
		Scanner sc = new Scanner(System.in);
		
		System.out.println("5개의 정수를 입력하시오.");
		
		System.out.println();
		//(for문을 이용하여 배열 정리하기)
		for(int i=0; i<num.length; i++) {
			
			num[i] = sc.nextInt();
		}
		
//		(배열에 값이 들어가게 입력해주기)
// 		값을 하나하나 다 입력하는 것이기 때문에 코드가 길어지고 번거롭다.
//		num[0] = sc.nextInt();
//		num[1] = sc.nextInt();
//		num[2] = sc.nextInt();
//		num[3] = sc.nextInt();
//		num[4] = sc.nextInt();
		//num[5] = 60; 
		
		System.out.println();
		System.out.println("(배열의 갯수 구하기)");
		System.out.println("배열의 갯수는 [" + num.length + "]개이다.");
		System.out.println();
		//배열의 length에는 ()가 없다. = num.length();는 틀린 값임.
		
		System.out.println("(배열의 값 출력하기)");
		System.out.println("num[0]: " + num[0]);
		System.out.println("num[1]: " + num[1]);
		System.out.println("num[2]: " + num[2]);
		System.out.println("num[3]: " + num[3]);
		System.out.println("num[4]: " + num[4]);
	    //System.out.println("num[5]: " + num[5]);
	    //배열의 갯수에서 넘어가는 수를 배열로 작성하면 출력오류가 뜬다.
		System.out.println();
		
		System.out.println("(for문을 이용하여 배열의 값 출력하기)");
		//시작값과 끝값이 정해져있으면 반복문을 활용해서 코드의 값을 다 출력하지 않아도 된다.
		for(int i=0;i<num.length;i++) {
		//i<=num.length로 하면 배열의 공간이 5개가 아닌 6개가 된다.
			System.out.println("num[" + i + "]: " + num[i]);
	
		}
		
		System.out.println();
		System.out.println("(배열의 값 변경하기)");
		num[3] = 400;
		//num[3]의 값을 변경한 것임. 
		//값을 변경한 후 그 밑에 출력 코드를 넣으면 변경한 값이 나온다.
		System.out.println("num[3]: " + num[3]);
		
		System.out.println();
		System.out.println("(배열의 값을 다른 변수에 넣어주기)");
		int su = num[1];
		// num[1]의 값을 빼와서 su에 넣어준 것임.
		System.out.println(su + ":" + num[1]);
		// su와 num[1]의 값은 동일하게 출력됨.
		
		System.out.println();
		System.out.println("(배열의 값을 더하여 다른 배열에 출력하기)");
		num[4] = num[0] + num[1];
		System.out.println("num[4]: " + num[4]);
		//num[4]의 값을 num[0] + num[1];로 변경하여 출력한 것임.
		
	
		
	}

}

//배열은 어떤 값을 넣어야할지 정해놓고 만들기 때문에 같은 자료형끼리만 배열을 만들 수 있음
//배열의 값은 중간에 변경할 수 있지만 배열의 갯수를 중간에 변경할 수 없음.
//한 번 배열의 수를 지정한다면 그 이후에 배열의 수를 변경할 수 없다.

