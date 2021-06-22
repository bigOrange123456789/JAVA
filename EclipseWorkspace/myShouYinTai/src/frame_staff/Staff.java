package frame_staff;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

import ui.Panel;

public class Staff extends Panel{
	JFrame frame;
	String user;
	public Staff(JFrame frame,String user){
		this.frame=frame;
		this.user=user;
		setLayout(null);
		JButton add=newButton(163,   "新建员工档案");add.setSize(600, 80);
		JButton update=newButton(263,"修改自己密码");update.setSize(600, 80);
		JButton delete=newButton(363,"删除员工档案");delete.setSize(600, 80);
		JButton select=newButton(463,"查询员工档案");select.setSize(600, 80);
		JButton button0=newButton(563,"返  回");  button0.setSize(600, 80);
		AddListener addListener=new AddListener();
		DeleteListener deleteListener=new DeleteListener();	
		UpdateListener updateListener=new UpdateListener();			
		SelectListener selectListener=new SelectListener();
		Listener0 listener0=new Listener0();
	    add.addActionListener(addListener);
	    delete.addActionListener(deleteListener);    
	    update.addActionListener(updateListener);
	    select.addActionListener(selectListener);
	    button0.addActionListener(listener0);
	    if(user.equals("1001"))add(add);
	    if(user.equals("1001"))add(delete);
		add(update);
		if(user.equals("1001"))add(select);
		add(button0);
		JLabel label=new JLabel("员工管理（管理员员工号1001）",new ImageIcon("fish01_01.png"),JLabel.CENTER);
		label.setBounds(1, 1, 300, 50);
		add(label);
	}

	private class AddListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
		    StaffAdd addFrame=new StaffAdd();
			//Frame frame=new Frame(-5,-3,1950,1050,"收银前台");
			//frame.add(createPanel);
			addFrame.setVisible(true);
		}
	}
	private class DeleteListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			StaffDelete deleteFrame=new StaffDelete();
			//Frame frame=new Frame();
			//frame.add(backstagePanel);
			deleteFrame.setVisible(true);
		}
	}
	private class UpdateListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			StaffUpdate updateFrame=new StaffUpdate(user);
			//Frame frame=new Frame();
			//frame.add(staffPanel);
			updateFrame.setVisible(true);
		}
	}
	private class SelectListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			StaffSelect.select_file1();
		}
	}
	private class Listener0 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			frame.dispose();
		}
	}

}
