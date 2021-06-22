<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- <!DOCTYPE html> -->
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
<!--  <meta charset="UTF-8">-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>三国战记</title>
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
function h1(html,color,size,parentNode){
	var oText=document.createElement('h1');
	oText.innerHTML=html;
	oText.style.cssText='color:'+color+';'+//文字颜色
						'background:#aff;'+//背景颜色
						'font-size:'+size+'px;'+//文字大小
						//'width:60px;height:40px;'+//文本大小
						'font-weight:normal;'
						//+'padding-top:50px;'//距离上一个对象的距离
						//'left:'+(-10)+'px;'+//到部件左边距离
					    //'top:'+(-10)+'px;'; //到部件右边 距离
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
	this.x=this.panel.offsetLeft;
	this.y=this.panel.offsetTop; 
	this.border=this.panel.style.borderWidth;
}
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
function Zhao(parent,hp0){//添加的是image对象，而不是ImageMove对象
	this.hp=hp0;
	this.direction=2;//1代表左  2代表右
	this.attack=0;   //0表示没有袭击
	this.stand=function(){
		this.attack=0; 
		if(this.direction==1)this.img.src='threeCountryImg/zhao/left/stand/1.png';
		else this.img.src='threeCountryImg/zhao/right/stand/1.png';	
	}
	this.w=100;
	this.h=50;
	this.x=120;//在parent中的位置
	this.y=90;//在parent中的位置
	this.img=image('threeCountryImg/zhao/right/stand/1.png',this.w,this.h,this.x,this.y,parent);
	this.cartoon=1;//行走的动画有5张图片
	this.move=function(){
		this.attack=0;
		this.cartoon++;
		if(this.cartoon==5)this.cartoon=1;
		if(this.direction==1)this.img.src='threeCountryImg/zhao/left/move/'+this.cartoon+'.png';
		else this.img.src='threeCountryImg/zhao/right/move/'+this.cartoon+'.png';
	}
	this.up=function(n){
		this.move();
		this.setY(this.y-n);
	}
	this.down=function(n){
		this.move();
		this.setY(this.y+n);
	}
	this.left=function(n){
		this.direction=1;
		this.move();
		this.setX(this.x-n);
	}
	this.right=function(n){
		this.direction=2;
		this.move();
		this.setX(this.x+n);
	}
	this.setX=function(x){
		this.x=x;
		this.img.style.left=x+'px';
	}
	this.setY=function(y){
		this.y=y;
		this.img.style.top=y+'px';
	}
	this.cartoonAttack1=1;//attack1的动画
	this.attack1=function(){
		this.attack=1;
		this.img.src='threeCountryImg/zhao/'+(this.direction>1?'right':'left')+'/attack1/'+this.cartoonAttack1+'.png';
		this.cartoonAttack1++;
		if(this.cartoonAttack1==4)this.cartoonAttack1=1;
	}
	this.attack2=function(){
		this.attack=2;
		this.img.src='threeCountryImg/zhao/'+(this.direction>1?'right':'left')+'/attack2/1.png';
		this.cartoonAttack1=1;
	}
	this.attack3=function(){
		this.attack=2;
		this.img.src='threeCountryImg/zhao/'+(this.direction>1?'right':'left')+'/attack3/1.png';
		this.cartoonAttack1=1;
	}
	//this.hp=1000;
	this.reHp=function(hp){
		this.hp=hp;
	}
};
function Lv(parent,hp0){//添加的是image对象，而不是ImageMove对象
	this.hp=hp0;
	this.direction=1;//1代表左  2代表右
	this.attack=0;   //0表示没有袭击
	this.stand=function(){
		this.attack=0; 
		if(this.direction==1)this.img.src='threeCountryImg/lv/left/stand/1.png';
		else this.img.src='threeCountryImg/lv/right/stand/1.png';
	}
	this.w=100;
	this.h=70;
	this.x=280;//在parent中的位置
	this.y=150;//在parent中的位置
	this.img=image('threeCountryImg/lv/left/stand/1.png',this.w,this.h,this.x,this.y,parent);
	this.cartoon=1;//行走的动画有5张图片
	this.move=function(){
		this.attack=0;
		this.cartoon++;
		if(this.cartoon==5)this.cartoon=1;
		if(this.direction==1)this.img.src='threeCountryImg/lv/left/move/'+this.cartoon+'.png';
		else this.img.src='threeCountryImg/lv/right/move/'+this.cartoon+'.png';
	}
	this.up=function(n){
		this.move();
		this.setY(this.y-n);
	}
	this.down=function(n){
		this.move();
		this.setY(this.y+n);
	}
	this.left=function(n){
		this.direction=1;
		this.move();
		this.setX(this.x-n);
	}
	this.right=function(n){
		this.direction=2;
		this.move();
		this.setX(this.x+n);
	}
	this.setX=function(x){
		this.x=x;
		this.img.style.left=x+'px';
	}
	this.setY=function(y){
		this.y=y;
		this.img.style.top=y+'px';
	}
	this.cartoonAttack1=1;//attack1的动画
	this.attack1=function(){
		this.attack=1;
		this.img.src='threeCountryImg/lv/'+(this.direction>1?'right':'left')+'/attack1/'+this.cartoonAttack1+'.png';
		this.cartoonAttack1++;
		if(this.cartoonAttack1==4)this.cartoonAttack1=1;
	}
	this.attack2=function(){
		this.attack=2;
		this.img.src='threeCountryImg/lv/'+(this.direction>1?'right':'left')+'/attack2/1.png';
		this.cartoonAttack1=1;
	}
	this.attack3=function(){
		this.attack=2;
		this.img.src='threeCountryImg/lv/'+(this.direction>1?'right':'left')+'/attack3/1.png';
		this.cartoonAttack1=1;
	}
	//this.hp=1000;
	this.reHp=function(hp){
		this.hp=hp;
	}
};
function ImageMove(src,w,h,x,y,parent){//添加的是image对象，而不是ImageMove对象
	this.w=w;
	this.h=h;
	this.x=x;//在parent中的位置
	this.y=y;//在parent中的位置
	this.img=image(src,w,h,x,y,parent);
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
	this.setX=function(x){
		this.x=x;
		this.img.style.left=x+'px';
	}
	this.setY=function(y){
		this.y=y;
		this.img.style.top=y+'px';
	}
	this.setW=function(w){
		this.w=w;
		this.img.style.width=w+'px';
	}
	this.nextCartoon=function(cartoon){
		this.cartoon=cartoon;
	}
	this.atImg=function(x,y){
		if(x>this.x&&x<this.x+this.w&&y>this.y&&y<this.y+this.h)return true;
		else return false;
	}
};
</script>
<script>
function hit(a,b){//hit(ImageMove a,ImageMove b)
	if(a.x>b.x-a.w&&a.x<b.x+b.w&&
	   a.y>b.y-a.h&&a.y<b.y+b.h)
		return true;else return false;
}
function reStart(){
	lv.img.parentNode.removeChild(lv.img);
	zhao.img.parentNode.removeChild(zhao.img);
	lv=new Lv(oPanel.panel,1000);
	zhao=new Zhao(oPanel.panel,1000);
}
document_color('#0a0');//窗体
var oPanel=new Div(500,300);//div面板
image('threeCountryImg/bg/bg1.jpg',oPanel.w,oPanel.h,0,0,oPanel.panel);
alert('开始游戏!');
var lv=new Lv(oPanel.panel,1000);
var zhao=new Zhao(oPanel.panel,1000);

