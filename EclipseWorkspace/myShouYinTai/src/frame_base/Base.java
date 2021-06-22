package frame_base;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

import panel.BFAdd;
import panel.BFDelete;
import panel.BFSelect;
import panel.BFUpdate;
import db.DBA;

public class Base extends JFrame{
	public JButton newButton(int x,int y,int w,int h,String name){
		JButton button=new JButton(name);
		button.setBounds(x,y,w,h);
		button.setFont(new Font("宋体", Font.PLAIN, 80));
		return button;
	} 
	public JButton newButton(int y,String name){
		int x=500,w=500,h=80;
		JButton button=new JButton(name);
		button.setBounds(x,y,w,h);
		button.setFont(new Font("宋体", Font.PLAIN, 80));
		return button;
	} 
	public Base(){
		setTitle("库存管理");
		int x,y,w,h;
		x=-10;
		y=0;
		w=1800;
		h=900;
		setLocation(x,y);
		setSize(w, h);
		setLayout(null);
		JButton add=newButton(163,"入库");
		JButton delete=newButton(263,"出库");
		JButton select=newButton(363,"查询库存");
		JButton button0=newButton(463,"返  回");
		AddListener addListener=new AddListener();
		DeleteListener deleteListener=new DeleteListener();			
		SelectListener selectListener=new SelectListener();
		Listener0 listener0=new Listener0();
	    add.addActionListener(addListener);
	    delete.addActionListener(deleteListener);  
	    select.addActionListener(selectListener);
	    button0.addActionListener(listener0);
	    add(add);
		add(delete);
		add(select); 
		add(button0);
		JLabel label=new JLabel("库存管理",new ImageIcon("fish01_01.png"),JLabel.CENTER);
		label.setBounds(1, 1, 150, 50);
		add(label);
	}

	private class AddListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			BaseAdd add=new BaseAdd();
			add.setVisible(true);
		}
	}
	private class DeleteListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			BaseDelete delete=new BaseDelete();
			delete.setVisible(true);
		}
	}
	private class SelectListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			BaseSelect.select_file1();
		}
	}
	private class Listener0 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			dispose();
		}
	}

}
