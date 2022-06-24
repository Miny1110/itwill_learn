package com.day19;

import java.awt.Button;
import java.awt.Frame;
import java.awt.Label;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Test5 extends Frame implements ActionListener{

	private TextField[] tf = new TextField[4];
	private Label result = new Label(" ", Label.LEFT);

	private Button btn1, btn2;

	public Test5() {

		String[] title = {"name","kor","eng","math","tot"};

		setTitle("성적처리");
		setLayout(null); //좌표를 수동으로 넣을땐 필수

		for(int i=0;i<5;i++) {
			Label lbl = new Label();

			lbl.setText(title[i]);
			lbl.setBounds(10, (i+1)*30, 50, 20);
			add(lbl);

			if(i!=4) {
				//텍스트필드가 클래스이기 때문에 객체를 생성해준다.
				tf[i] = new TextField();

				tf[i].setBounds(80, (i+1)*30, 70, 20);
				tf[i].addKeyListener(new KeyHandler());

				add(tf[i]);


			}else {
				result.setBounds(80, (i+1)*30, 70, 20);

				add(result);
			}

		} 

		//결과버튼
		btn1 = new Button("result");
		btn1.setBounds(180, 30, 60, 20);
		add(btn1);
		btn1.addActionListener(this);
		btn1.addKeyListener(new KeyHandler());
		//


		//종료버튼
		btn2 = new Button("exit");
		btn2.setBounds(180, 60, 60, 20);
		add(btn2);
		btn2.addActionListener(this);
		//


		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});

		setSize(260, 180);
		setResizable(false); //화면 크게하는거 비활성화
		setVisible(true);

	}

	public static void main(String[] args) {
		new Test5();
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		Object ob = e.getSource();

		if(ob instanceof Button) {

			Button b = (Button)ob;

			if(b==btn1) {
				//연산
				//연산하는 메소드를 따로 작성해서, 그걸 호출한 것이다.
				execute();
				
			}else if(b==btn2) {
				//종료
				System.exit(0);
			}
		}
	}

	
	//연산값이 변경되면 안되기 때문에 private
	//연산값을 위에 btn if문과 밑에 keypressed에서 또 연산을 하기 때문에 하나의 메소드로 만들었다.
	private void execute() {
		
		int tot = 0;
		try {
			for(int i=1;i<=3;i++) {
				tot += Integer.parseInt(tf[i].getText());
				//getText는 String타입 메소드이기 때문에 연산을 위해 형변환을 해주어야 한다.
			}

			result.setText(Integer.toString(tot));
			//setText 메소드의 인수로는 String타입을 넣어주어야 하기때문에 형변환을 해주어야 한다.
			//result.setText("" + tot); //숫자와 null을 합치면 문자가 된다.

		} catch (Exception e2) {
			result.setText("입력오류");
		}
	}
	

	//두군데에서 사용하기 때문에 직접 오버라이딩하는 방법은 번거로워진다.
	//어뎁터를 상속받는 내부클래스 만들기 방법으로 작성한다.
	class KeyHandler extends KeyAdapter{

		@Override
		public void keyPressed(KeyEvent e) {
			
			//getSource: 이벤트가 최초로 발생한 객체
			Object ob = e.getSource();
			
			if(e.getKeyCode()!=KeyEvent.VK_ENTER) {
				return;
			}
			
			//enter
			//결과에서 엔터
			if(ob instanceof Button) {
				
				Button b = (Button)ob;
				
				if(b==btn1) {
					execute();
				}
				
				//return 안하면 if문 밖의 밑에 문장을 계속 수행한다.
				//return을 써서 이 메소드를 빠져나가게 해야 한다.
				return;
				
			}
			
			//textField에서 엔터
			if(ob instanceof TextField) {
				
				TextField t = (TextField)ob;
				
				for(int i=0;i<tf.length;i++) {
					
					//i가 3이 아니고, 이벤트가 발생한 객체가 tf[i]번째와 같으면(tf[i]가 자기 자신일 때) 포커스를 아래로 옮겨라
					if(i!=3 && tf[i]==t) {
						tf[i+1].requestFocus();
						return;
					//이번트가 발생한 객체가 tf[3]과 같으면 포커스를 버튼으로 옮겨라
					} else if(tf[3]==t) {
						btn1.requestFocus();
						return;
					}
				}
			}
		}
	}
}
