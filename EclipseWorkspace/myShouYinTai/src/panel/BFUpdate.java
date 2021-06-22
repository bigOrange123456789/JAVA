package panel;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import db.DBA;


public class BFUpdate extends JFrame{
	JLabel lable;
	JTextField textField=new JTextField();
	JButton button;
	void initLable(JLabel lable,String name,int x,int y){
		lable=new JLabel(name);
		lable.setBounds(x, y, 400, 50);
		lable.setFont(new Font("����", Font.PLAIN, 30));
		add(lable);
	}
	void initField(JTextField textField,int x,int y){
		textField.setBounds(x, y, 600, 80);
		textField.setFont(new Font("����", Font.PLAIN, 75));
		add(textField);
	}	
	public BFUpdate(){
		setTitle("�޸ĵ���");
		setLayout(null);
		setSize(1000,500);
		setLocation(250,50);
		initLable(lable,"���޸ĵ����������룺",10,50);
		initField(textField,200,300-200);

		button=new JButton("ȷ��");
		button.setBounds(200,250, 200, 80);
		button.setFont(new Font("����", Font.PLAIN, 35));
		
		//��ť�������
		Listener listener=new Listener();
		button.addActionListener(listener);
		add(button);
		setVisible(true);
	}
	private class Listener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			new BFUpdate();
			new BFUpdate2(textField.getText());
			dispose();
		}
	}
}
