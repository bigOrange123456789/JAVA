package frame_reception;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;

import db.select;
import panel.BFUpdate;
import panel.BFUpdate2;

public class Reception extends JFrame{
	int n=0;
	double money=0.0;
	String[][] data=new String[1][5];
	String[] row=new String[5];
	JLabel lable1,lable2;
	JTextField textField1=new JTextField();
	JTextField textField2=new JTextField("1");
	JButton button1=new JButton("确定");
	JButton button2=new JButton("撤销");
	JButton button3=new JButton("返回");
	JButton button0=new JButton("结账");
	void initLable(JLabel lable,String name,int x,int y){
		lable=new JLabel(name);
		lable.setBounds(x, y, 400, 50);
		lable.setFont(new Font("宋体", Font.PLAIN, 30));
		add(lable);
	}
	void initField(JTextField textField,int x,int y){
		textField.setBounds(x, y, 600, 80);
		textField.setFont(new Font("宋体", Font.PLAIN, 55));
		add(textField);
	}
	void initButton(JButton button,int x,int y){
		button.setBounds(x, y, 200, 80);
		button.setFont(new Font("宋体", Font.PLAIN, 35));
		add(button);
	}
	void initThis(){
		setLayout(null);
		setSize(1500,800);
		setLocation(-10,-35);
		initLable(lable1,"条形码：",50,650-100-100);
		initLable(lable2,"数  量：",50,750-100-100);
		initField(textField1,200,650-100-100);
		initField(textField2,200,750-100-100);
		initButton(button1,  810,650-100-100);
		initButton(button2,  810,750-100-100);
		initButton(button3,  810,850-100-100);button3.setSize(200, 80);
		initButton(button0,  200,850-100-100);button0.setSize(600, 80);
		initJSP();
		//按钮点击处理
		Listener1 listener1=new Listener1();
		button1.addActionListener(listener1);
		Listener2 listener2=new Listener2();
		button2.addActionListener(listener2);
		Listener3 listener3=new Listener3();
		button3.addActionListener(listener3);
		Listener0 listener0=new Listener0();
		button0.addActionListener(listener0);
		
		setVisible(true);
	}
	public Reception(){
		initThis();
	}
	public Reception(String[][] data,int n,double money){
		this.data=data;
		this.n=n;
		this.money=money;
		initThis();
	}
	public String[][] data_add(String[][] data0){//String[] row,,int n
		String[][] data=new String[n+1][5];
		for(int i=0;i<n;i++)
			for(int j=0;j<5;j++)
				data[i][j]=data0[i][j];
		for(int i=0;i<5;i++)
			data[n][i]=row[i];
		n++;
		return data;
	}
	void initJSP(){
		String[] title={"条形码","商品名","价格","单位","数量"};
		JTable table=new JTable(data,title);
		table.setRowHeight(40);
		table.setFont(new Font("宋体", Font.PLAIN, 35));	    
		JScrollPane jsp=new JScrollPane(table);//jsp是面板
		jsp.setSize(1400, 400);
		jsp.setLocation(10, 10);
		//jsp.set
		add(jsp);
		
	}
	private class Listener1 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			String text2=textField2.getText();
			row=select.s(textField1.getText(),text2);
			row[4]=text2;
			data=data_add(data);
			money=money+Double.parseDouble(row[2])*Double.parseDouble(row[4]);
			new Reception(data,n,money);
			dispose();
		}
	}
	private class Listener2 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			select.s(data[n-1][0],"-"+data[n-1][4]);
			n--;
			String[][] s2=new String[n][5];
			for(int i=0;i<n;i++)
				for(int j=0;j<5;j++)
					s2[i][j]=data[i][j];
			money=money-Double.parseDouble(data[n][2])*Double.parseDouble(data[n][4]);
			data=s2;
			new Reception(data,n,money);
			dispose();
		}
	}
	private class Listener3 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			dispose();
		}
	}	
	private class Listener0 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			new Reception();
			new Bill(money);
			dispose();
		}
	}
}
