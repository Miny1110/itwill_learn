package com.day19;

import java.awt.Frame;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Test2 extends Frame{

	public Test2() {

		setTitle("윈도우");
		setSize(200, 300);

		/*
		리스너가 감시해야 하는 것은 windowClosing메소드이다.
		사용자가 메소드를 사용하면 코딩을 실행하는 것이다.
		이 메소드는 MyWindowAdapter 클래스 안에 있는 메소드이다.
		그렇기때문에 메소드를 사용하기 위해서는 해당 메소드가 들어있는 클래스의 객체를 생성해주어야 한다.
		 */
		addWindowListener(new MyWindowAdapter());

		setVisible(true);

	}

	//클래스 안에 클래스 만들기
	//내부클래스
	class MyWindowAdapter extends WindowAdapter{

		@Override
		public void windowClosing(WindowEvent e) {
			System.exit(0);
		}
	}


	public static void main(String[] args) {

		new Test2();


	}

}
