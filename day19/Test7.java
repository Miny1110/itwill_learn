package com.day19;

//Swing

import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;

public class Test7 extends JFrame implements ActionListener{

	private JLabel lbl;
	
	public Test7() {
		
		lbl = new JLabel("메세지", JLabel.CENTER);
		
		add(lbl);
		
		//메뉴
		JMenuBar mbar = new JMenuBar();
		JMenu menu;
		JMenuItem mi;

		menu = new JMenu("메세지대화상자");
		
		mi = new JMenuItem("입력");
		menu.add(mi);
		//클릭했다는 것을 감지하기 위해서 리스너 필요하다.
		mi.addActionListener(this);

		mi = new JMenuItem("메세지");
		menu.add(mi);
		mi.addActionListener(this);
		
		mi = new JMenuItem("종료");
		menu.add(mi);
		mi.addActionListener(this);
		
		mbar.add(menu);
		setJMenuBar(mbar);
		
		
		
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		
		setTitle("대화상자");
		setSize(300, 300);
		setVisible(true);
		
		
	}
	
	
	
	public static void main(String[] args) {
		new Test7();
	}

	
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		String str = e.getActionCommand();
		
		if(str.equals("입력")) {
			
			String  age = JOptionPane.showInputDialog(this,"몇살?","입력",JOptionPane.QUESTION_MESSAGE);
			lbl.setText("나이: " + age);
			
		}else if(str.equals("메세지")) {
			
			JOptionPane.showMessageDialog(this, "오늘 마지막 예제입니다","알림",JOptionPane.INFORMATION_MESSAGE);
			
		}else if(str.equals("종료")) {
			
			int result;
			result = JOptionPane.showConfirmDialog(this, "프로그램을 종료하시겠습니까?","종료",JOptionPane.YES_NO_OPTION,JOptionPane.ERROR_MESSAGE);
			
			
			if(result==JOptionPane.YES_OPTION) {
				System.exit(0);
			}
		}
		
		
		
	}

}
