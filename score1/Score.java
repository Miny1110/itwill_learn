package com.score1;

import java.util.Scanner;

//인스턴스 변수와 작업
public class Score {

	//한가지 데이터만 들어갈 수 있다.
	//int a;
	
	//Record는 7개의 데이터가 들어가는 자료형이 되는 것이다.
	//Record rec;
	

	private int inwon;
	Record[] rec;

	Scanner sc = new Scanner(System.in);
	
	
	public void set() {
		
		do {
			System.out.print("인원수? ");
			inwon = sc.nextInt();
		} while(inwon<1 || inwon>10);
		
		
		//배열을 만든 것
		rec = new Record[inwon];
		
	}
	
	
	//입력값 받기
	public void input() {
		
		String[] title = {"국어? ", "영어? ", "수학? "};
		
		
		for(int i=0;i<inwon;i++) {

			//Record객체를 생성하고(new Record())
			//rec배열 인덱스 0번째에 객체의 주소값을 넣는 것
			//객체생성이 for문 밖에 있으면 하나의 객체에 데이터가 덧입혀지는 것. 그래서 객체 생성문도 반복문 안에 있어야 한다.
			rec[i] = new Record();
			
			//rec배열의 0번째 칸의 name값
			System.out.print("이름? ");
			rec[i].name = sc.next();
			
			
			for(int j=0;j<3;j++) {
				
				//rec배열의 i번째 칸의 score배열의 j번째 값
				System.out.print(title[j]);
				rec[i].score[j] = sc.nextInt();
				
				rec[i].tot += rec[i].score[j];
				
			}

			//반복문이 완전히 끝나야 tot값이 완성되기 때문에
			//tot값이 필요한 ave는 for문 밖으로 나와야 한다.
			rec[i].ave = rec[i].tot / 3;
			
		}
	}
	
	
	//순위 구하기
	//private > 클래스명.ranking으로 접근 불가(외부에서 접근 불가)
	private void ranking() {
		
		int i, j;
		
		//모든 rank의 값 1로 초기화
		for(i=0;i<inwon;i++) {
			rec[i].rank = 1;
		}
		
		
		//Selection Sort(정렬)
		for(i=0;i<inwon-1;i++) {
			for(j=i+1;j<inwon;j++) {
				
				//총합 비교해서 합이 적은 곳에 순위++
				if(rec[i].tot>rec[j].tot) {
					rec[j].rank++;
				} else if(rec[i].tot<rec[j].tot) {
					rec[i].rank++;
				}
				
			}
		}
		
	}
	
	
	//출력하기
	public void print() {
		
		//메소드에서 메소드 호출
		ranking();

		for(int i=0;i<inwon;i++) {
			
			System.out.printf("%6s", rec[i].name);
			
			for(int j=0;j<3;j++) {
				System.out.printf("%4d", rec[i].score[j]);
			}
			
			System.out.printf("%4d", rec[i].tot);
			System.out.printf("%4d", rec[i].ave);
			System.out.printf("%4d\n", rec[i].rank);
			
			
		}
		
		
		
		
	}
	
	
}
