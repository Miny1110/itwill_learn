package com.day19;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Label;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Test6 extends Frame{

	//마우스 이벤트
	
	private int x, y;
	private Label lbl = new Label("", Label.CENTER);
	
	public Test6() {

		add(lbl, BorderLayout.SOUTH);
		
		addMouseListener(new MouseHandler());
		addMouseMotionListener(new MouseMotionHandler());
		
		setBackground(new Color(150, 150, 150));
		setForeground(new Color(0, 0, 250));
		
		addWindowListener(new WindowAdapter() {
		
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		
		setTitle("좌표출력");
		setSize(400, 400);
		setVisible(true);
		
	}
	
	
	
	@Override
	public void paint(Graphics g) {
		String str;
		str = "(" + x + ", " + y + ")";
		g.drawString(str, x, y);
	}


	@Override
	public void update(Graphics g) {
		paint(g);
	}
	
	
	
	class MouseHandler extends MouseAdapter{

		@Override //마우스 누를때
		public void mousePressed(MouseEvent e) {
			x = e.getX();
			y = e.getY();
			
			repaint(); //update 메소드를 호출한다
		
		}

		@Override //마우스 뗄때
		public void mouseReleased(MouseEvent e) {
		
		
		}
		
	}

	
	class MouseMotionHandler extends MouseMotionAdapter{

		@Override
		public void mouseDragged(MouseEvent e) {
			x = e.getX();
			y = e.getY();
			
			repaint();
		}

		
		@Override
		public void mouseMoved(MouseEvent e) {
			String str = String.format("(%d, %d)", e.getX(), e.getY());
			lbl.setText(str);
		}
		
	}
	
	public static void main(String[] args) {
		new Test6();
	}
}