var flag=0;//0静止      1移动      2攻击//用于AI_lvbu当中
lv.img.timer=setInterval(function(){//计时器//AI_lvbu
	var rd=Math.random();
	if(flag==1) {
		if(lv.x<zhao.x){
			lv.right(1);
		}else lv.left(1);
		if(lv.y<zhao.y) {
			lv.down(1);
		}else lv.up(1);
	}else if(flag==2){
		if((Math.random()*30)<10) {
			for(var i=1;i<=3;i++){
				lv.attack1();
			}
		}
		else if((Math.random()*30)<10) {
			for(var i=1;i<=3;i++){
				lv.attack2();
			}
		}
		else {
			for(var i=1;i<=3;i++){
				lv.attack3();
			}
		} 
	}
	if((Math.random()*1000)<100)flag=1;//移动
	else if((Math.random()*1000)<105)flag=2;//攻击
	else if((Math.random()*1000)<200)flag=0;//静止
	if(hit(lv,zhao))flag=2;
},45);

var lv_hp=new ImageMove('threeCountryImg/hp.png',65,3,0,-100,oPanel.panel);
var zhao_hp=new ImageMove('threeCountryImg/hp.png',65,3,0,-100,oPanel.panel);
document.body.timer=setInterval(function(){//游戏管理员
	lv_hp.setX(lv.x+4);
	lv_hp.setY(lv.y-10);
	lv_hp.setW(lv.hp*65/1000);
	zhao_hp.setX(zhao.x);
	zhao_hp.setY(zhao.y-12);
	zhao_hp.setW(zhao.hp*65/1000);
	if(hit(lv,zhao)){
		if(lv.attack!=0  )zhao.reHp(zhao.hp-50);
		if(zhao.attack==1||zhao.attack==2)lv.reHp(lv.hp-50);
	}else if(zhao.attack==3||zhao.hp<1000)zhao.reHp(zhao.hp+50);
	if(zhao.hp<=0){
		alert('你输了！--DEFEAT');
		reStart();
	}else if(lv.hp<=0){
		alert('你赢了！--WIN');
		reStart();
	}
	lv.stand();
	zhao.stand();
},1000);


