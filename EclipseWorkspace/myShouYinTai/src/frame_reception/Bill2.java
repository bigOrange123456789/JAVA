package frame_reception;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import panel.BFUpdate;
import panel.BFUpdate2;

public class Bill2 extends JFrame{
	JButton button;
	public Bill2(double d){
		setLayout(null);
		int w=800,h=300;
		setSize(w,h);
		//setLocation(450,100);
		setLocation(300,50);
		button=new JButton("找零："+d+" 元");
		button.setBounds(0,0,w,h);
		button.setFont(new Font("宋体", Font.PLAIN, 100));
		
		//按钮点击处理
		Listener listener=new Listener();
		button.addActionListener(listener);
		add(button);
		setVisible(true);
	}
	private class Listener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			dispose();
		}
	}
}

