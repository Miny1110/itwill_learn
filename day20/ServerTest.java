package com.day20;

import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

//인터페이스는 다중상속 가능
public class ServerTest extends Frame implements ActionListener, Runnable {

	private TextArea ta = new TextArea();
	private TextField tf = new TextField();
	
	private ServerSocket ss  = null;
	private Socket sc = null;
	
	public ServerTest() {
		add(ta,BorderLayout.CENTER);
		add(tf,BorderLayout.SOUTH);
		
		tf.addActionListener(this);
		
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		
		setTitle("채팅 서버");
		setSize(300, 400);
		setVisible(true);
		
	}
	

	@Override //Runnable
	public void run() {
		//메세지 받기
	
		String msg;
		String ip;
		
		try {
			
			if(sc==null) {
				return;
			}
			//클라이언트가 보낸 소켓을 받는 코딩
			
			InputStream is = sc.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			
			//클라이언트가 소켓에 담아서 보낸 아이피를 읽을 수 있다.
			ip = sc.getInetAddress().getHostAddress();
			
			ta.append("\r\n[" + ip + "] 접속");
			
			while((msg = br.readLine())!=null) {
				ta.append("\r\n" + msg);
			}
			
		} catch (Exception e) {
			ta.append("\r\n" + "클라이언트 연결 종료");
			sc = null;
			ss = null;
		}
	}

	
	@Override //ActionListener
	public void actionPerformed(ActionEvent e) {
		//메세지 보내기
		
		String msg = tf.getText();
		
		if(msg.trim().equals("")) {
			return;
		}
		
		if(sc==null) {
			return;
		}
		
		try {
			
			//PrintWriter pw = new PrintWriter(sc.getOutputStream());
			
			OutputStream os = sc.getOutputStream();
			PrintWriter pw = new PrintWriter(os, true);
			//true: 마지막 문장이 버퍼를 채우지 않아도 나가라. flush같은 기능
			
			pw.println("서버] " + msg); //클라이언트에 msg전송
			ta.append("\r\n서버] " + msg);//내 창에도 msg 보임
			
			tf.setText("");
			tf.requestFocus();
			
	
		} catch (Exception e2) {
			ta.append("\r\n 클라이언트와 연결이 끊겼습니다");
			sc = null;
		}
	}

	
	public void severStart() {
		
		try {
			ss = new ServerSocket(7777);
			ta.setText("서버 시작!");
			
			//클라이언트가 접속해서 accept 일어남과 동시에 보낸 메세지를 받을 스레드를 실행한다.
			sc = ss.accept();
			
			Thread th = new Thread(this);
			th.start();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	
	
	public static void main(String[] args) {
		
		new ServerTest().severStart();
		
	}
}
