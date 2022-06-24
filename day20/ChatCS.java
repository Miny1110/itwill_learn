package com.day20;

import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.net.MulticastSocket;

import org.omg.PortableInterceptor.INACTIVE;

//그룹채팅
//D class ip범위 : 224.0.0.0 ~ 239.255.255.255

public class ChatCS extends Frame implements ActionListener, Runnable{

	private MulticastSocket ms = null;
	private InetAddress xGroup = null;

	private String host = "230.1.1.1";
	private int port = 7777;
	private String userName = "dv";

	private TextArea ta = new TextArea();
	private TextField tf = new TextField();

	//DatagramSocket: UDP로 데이터를 전송하거나 수신할 때 사용하는 소켓
	//DatagramPacket: UDP를 이용하여 전송될 수 있는 데이터. 소켓 안에 들어간다.
	//MulticastSocket: 다수의 클라이언트에게 DatagramPacket을 전송한다.
	//바로 옆에 있는 컴퓨터에 데이터를 보낼 때에 UDP를 이용한다.

	public ChatCS() {

		ta.setEditable(false);

		add(ta,BorderLayout.CENTER);
		add(tf,BorderLayout.SOUTH);
		tf.addActionListener(this);

		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});

		setTitle("그룹채팅 [" + host + "]");
		setSize(400, 400);
		setVisible(true);
		tf.requestFocus();

	}


	public void setup() {

		try {

			xGroup = InetAddress.getByName(host);
			ms = new MulticastSocket(port);

			ms.joinGroup(xGroup);

			Thread th = new Thread(this);
			th.start();

		} catch (Exception e) {

		}
	}


	public void disconnect() {

		try {

			ms.leaveGroup(xGroup);
			ms.close();

		} catch (Exception e) {
			// TODO: handle exception
		}
	}


	@Override
	public void run() {

		try {
			
			while(true) {
				
				byte[] buffer = new byte[512];
				
				DatagramPacket dp = new DatagramPacket(buffer, buffer.length);
				
				ms.receive(dp);
				
				String msg = new String(dp.getData()).trim();
				
				ta.append(msg + "\r\n");

			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
			disconnect();
		}
	}


	@Override
	public void actionPerformed(ActionEvent e) {

		String msg = tf.getText().trim();

		if(msg.equals("")) {
			return;
		}

		byte[] buffer = (userName + "]" + msg).getBytes();

		try {

			DatagramPacket dp = new DatagramPacket(buffer, buffer.length, xGroup, port);

			ms.send(dp);

			tf.setText("");
			tf.requestFocus();

		} catch (Exception e1) {
			System.out.println(e1.toString());
		}
	}


	public static void main(String[] args) {
		new ChatCS().setup();
	}
}