var b_up   =new ImageMove('threeCountryImg/button.png',50,50,oPanel.w/3-100,oPanel.h*2/3,oPanel.panel);
var b_down =new ImageMove('threeCountryImg/button.png',50,50,oPanel.w/3-100,oPanel.h*2/3+55,oPanel.panel);
var b_left =new ImageMove('threeCountryImg/button.png',50,50,oPanel.w/3-55-100,oPanel.h*2/3+55,oPanel.panel);
var b_right=new ImageMove('threeCountryImg/button.png',50,50,oPanel.w/3+55-100,oPanel.h*2/3+55,oPanel.panel);
var button1=new ImageMove('threeCountryImg/b1.png'    ,40,40,oPanel.w/2,oPanel.h*2/3+45,oPanel.panel);
var button2=new ImageMove('threeCountryImg/b2.png'    ,40,40,oPanel.w/2+50,oPanel.h*2/3+35,oPanel.panel);
var button3=new ImageMove('threeCountryImg/b3.png'    ,40,40,oPanel.w/2+100,oPanel.h*2/3+25,oPanel.panel);
var mx=-100;
var my=-100;
zhao.img.timer=setInterval(function(){//计时器//AI_lvbu
	if(b_up.atImg(mx,my))zhao.up(1);
	if(b_down.atImg(mx,my))zhao.down(1);
	if(b_left.atImg(mx,my))zhao.left(1);
	if(b_right.atImg(mx,my))zhao.right(1);
	if(button1.atImg(mx,my))zhao.attack1();
	if(button2.atImg(mx,my))zhao.attack2();
	if(button3.atImg(mx,my))zhao.attack3();
},10);
document.body.onmousemove=function(e){//玩家控制赵云的控制面板
	e=e||window.event;
	var x=e.pageX
			-oPanel.x
			-parseInt(oPanel.border);//边框宽度
	var y=e.pageY
			-oPanel.y 
			-parseInt(oPanel.border);//height
	mx=x;my=y;
};
</script>
</body>
</html>