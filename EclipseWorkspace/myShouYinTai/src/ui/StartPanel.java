package ui;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.event.TableModelListener;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableModel;

import frame_reception.Reception;
import frame_staff.Staff;


public class StartPanel extends Panel{
	String user;
	public StartPanel(String user){
		this.user=user;
		setLayout(null);
		JButton reception=newButton(163,"ǰ̨");
		JButton backstage=newButton(263,"��̨");
		JButton staff=newButton(363,"Ա������");
		JButton help=newButton(463,"����");
		ReceptionListener receptionListener=new ReceptionListener();
		BackstageListener backstageListener=new BackstageListener();
		StaffListener staffListener=new StaffListener();
		HelpListener helpListener=new HelpListener();
	    reception.addActionListener(receptionListener);
	    backstage.addActionListener(backstageListener);
	    staff.addActionListener(staffListener);
	    help.addActionListener(helpListener);
	    add(reception);
		add(backstage);
		add(staff);
		add(help);
		//JLabel label=new JLabel("���ǳ���",new ImageIcon("fish01_01.png"),JLabel.CENTER);
		//label.setBounds(1, 1, 150, 50);
		//add(label);
		setLayout(new GridLayout(2,2));
		JTextField jtf=new JTextField(5);
		jtf.setBounds(1, 100, 150, 100);
		//setLocation(0, 0);
	}
	private class ReceptionListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			ReceptionPanel receptionPanel=new ReceptionPanel();
			Reception frame=new Reception();
			//Frame frame=new Frame(-5,-3,1950,1050,"����ǰ̨");
			//frame.add(receptionPanel);
			frame.setVisible(true);
		}
	}
	private class BackstageListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			Frame frame=new Frame();
			BackstagePanel backstagePanel=new BackstagePanel(frame);
			frame.add(backstagePanel);
			frame.setVisible(true);
		}
	}
	private class StaffListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			Frame frame=new Frame();
			Staff staffPanel=new Staff(frame,user);
			frame.add(staffPanel);
			frame.setVisible(true);
		}
	}
	private class HelpListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			HelpPanel helpPanel=new HelpPanel();
			Frame frame=new Frame();
			frame.add(helpPanel);
			frame.setVisible(true);
		}
	}

}
