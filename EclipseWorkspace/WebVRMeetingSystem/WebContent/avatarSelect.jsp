<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- <!DOCTYPE html> -->
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
<!--  <meta charset="UTF-8">-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>化身选择</title>
</head>
<body>
<script>
//窗体
function document_color(color){//窗体颜色设置
	document.body.style.background=color;
}
//div面板
//function div(width,height){}
function div(width,height){
	var oPanel=document.createElement('div');
	oPanel.style.cssText='width:300px;'+
	   'background:#01f;'+//背景颜色
	   'width:'+width+'px;height:'+height+'px;'+//面板大小
	   'border:10px solid #fff;'+//显示边框
	   'margin:50px auto;'+//居于窗口中间
	   'text-align:center;'+//内部文本居中
	   'position:relative;'+
	   'overflow:hidden;';//超出部分隐藏
	document.body.appendChild(oPanel);//document.body浏览器窗口	
	return oPanel;
}
//文本
/*function h1(html,color,size,parentNode){
	var oText=document.createElement('h1');
	oText.innerHTML=html;
	oText.style.cssText='color:'+color+';'+//文字颜色
						'background:#aff;'+//背景颜色
						'font-size:'+size+'px;'+//文字大小
						//'width:60px;height:40px;'+//文本大小
						'font-weight:normal;'
						//+'padding-top:50px;'//距离上一个对象的距离
						'left:'+(-10)+'px;'+//到部件左边距离
					  'top:'+(-10)+'px;'; //到部件右边 距离
						;
	parentNode.appendChild(oText);
	return oText;
}*/
function h1(html,color,size,parentNode){
	var oText=document.createElement('h1');
	oText.innerHTML=html;
	oText.style.cssText='color:'+color+';'+//文字颜色
						//'background:#aff;'+//背景颜色
						'font-size:'+size+'px;'+//文字大小
						//'width:60px;height:40px;'+//文本大小
						'font-weight:normal;'
						//+'padding-top:50px;'//距离上一个对象的距离
						'left:'+(-10)+'px;'+//到部件左边距离
					  'top:'+(-10)+'px;'; //到部件右边 距离
						;
	parentNode.appendChild(oText);
	return oText;
}
function span(html,color,size,parentNode){
	var oText=document.createElement('span');
	oText.innerHTML=html;
	oText.style.cssText='position:absolute;'+
						'color:'+color+';'+//文字颜色
						//'background:#aff;'+//背景颜色
						'font-size:'+size+'px;'+//文字大小size
						//'width:60px;height:40px;'+//文本大小
						'font-weight:normal;'
						//+'padding-top:50px;'//距离上一个对象的距离
						//'left:'+(-50)+'px;'+//到部件左边距离
					  //'top:'+(0)+'px;'; //到部件右边 距离
						;
	parentNode.appendChild(oText);
	return oText;
}
//按钮
function p(html,color,background,size,width,height,parentNode){
	var oButton=document.createElement('p');//按钮
	oButton.innerHTML=html;
	oButton.style.cssText='font-size:'+size+'px;'//字体大小
					+'width:'+width+'px;height:'+height+'px;'//按钮大小
					+'color:'+color+';'//字体颜色
					+'background:'+background+';'//按钮颜色
					+'margin:20px auto;'
					+'text-align:center;'
					+'line-height:40px;'
					//+'cursor:pointer;'
	parentNode.appendChild(oButton);
	return oButton;
}
//图片
function image(src,w,h,x,y,parent){
	var img=new Image();
	img.src=src;
	img.width=w;
	img.height=h;
	img.style.cssText='display:block;'+
					  'position:absolute;'+//位置可变  
		  			  'left:'+x+'px;'+//到部件左边距离
					  'top:'+y+'px;'; //到部件右边 距离
	parent.appendChild(img);
	return img;
}
</script>
<script>//构造函数
function Div(width,height){//面板
	this.panel=div(width,height);//div(width,height);
	this.w=width;
	this.h=height;
	//this.x=this.panel.offsetLeft;
	//this.y=this.panel.offsetTop; 
	this.border=this.panel.style.borderWidth;
	this.getX=function(){
		return this.panel.offsetLeft;
	}
	this.getY=function(){
		return this.y=this.panel.offsetTop; 
	}
}
/*function H1(html,color,size,parentNode){//文本
	this.html=html;this.color=color;this.size=size;
	this.oText=h1(html,color,size,parentNode);
	this.reText=function(text){
		this.text=text;
		this.oText=h1(html,color,size,parentNode);
	}	
}*/
function H1(html,color,size,parentNode){//文本
	this.html=html;this.color=color;this.size=size;
	this.oText=h1(html,color,size,parentNode);
	this.reText=function(text){
		this.text=text;
		this.oText=h1(html,color,size,parentNode);
	}	
}
function Span(html,color,size,parentNode){//文本
	this.html=html;this.color=color;this.size=size;
	this.span=span(html,color,size,parentNode);
	this.reHtml=function(text){
		this.html=text;
		this.span.innerHTML=text;
	}	
}
function ImageMove(src,w,h,x,y,parent){//添加的是image对象，而不是ImageMove对象
	this.w=w;
	this.h=h;
	this.x=x;//在parent中的位置
	this.y=y;//在parent中的位置
	this.img=image(src,w,h,x,y,parent);
	this.reImg=function(resrc){
		//alert(src);
		this.img.parentNode.removeChild(this.img);
		this.img=image(resrc,w,h,x,y,parent);
		//this.img.src='img/death/sj.png';
	}
	this.up=function(){
		this.up(1);
	}
	this.up=function(n){
		this.y-=n;
		this.img.style.top=this.y+'px';
	}
	this.down=function(){
		this.down(1);
	}
	this.down=function(n){
		this.up(-n);
	}
	this.left=function(n){
		this.x-=n;
		this.img.style.left=this.x+'px';
	}
	this.right=function(n){
		this.left(-n);
	}
	this.setXY=function(x,y){
		this.x=x;
		this.y=y;
		this.img.style.left=x+'px';
		this.img.style.top=y+'px';
	}
	this.setScale=function(w,h){
		this.w=w;
		this.h=h;
		this.img.width=w;
		this.img.height=h;
	}
	this.pointOnImg=function(x,y){
		if(x>this.x&&x<this.x+this.w
				&&y>this.y&&y<this.y+this.h)
				return true;
		else return false;
	}
};
</script>
<script>
document_color('#0a0');//窗体
var oPanel=new Div(1200,700);//div面板
var oText1=new H1('请选择您的虚拟化身!','#e00',50,oPanel.panel);

