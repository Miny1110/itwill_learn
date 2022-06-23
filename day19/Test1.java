package com.day19;

import java.awt.Color;
import java.awt.Frame;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

//모든 웹은 이벤트 단위로 움직인다.
//AWT (Abstract Window ToolKit) -> Swing -> FX(거의 사용X)

//Frame: 윈도우 기능을 사용하기 위한 클래스
//Frame의 부모는 Window

//Listener: 많이 사용되는 용어다. 리스너가 붙은 것들은 보통 감시자 역할을 한다.
//WindowListener: 감시자의 역할
public class Test1 extends Frame implements WindowListener{

	//기본생성자에 코딩
	public Test1() {
		
		setTitle("자바 윈도우");
		setSize(200, 300);
		setBackground(new Color(255, 255, 0));
		
		//this: Test1
		//감시카메라를 추가해라
		addWindowListener(this);
		
		setVisible(true); //기본설정이 false로 되어있다. false면 창이 안보인다.

	}
	
	
	public static void main(String[] args) {
		
		//객체생성만 해주면 알아서 움직인다.
		new Test1();
	}


	@Override
	public void windowActivated(WindowEvent e) {
	}


	@Override
	public void windowClosed(WindowEvent e) {
	}


	//addWindowListener가 없으면 감시자가 없기 때문에 사용자의 커서 위치를 몰라서, x버튼을 눌러도 창이 닫히지 않는다.
	@Override
	public void windowClosing(WindowEvent e) {
		System.exit(0);
	}


	@Override
	public void windowDeactivated(WindowEvent e) {
	}


	@Override
	public void windowDeiconified(WindowEvent e) {
	}


	@Override
	public void windowIconified(WindowEvent e) {
	}


	@Override
	public void windowOpened(WindowEvent e) {
	}
	
}
