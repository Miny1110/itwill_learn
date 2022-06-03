package com.day4;

import java.io.IOException;
import java.util.Scanner;

public class Test2 {

	public static void main(String[] args) throws IOException {

		//어떤 수를 입력받아 1에서부터 수 까지의 합계를 구하시오.

		Scanner sc = new Scanner(System.in);
		int su, sum = 0;
		char ch;

		while(true) { //무한루프, 조건이 필요없다. 조건은 안에서 줄 것임.
			//false를 넣으면 이 문장은 한 번도 실행이 될 수 없기 때문에 사용하지 않음
			

			do {

				System.out.print("원하는 수를 입력하시오."); //10
				su = sc.nextInt();

			} while(su<1 || su>5000);
			// 조건은 값이 F가 되어야 밑에 for문이 출력이 된다.
			// 값이 true가 되면 다시 do로 돌아감.
			sum = 0; // 초기화 작업을 해주지 않으면 값이 계속 누적이 된다.

			for(int i=1; i<=su; i++) {

				sum=sum+i; // sum += i;

			}

			System.out.println("1~" + su + "까지의 합 : " + sum);

			System.out.print("계속 입력하시겠습니까?[Y/N]");
			ch = (char)System.in.read();

			if(ch != 'y' && ch != 'Y') {
				//양쪽이 부정이면 무조건 &&를 사용해준다.

				System.out.println("프로그램을 종료합니다.");

				break; 
				//while, do~while, for, switch에서만 사용한다.
			}

		}

	}

}
