package com.day19;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Test4 extends Frame implements ActionListener{

	private TextField tf;
	private TextArea ta;
	private Button btn;
	
	public Test4() {
		
		tf = new TextField();
		ta = new TextArea();
		btn = new Button("add");
		
		add(tf,BorderLayout.NORTH);
		add(ta,BorderLayout.CENTER);
		add(btn,BorderLayout.SOUTH);
		
		tf.addActionListener(this);
		btn.addActionListener(this);
		
		setTitle("윈도우");
		setSize(200, 300);
		
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		
		setVisible(true);
		
	}
	
	public static void main(String[] args) {
		new Test4();
	}

	@Override
	public void actionPerformed(ActionEvent evt) {
		
		Object ob = evt.getSource(); //tf 또는 btn 둘 중에 하나
		//알맹이는 tf, btn이지만 겉은 object로 감싸줌
		
		if(ob instanceof TextField || ob instanceof Button) {
			
			String str = tf.getText();
			
			if(!str.equals("")) {
				ta.append(str + "\r\n");
				//append: 누적한다. 텍스트 영역의 현재의 텍스트에, 지정된 텍스트를 추가한다.
			}
			
			tf.setText(""); //이벤트가 발생하면 text를 null로 만들어라 (입력창을 공백으로 만들어라)
			tf.requestFocus(); //커서 갖다놔라
			
			
		}
		
	}

}
