package model;

import db.DBA;

public class Table {
	private String[] title= {"title1","title2"};
	private String[][] data= {{"11","12"},{"21","22"}};//,{"31","32"}
	public Table() {}
	public Table(String[] title,String[][] data) {
		this.title=title;
		this.data=data;
	}
	public String[] getTitle() {
		return title;
	}
	public void setTitle(String[] title) {
		this.title = title;
	}
	public String[][] getData() {
		return data;
	}
	public void setData(String[][] data) {
		this.data = data;
	}
	
}
