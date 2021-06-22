package panel;
import db.DBA;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

import ui.Frame;
import ui.Panel;
import ui.ReceptionPanel;

public class BFile extends Panel{
	JFrame frame;
	public BFile(JFrame frame){
		this.frame=frame;
		setLayout(null);
		JButton add=newButton(163,"新建档案");
		JButton update=newButton(263,"修改档案");
		JButton delete=newButton(363,"删除档案");
		JButton select=newButton(463,"查询档案");
		JButton button0=newButton(563,"返  回");
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
	    add(add);
		add(delete);
		add(update);
		add(select);
		add(button0);
		JLabel label=new JLabel("洪亚超市",new ImageIcon("fish01_01.png"),JLabel.CENTER);
		label.setBounds(1, 1, 150, 50);
		add(label);
	}

	private class AddListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			BFAdd addFrame=new BFAdd();
			//Frame frame=new Frame(-5,-3,1950,1050,"收银前台");
			//frame.add(createPanel);
			addFrame.setVisible(true);
		}
	}
	private class DeleteListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			BFDelete deleteFrame=new BFDelete();
			//Frame frame=new Frame();
			//frame.add(backstagePanel);
			deleteFrame.setVisible(true);
		}
	}
	private class UpdateListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			BFUpdate updateFrame=new BFUpdate();
			//Frame frame=new Frame();
			//frame.add(staffPanel);
			updateFrame.setVisible(true);
		}
	}
	private class SelectListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			BFSelect.select_file1();
		}
	}
	private class Listener0 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			frame.dispose();
		}
	}

}
