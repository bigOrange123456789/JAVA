package ui;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableModel;

public class Panel extends JPanel{
	//JLabel time=new JLabel("00:00:00");
	//JButton button=new JButton("时间");//("显示时间");
	
	public JButton newButton(int x,int y,int w,int h,String name){
		JButton button=new JButton(name);
		button.setBounds(x,y,w,h);
		button.setFont(new Font("宋体", Font.PLAIN, 80));
		return button;
	} 
	public JButton newButton(int y,String name){
		int x=500,w=500,h=88;
		JButton button=new JButton(name);
		button.setBounds(x,y,w,h);
		button.setFont(new Font("宋体", Font.PLAIN, 80));
		return button;
	} 
	public Panel(){
	}
	//public void setTime(){
		//SimpleDateFormat sdf=new SimpleDateFormat();
		//String timestr=sdf.format(new Date());
		//time.setText(timestr);
	//}
	public void fun(){
		//add(jtf);
				///JPasswordField jpf=new JPasswordField(30);
				//jpf.setBounds(1, 200, 150, 100);
				//add(jpf);
				
				TableModel dm=new AbstractTableModel(){

					//成员变量
					//标题
					String[] title={"a","b","c","d","e"};
					//数据
					String[][] data={{"11","2","3","4","5"},
							         {"21","2","3","4","5"},
							         {"31","2","3","4","5"},
							         {"41","2","3","4","5"},
							         {"51","2","3","4","5"},
							         {"61","2","3","4","5"},
							         {"71","2","3","4","5"},
							         {"81","2","3","4","5"}};
					@Override
					public int getColumnCount() {
						// TODO Auto-generated method stub
						return 5;
					}

					@Override
					public int getRowCount() {
						// TODO Auto-generated method stub
						return 8;
					}

					@Override
					public Object getValueAt(int r, int c) {
						// TODO Auto-generated method stub
						 return data[r][c];
					}
					
					@Override
					public String getColumnName(int column){
						return title[column];
					}
				};
				JTable table=new JTable(dm);
				//标题
				String[] title={"a","b","c","d","e"};
				//数据
				String[][] data={{"11","2","3","4","5"},
						         {"21","2","3","4","5"},
						         {"31","2","3","4","5"},
						         {"41","2","3","4","5"},
						         {"51","2","3","4","5"},
						         {"61","2","3","4","5"},
						         {"71","2","3","4","5"},
						         {"81","2","3","4","5"}};
				JTable table2=new JTable(data,title);
				TableColumn column=table.getColumnModel().getColumn(1);
				column.setMaxWidth(3);
				//table.setSize(arg0);               
				table2.setBounds(10, 300, 120, 80);
				JScrollPane jsp=new JScrollPane(table2);
				add(jsp);
				add(table2);
	}

}
