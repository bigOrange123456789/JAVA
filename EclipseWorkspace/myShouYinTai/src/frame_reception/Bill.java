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

public class Bill extends JFrame{
	double money;
	JLabel lable1,lable2,lable3;
	JTextField textField=new JTextField();
	JButton button;
	void initLable(JLabel lable,String name,int x,int y){
		lable=new JLabel(name);
		lable.setBounds(x, y, 400, 100);
		lable.setFont(new Font("宋体", Font.PLAIN, 70));
		add(lable);
	}
	void initField(JTextField textField,int x,int y){
		textField.setBounds(x, y, 300, 80);
		textField.setFont(new Font("宋体", Font.PLAIN, 75));
		add(textField);
	}	
	public Bill(double money){
		this.money=money;
		setLayout(null);
		setSize(750,650);
		setLocation(300,50);
		initLable(lable1,"应收金额：",10,150);
		initLable(lable2,""+money,400,150);
		initLable(lable3,"实收金额：",10,300);
		initField(textField,350,310);

		button=new JButton("确定");
		button.setBounds(200,450, 500,130);
		button.setFont(new Font("宋体", Font.PLAIN, 45));
		
		//按钮点击处理
		Listener listener=new Listener();
		button.addActionListener(listener);
		add(button);
		setVisible(true);
	}
	private class Listener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			new Bill2(Double.parseDouble(textField.getText())-money);
			dispose();
		}
	}
}
