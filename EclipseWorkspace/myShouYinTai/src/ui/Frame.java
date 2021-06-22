package ui;

import javax.swing.JFrame;

public class Frame extends JFrame{
	int x,y,w,h;
	public Frame(){
		x=-10;
		y=0;
		w=1600;
		h=800;
		setLocation(x,y);
		setSize(w, h);
		setTitle(" ’“¯Ã®");
	}
	public Frame(int x,int y,int w,int h,String title){
		setLocation(x,y);
		setSize(w, h);
		setTitle(title);
	}

}
