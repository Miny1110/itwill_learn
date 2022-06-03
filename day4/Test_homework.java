package com.day4;

import java.util.Scanner;

public class Test_homework {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.println("1. (1)+(1+2)+(1+2+3)+...+(1+2+3+...+10)");
		//결과 : 220
		int i, j,sum=0 ;

		for(j=1;j<=10;j++) {

			for(i=1;i<=j;i++) {
				sum = sum + i;
			}

		} System.out.println("결과 : "+ sum);


		System.out.println();
		System.out.println("2. 1에서 100까지 수의 홀수의 합, 짝수의 합, 전체의 합");

		//짝수합 : 2550
		//홀수합 : 2500
		//합 : 5050
		int n;
		sum = 0;
		for(n=2;n<=100;n+=2) {
			sum = sum + n;
		}
		System.out.println("짝수 합 :" + sum);
		sum = 0;
		for(n=1;n<=100;n+=2) {
			sum = sum + n;

		}System.out.println("홀수 합 :" + sum);
		sum = 0;
		for(n=1;n<=100;n++) {
			sum = sum + n;

		}System.out.println("합계 :" + sum);


		System.out.println();
		System.out.println("3. 1-2+3-4+5-6+7-8+9-10");
		//결과 : -5
		//(홀수일 때는 +, 짝수일 때는 -, 반복문 if 나머지를 이용하여 홀수, 짝수)

		
		System.out.println();
		System.out.println("4. 1에서 100까지의 수중 3의 배수의 갯수");

		//3의 배수의 개수 : 33

		int cnt=0;
		for(n=1;n<=100;n++) {
			if(n%3==0) {
				cnt++; 
			}
		}
		System.out.println("3의 배수의 갯수 : " + cnt + "개");

		System.out.println();
		System.out.println("5. 두 수를 입력받아 작은 수에서 큰 수까지의 합");
		//1~100 까지의 합 : 5050
		int a, b, temp, sum1=0;

		System.out.print("첫 번째 숫자를 입력하시오");
		a = sc.nextInt();
		System.out.print("두 번째 숫자를 입력하시오");
		b = sc.nextInt();

		if(a>b) {
			temp = a;
			a = b;
			b = temp;		
		}
		for (int k = a; k<=b ; k++) {
			sum1 = sum1 + k;
		} System.out.println(a + "부터" + b + "까지의 합 : " + sum1);

		System.out.println();
		System.out.println("6. 아래와 같이 구구단을 출력하세요");

		// 3중 for문, 3가지 방법이 있다.
		/*
		 2* 1= 2         3* 1= 3         4* 1= 4         5* 1= 5
		 2* 2= 4         3* 2= 6         4* 2= 8         5* 2=10
		 2* 3= 6         3* 3= 9         4* 3=12         5* 3=15
		 2* 4= 8         3* 4=12         4* 4=16         5* 4=20
		 2* 5=10         3* 5=15         4* 5=20         5* 5=25
		 2* 6=12         3* 6=18         4* 6=24         5* 6=30
		 2* 7=14         3* 7=21         4* 7=28         5* 7=35
		 2* 8=16         3* 8=24         4* 8=32         5* 8=40
		 2* 9=18         3* 9=27         4* 9=36         5* 9=45

		 6* 1= 6         7* 1= 7         8* 1= 8         9* 1= 9
		 6* 2=12         7* 2=14         8* 2=16         9* 2=18
		 6* 3=18         7* 3=21         8* 3=24         9* 3=27
		 6* 4=24         7* 4=28         8* 4=32         9* 4=36
		 6* 5=30         7* 5=35         8* 5=40         9* 5=45
		 6* 6=36         7* 6=42         8* 6=48         9* 6=54
		 6* 7=42         7* 7=49         8* 7=56         9* 7=63
		 6* 8=48         7* 8=56         8* 8=64         9* 8=72
		 6* 9=54         7* 9=63         8* 9=72         9* 9=81
		 */

		int e, f;
		
			for(e = 1; e <= 9; e++) {
				for(f = 2; f <= 9; f++) {
					System.out.print(f + " * " + e + " = " + (e*f)+"\t");

				} System.out.println();
			}
		
	}

}
