package frame_base;

import java.awt.BorderLayout;
import java.awt.Font;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import db.DBA;

public class BaseSelect {
	public static void select_file1(){
		//标题
		String[] title={"条形码","名称","库存"};
		//数据
		String[][] data=DBA.selectAll_file1();
		TS(title, data);
	}
	public static void TS(String[] title,String[][] data0){
		String[][] data=new String[data0.length][3];
		for(int i=0;i<data0.length;i++){
			data[i][0]=data0[i][0];
			data[i][1]=data0[i][1];
			data[i][2]=data0[i][4];
		}
		JPanel panel=new JPanel();
		JFrame frame=new JFrame();
		frame.setSize(700, 800);
		//1准备数据model
		DefaultTableModel tableModel=new DefaultTableModel();
		
		//2view
		JTable table=new JTable(tableModel);
		//
		panel.setLayout(new BorderLayout());
		//3把列表放到Scroll Pane里面		
		JScrollPane scrollPane=new JScrollPane(table);
		table.setFillsViewportHeight(true);
		table.setRowSelectionAllowed(true);
		table.setFont(new Font("宋体", Font.PLAIN,30));
		table.setRowHeight(31);
		//4添加
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
