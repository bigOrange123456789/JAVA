package ui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;




import frame_base.Base;
import panel.BFile;

public class BackstagePanel extends Panel{
	JFrame frame;
	public BackstagePanel(JFrame frame){
		this.frame=frame;
		setLayout(null);
		JButton file=newButton(200,"档案管理");
		JButton base=newButton(300,"库存管理");
		JButton button0=newButton(400,"返  回");
		
		FileListener fileListener=new FileListener();
		BaseListener baseListener=new BaseListener();
		Listener0 Listener0=new Listener0();
	    file.addActionListener(fileListener);
	    base.addActionListener(baseListener);
	    button0.addActionListener(Listener0);
	    add(file);
		add(base);
		add(button0);
		JLabel label=new JLabel("超市后台",new ImageIcon("fish01_01.png"),JLabel.CENTER);
		label.setBounds(1, 1, 200, 100);
		add(label);
	}

	private class FileListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			Frame frame=new Frame(-5,-3,1950,1050,"文件管理");
			BFile filePanel=new BFile(frame);
			frame.add(filePanel);
			frame.setVisible(true);
		}
	}
	private class BaseListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			Base base=new Base();
			base.setVisible(true);
		}
	}
	private class Listener0 implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e){
			frame.dispose();
		}
	}

}
