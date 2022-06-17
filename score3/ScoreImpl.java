package com.score3;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class ScoreImpl implements Score {

	private List<ScoreVO> lists = new ArrayList<>();
	Scanner sc = new Scanner(System.in);

	@Override
	public int input() {

		int result = 0;

		ScoreVO vo = new ScoreVO();

		System.out.print("학번? "); //111

		//String hak = sc.next();
		//vo.setHak(hak);
		//위 두 문장을 한번에
		vo.setHak(sc.next());


		System.out.print("이름? ");
		vo.setName(sc.next());

		System.out.print("국어? ");
		vo.setKor(sc.nextInt());

		System.out.print("영어? ");
		vo.setEng(sc.nextInt());

		System.out.print("수학? ");
		vo.setMat(sc.nextInt());

		lists.add(vo);

		return result;
	}



	@Override
	public void print() { 

		Iterator<ScoreVO> it = lists.iterator();
		while(it.hasNext()) {

			ScoreVO vo = it.next();
			System.out.println(vo.toString());
			/*			
			System.out.printf("%5s %6s %4d %4d %4d %4d %4.1f",
					vo.getHak(), vo.getName(),
					vo.getKor(), vo.getEng(), vo.getMat(),
					(vo.getKor() + vo.getEng() + vo.getMat()),
					(vo.getKor() + vo.getEng() + vo.getMat())/3.0);
			 */
		}

	}



	@Override
	public void deleteHak() {
		/*
		System.out.println("삭제할 학번?");
		String hak = sc.next();

		Iterator<ScoreVO> it = lists.iterator();
		while(it.hasNext()) {

			ScoreVO vo = it.next();

			if(hak.equals(vo.getHak())) {
				//it.remove();
				//iterator의 remove
				
				lists.remove(vo);
				break; //break 생락하면 에러 발생. 멈추지 않으면 반복문때문에 빈공간과 데이터를 비교하게 된다.
				//lists의 remove
				//실제 데이터를 삭제하는 코드다.	
			}
		}
		print();
		 */

		System.out.println("삭제할 학번?"); //222
		String hak = sc.next();

		Iterator<ScoreVO> it = lists.iterator();
		while(it.hasNext()) {

			ScoreVO vo = it.next();

			if(hak.equals(vo.getHak())) {
				lists.remove(vo);
				break;
			}
		}
	}



	@Override
	public void searchHak() {

		System.out.println("검색할 학번?"); //222
		String hak = sc.next();

		Iterator<ScoreVO> it = lists.iterator();
		while(it.hasNext()) {

			ScoreVO vo = it.next();

			if(hak.equals(vo.getHak())) {
				System.out.println(vo.toString());
				break;
			}
		}
	}



	@Override
	public void searchName() {
		System.out.println("검색할 이름?"); //suzi
		String name = sc.next();

		Iterator<ScoreVO> it = lists.iterator();
		while(it.hasNext()) {

			ScoreVO vo = it.next();

			if(name.equals(vo.getName())) {
				System.out.println(vo.toString());
			}
		}
	}



	@Override
	public void descSortTot() {

		Comparator<ScoreVO> comp  = new Comparator<ScoreVO>() {

			@Override
			public int compare(ScoreVO vo1, ScoreVO vo2) {
				return vo1.getTot()<vo2.getTot()?1:-1;
			}
		};

		Collections.sort(lists, comp);

		print();

	}



	@Override
	public void ascSortHak() {
		/*
		Comparator<ScoreVO> comp  = new Comparator<ScoreVO>() {

			@Override
			public int compare(ScoreVO vo1, ScoreVO vo2) {
				return Integer.parseInt(vo1.getHak())>Integer.parseInt(vo2.getHak())?1:-1;
			}
		};


		Collections.sort(lists, comp);

		print();
		 */

		Comparator<ScoreVO> comp = new Comparator<ScoreVO>() {

			@Override
			public int compare(ScoreVO o1, ScoreVO o2) {
				return o1.getHak().compareTo(o2.getHak());

			}
		};

		Collections.sort(lists, comp);

		print();
	}

}
