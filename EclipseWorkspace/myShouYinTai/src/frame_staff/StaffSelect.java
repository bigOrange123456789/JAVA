package frame_staff;

import java.awt.BorderLayout;
import java.awt.Font;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import db.DBA;

public class StaffSelect{
	public static void select_file1(){
		//����
		String[] title={"Ա�����","Ա������"};
		//����
		String[][] data=DBA.selectAll_file2();
		TS(title, data);
	}
	public static void TS(String[] title,String[][] data){
		JPanel panel=new JPanel();
		JFrame frame=new JFrame();
		frame.setSize(700, 800);
		//1׼������model
		DefaultTableModel tableModel=new DefaultTableModel();
		
		//2view
		JTable table=new JTable(tableModel);
		//
		panel.setLayout(new BorderLayout());
		//3���б�ŵ�Scroll Pane����		
		JScrollPane scrollPane=new JScrollPane(table);
		table.setFillsViewportHeight(true);
		table.setRowSelectionAllowed(true);
		table.setFont(new Font("����", Font.PLAIN,30));
		table.setRowHeight(31);
		//4���
		panel.add(scrollPane,BorderLayout.CENTER);
		//
		for(int i=0;i<title.length;i++)
			tableModel.addColumn(title[i]);
		for(int i=0;i<data.length;i++){
			Vector<Object>rowData=new Vector<>();
			for(int j=0;j<title.length;j++)
		       rowData.add(data[i][j]);
		    tableModel.addRow(rowData);
		}
		frame.add(panel);
		frame.setVisible(true);

	}
}
