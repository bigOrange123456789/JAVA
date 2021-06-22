package panel;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import ui.Frame;
import ui.Panel;
import ui.ReceptionPanel;

import db.DBA;

public class BFAdd extends JFrame{//ע�⣺����frame����panel
	JLabel lable1,lable2,lable3,lable4;
	JTextField textField1=new JTextField();
	JTextField textField2=new JTextField(16);;
	JTextField textField3=new JTextField(16);
	JTextField textField4=new JTextField(16);
	JButton button;
	void initLable(JLabel lable,String name,int x,int y){
		lable=new JLabel(name);
		lable.setBounds(x, y, 100, 50);
		lable.setFont(new Font("����", Font.PLAIN, 30));
		add(lable);
	}
	void initField(JTextField textField,int x,int y){
		//textField=new JTextField(16);
		textField.setBounds(x, y, 600, 80);
		textField.setFont(new Font("����", Font.PLAIN, 75));
		add(textField);
	}
	public BFAdd(){
		setTitle("�½�����");
		setLayout(null);
		setSize(1000,700);
		
		
		initLable(lable1,"������",50,10);
		initLable(lable2,"����",50,110);
		initLable(lable3,"�۸�",50,210);
		initLable(lable4,"��λ",50,310);
		initField(textField1,200,10);
		initField(textField2,200,110);
		initField(textField3,200,210);
		initField(textField4,200,310);
		

		button=new JButton("��һ��");
		button.setBounds(200,400, 200, 80);
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
			DBA.insert_file1(textField1.getText(),textField2.getText(),textField3.getText(),textField4.getText());
			new BFAdd();
			dispose();
		}
	}
	

}