var avatar0=new ImageMove('avatarSelect/avatar0.png',oPanel.w/5.5,oPanel.h/2,oPanel.w/2-oPanel.w/5.5/2,oPanel.h/4,oPanel.panel);
var add1=new ImageMove('avatarSelect/add.png',       oPanel.h/7,oPanel.h/7,  oPanel.w/4.5,oPanel.h/2.5,oPanel.panel);
var add2=new ImageMove('avatarSelect/add.png',       oPanel.h/7,oPanel.h/7,  oPanel.w/1.5,oPanel.h/2.5,oPanel.panel);
var back=new ImageMove('avatarSelect/back.png',      oPanel.h/11,oPanel.h/11,oPanel.w/25,oPanel.h/19,oPanel.panel);
var card=new ImageMove('avatarSelect/card.png',      oPanel.h/11,oPanel.h/11,oPanel.w/2-oPanel.h/11/2,oPanel.h/6.5,oPanel.panel);
var determine=new ImageMove('avatarSelect/determine.png',oPanel.h/5,oPanel.h/11,oPanel.w/2-oPanel.h/5/2,oPanel.h-oPanel.h/10,oPanel.panel);
var panel0=new ImageMove('avatarSelect/panel.png',0,0,oPanel.w/2-oPanel.w/4/2,oPanel.h/3,oPanel.panel);
var roomJoin=new ImageMove('avatarSelect/roomJoin.png',0,0,oPanel.w/2-oPanel.w/4/2+20,oPanel.h/3+50,oPanel.panel);
var roomCreate=new ImageMove('avatarSelect/roomCreate.png',0,0,oPanel.w/2-oPanel.w/4/2+30+oPanel.w/10,oPanel.h/3+50,oPanel.panel);
window.onload=function(){
	    var o_btn=document.getElementById("button0");
	    back.addEventListener("click",function(){
	    		alert("验证码已发送，请注意查收！")
	    			   },false)
}  
document.body.onmouseup=function(e){
	var x=e.pageX
		-oPanel.getX()
		-parseInt(oPanel.border);//边框宽度
	var y=e.pageY
		-oPanel.getY()
		-parseInt(oPanel.border);//height
	if(!panel0.pointOnImg(x,y)){
		panel0.setScale(0,0);
		roomJoin.setScale(0,0);
		roomCreate.setScale(0,0);
	}
		
	if(roomJoin.pointOnImg(x,y))window.location.href='roomJoin.jsp';
	else if(roomCreate.pointOnImg(x,y))window.location.href='roomCreate.jsp';
	else if(panel0.pointOnImg(x,y));//点到空白窗口
	else if(back.pointOnImg(x,y))window.location.href='welcome.jsp';
	else if(card.pointOnImg(x,y))window.location.href='card.jsp';
	else if(determine.pointOnImg(x,y)){
		panel0.setScale(oPanel.w/4,oPanel.h/4);
		roomJoin.setScale(oPanel.w/10,oPanel.h/10);
		roomCreate.setScale(oPanel.w/10,oPanel.h/10);
	}else if(avatar0.pointOnImg(x,y)||add1.pointOnImg(x,y)||add2.pointOnImg(x,y))window.location.href='avatarEdit.jsp';
		
};
</script>
</body>