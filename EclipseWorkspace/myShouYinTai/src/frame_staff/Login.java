package frame_staff;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import db.DBA;
import ui.Frame;
import ui.StartPanel;

public class Login extends JFrame{//注意：这是frame不是panel
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
	public Login(){
		setTitle("登录");
		setLayout(null);
		setSize(1000,500);
		setLocation(100, 100);
		
		
		initLable(lable1,"员工工号",50,10+50);
		initLable(lable2,"员工密码",50,110+50);
		//initLable(lable3,"价格",50,210);
		//initLable(lable4,"单位",50,310);
		initField(textField1,300,10+50);
		initField(textField2,300,110+50);
		//initField(textField3,200,210);
		//initField(textField4,200,310);
		

		button=new JButton("确定");
		button.setBounds(300,210+50, 250, 80);
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
			String[][] s=DBA.selectPSW(textField1.getText());
			//DBA.insert_file2(textField1.getText(),textField2.getText());
			if(s[0][1].equals(textField2.getText())){
				start2(textField1.getText());	
			}else new Login();	
			dispose();
		}
	}
	private static void start2(String user) {
		Frame frame=new Frame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		StartPanel startPanel=new StartPanel(user);
		frame.add(startPanel);
		frame.setVisible(true);
	}
	

}
