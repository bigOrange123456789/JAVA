package frame_staff;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import db.DBA;
import panel.BFAdd;

public class StaffAdd extends JFrame{//注意：这是frame不是panel
	JLabel lable1,lable2,lable3,lable4;
	JTextField textField1=new JTextField();
	JTextField textField2=new JTextField(16);;
	JTextField textField3=new JTextField(16);
	JTextField textField4=new JTextField(16);
	JButton button;
	void initLable(JLabel lable,String name,int x,int y){
		lable=new JLabel(name);
		lable.setBounds(x, y, 200, 50);
		lable.setFont(new Font("宋体", Font.PLAIN, 30));
		add(lable);
	}
	void initField(JTextField textField,int x,int y){
		//textField=new JTextField(16);
		textField.setBounds(x, y, 600, 80);
		textField.setFont(new Font("宋体", Font.PLAIN, 75));
		add(textField);
	}
	public StaffAdd(){
		setLayout(null);
		setSize(1000,700);
		
		
		initLable(lable1,"员工编号",50,10);
		initLable(lable2,"初始密码",50,110);
		//initLable(lable3,"价格",50,210);
		//initLable(lable4,"单位",50,310);
		initField(textField1,300,10);
		initField(textField2,300,110);
		//initField(textField3,200,210);
		//initField(textField4,200,310);
		

		button=new JButton("下一个");
		button.setBounds(200,400, 200, 80);
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
			//DBA.insert_file1(textField1.getText(),textField2.getText(),textField3.getText(),textField4.getText());
			DBA.insert_file2(textField1.getText(),textField2.getText());
			new StaffAdd();
			dispose();
		}
	}
	

}
