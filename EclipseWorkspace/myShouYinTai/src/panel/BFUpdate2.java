package panel;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import db.DBA;
import db.select;

public class BFUpdate2 extends JFrame{//注意：这是frame不是panel
	public JLabel lable1,lable2,lable3,lable4;
	JTextField textField1=new JTextField();
	JTextField textField2=new JTextField(16);;
	JTextField textField3=new JTextField(16);
	JTextField textField4=new JTextField(16);
	//JButton button1=new JButton("修改条码");
	JButton button2=new JButton("修改名称");
	JButton button3=new JButton("修改价格");
	JButton button4=new JButton("修改单位");
	JButton button0=new JButton("返回");
	public String id;
	public void initLable(JLabel lable,String name,int x,int y){
		lable=new JLabel(name);
		lable.setBounds(x, y, 400, 50);
		lable.setFont(new Font("宋体", Font.PLAIN, 30));
		add(lable);
	}
	void initField(JTextField textField,int x,int y){
		//textField=new JTextField(16);
		textField.setBounds(x, y,400, 70);
		textField.setFont(new Font("宋体", Font.PLAIN, 65));
		add(textField);
	}
	void initButton(JButton button,int x,int y){
		button.setBounds(x, y,200, 70);
		button.setFont(new Font("宋体", Font.PLAIN, 35));
		add(button);
	}
	public BFUpdate2(String id){
		this.id=id;
		setLayout(null);
		setSize(2000,800);
		
		select.select_BFUpdate2(this);
		//initField(textField1,400,10);
		initField(textField2,400,110);
		initField(textField3,400,210);
		initField(textField4,400,310);
		
		//initButton(button1,900,10);
		initButton(button2,900,110);
		initButton(button3,900,210);
		initButton(button4,900,310);
		initButton(button0,800,410);
		
		//按钮点击处理
		Listener1 listener1=new Listener1();
		Listener2 listener2=new Listener2();
		Listener3 listener3=new Listener3();
		Listener4 listener4=new Listener4();
		Listener0 listener0=new Listener0();
		//button1.addActionListener(listener1);
		button2.addActionListener(listener2);
		button3.addActionListener(listener3);
		button4.addActionListener(listener4);
		button0.addActionListener(listener0);
		
		//add(button1);
		setVisible(true);
	}
	private class Listener1 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			DBA.updata_file1(id,1,textField1.getText());
			new BFUpdate2(id);
			dispose();
		}
	}
	private class Listener2 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			DBA.updata_file1(id,2,textField2.getText());
			new BFUpdate2(id);
			dispose();
		}
	}
	private class Listener3 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			DBA.updata_file1(id,3,textField3.getText());
			new BFUpdate2(id);
			dispose();
		}
	}
	private class Listener4 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			DBA.updata_file1(id,4,textField4.getText());
			new BFUpdate2(id);
			dispose();
		}
	}
	private class Listener0 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			dispose();
		}
	}

}
