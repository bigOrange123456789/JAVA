package frame_base;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import db.DBA_BASE;

public class BaseDelete extends JFrame{
	JLabel lable1,lable2;
	JTextField textField1=new JTextField();
	JTextField textField2=new JTextField(16);
	JButton button;
	void initLable(JLabel lable,String name,int x,int y){
		lable=new JLabel(name);
		lable.setBounds(x, y, 100, 50);
		lable.setFont(new Font("宋体", Font.PLAIN, 30));
		add(lable);
	}
	void initField(JTextField textField,int x,int y){
		//textField=new JTextField(16);
		textField.setBounds(x, y, 600, 80);
		textField.setFont(new Font("宋体", Font.PLAIN, 75));
		add(textField);
	}
	public BaseDelete(){
		setTitle("出库");
		setLayout(null);
		setSize(1000,700);
		
		
		initLable(lable1,"条形码",50,10);
		initLable(lable2,"出库量",50,110);
		initField(textField1,200,10);
		initField(textField2,200,110);
		

		button=new JButton("下一个");
		button.setBounds(200,300, 200, 80);
		button.setFont(new Font("宋体", Font.PLAIN, 35));
		
		
		
		//按钮点击处理
		Listener listener=new Listener();
		button.addActionListener(listener);
		
		add(button);
		setVisible(true);
	}
	private class Listener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			DBA_BASE.addBase_file1(textField1.getText(),"-"+textField2.getText());
			new BaseAdd();
			dispose();
		}
	}
	

}
