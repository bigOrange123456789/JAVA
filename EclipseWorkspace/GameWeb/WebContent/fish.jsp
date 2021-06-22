<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- <!DOCTYPE html> -->
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
<!--  <meta charset="UTF-8">-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>捕鱼达人</title>
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
function ImageMove(src,w,h,x,y,parent,type,cartoon){//添加的是image对象，而不是ImageMove对象
	if(type)this.type=type;//仅仅鱼类有这个
	if(cartoon)this.cartoon=cartoon;else this.cartoon=1;
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
	this.setXY=function(x,y){
		this.x=x;
		this.y=y;
		this.img.style.left=x+'px';
		this.img.style.top=y+'px';
	}
	this.nextCartoon=function(cartoon){
		this.cartoon=cartoon;
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
	alert('游戏结束!');
	var text=new Span('分数：0','#ff0',15,oPanel.panel);
	for(var i=0;i<15;i++){
		enemys[i].img.parentNode.removeChild(enemys[i].img);
		var type=parseInt(Math.random()*9)+1;
		enemys[i]=new ImageMove('fishImg/fish0'+type+'_01.png',80,30,oPanel.w+parseInt(Math.random()*oPanel.w),parseInt(Math.random()*(oPanel.h-30)),oPanel.panel,type);
		cartoon[i]=parseInt(Math.random()*9)+1;
	}
	return 0;
}
function killEnemy(enemy,bullet,score){
	//enemy.reImg('img/death/sj.png');
	bullet.up(100*oPanel.h);
	enemy.img.timer=setInterval(function(){
		enemy.down(100*oPanel.h);
		clearInterval(enemy.img.timer);
	},100);
	score=score+1;
	text.reHtml('分数：'+score);
	return score;
}

document_color('#0a0');//窗体
var oPanel=new Div(500,300);//div面板
image('fishImg/bg.jpg',oPanel.w,oPanel.h,0,0,oPanel.panel);
alert('开始游戏!');
var score=0;
var text=new Span('分数：0','#ff0',15,oPanel.panel);
//var life=100;
//var text=new Span('生命值：100','#ff0',15,oPanel.panel);

var enemys=[];
var cartoon=[];
var enemy_w=50;
var enemy_h=20;
for(var i=0;i<15;i++){
	var type=parseInt(Math.random()*9)+1;
	enemys[i]=new ImageMove('fishImg/fish0'+type+'_01.png',enemy_w,enemy_h,oPanel.w+parseInt(Math.random()*oPanel.w),parseInt(Math.random()*(oPanel.h-30)),oPanel.panel,type);
	cartoon[i]=parseInt(Math.random()*9)+1;
}

var hero=new ImageMove('fishImg/net09.png',30,30,oPanel.w/2-35,oPanel.h*2/3,oPanel.panel);//ImageMove(src,w,h,x,y,parent)//图片	

var click=false;
hero.img.timer=setInterval(function(){//计时器
	for(var i=0;i<enemys.length;i++){
		enemys[i].left(10);
		cartoon[i]++;
		if(cartoon[i]==11)cartoon[i]=1;
		enemys[i].img.parentNode.removeChild(enemys[i].img);
		if(cartoon[i]>9)enemys[i]=new ImageMove('fishImg/fish0'+enemys[i].type+'_' +cartoon[i]+'.png',enemy_w,enemy_h,enemys[i].x,enemys[i].y,oPanel.panel,enemys[i].type);
		else 			enemys[i]=new ImageMove('fishImg/fish0'+enemys[i].type+'_0'+cartoon[i]+'.png',enemy_w,enemy_h,enemys[i].x,enemys[i].y,oPanel.panel,enemys[i].type);
		if(enemys[i].x<-enemys[i].w){
			score--;
			text.reHtml('得分：' +score);
			if(score<0)score=reStart();
			enemys[i].img.parentNode.removeChild(enemys[i].img);
			var type=parseInt(Math.random()*9)+1;
			if(cartoon[i]>9)enemys[i]=new ImageMove('fishImg/fish0'+type+'_' +cartoon[i]+'.png',enemy_w,enemy_h,oPanel.w+parseInt(Math.random()*50),parseInt(Math.random()*(oPanel.h-30)),oPanel.panel,type);
			else			enemys[i]=new ImageMove('fishImg/fish0'+type+'_0'+cartoon[i]+'.png',enemy_w,enemy_h,oPanel.w+parseInt(Math.random()*50),parseInt(Math.random()*(oPanel.h-30)),oPanel.panel,type);
		}
		if(hit(enemys[i],hero)){
			score++;
			text.reHtml('得分：' +score);
			enemys[i].img.parentNode.removeChild(enemys[i].img);
			var type=parseInt(Math.random()*9)+1;
			if(cartoon[i]>9)enemys[i]=new ImageMove('fishImg/fish0'+type+'_' +cartoon[i]+'.png',80,30,oPanel.w+parseInt(Math.random()*50),parseInt(Math.random()*(oPanel.h-30)),oPanel.panel,type);
			else			enemys[i]=new ImageMove('fishImg/fish0'+type+'_0'+cartoon[i]+'.png',80,30,oPanel.w+parseInt(Math.random()*50),parseInt(Math.random()*(oPanel.h-30)),oPanel.panel,type);
		}
	}
	var r=parseInt(Math.random()*100);
},80);
document.body.onmousemove=function(e){//鼠标监控器,加入对象只决定何时启动，e返回的一定是相对窗体的位置
	e=e||window.event;
	var x=e.pageX
			-oPanel.x
			-parseInt(oPanel.border);//边框宽度
	var y=e.pageY
			-oPanel.y 
			-parseInt(oPanel.border);//height
	if(x>0&&x<oPanel.w
			&&y>0&&y<oPanel.h)
		hero.setXY(x-hero.w/2,y-hero.h/2);
};
/*document.body.onclick=function(){
	for(var i=0;i<enemys.length;i++){
		if(hit(enemys[i],hero)){
			score++;
			text.reHtml('分数：'+score);
			enemys[i].img.parentNode.removeChild(enemys[i].img);
			var type=parseInt(Math.random()*9)+1;
			if(cartoon[i]>9)enemys[i]=new ImageMove('fishImg/fish0'+type+'_' +cartoon[i]+'.png',80,30,oPanel.w+parseInt(Math.random()*50),parseInt(Math.random()*(oPanel.h-30)),oPanel.panel,type);
			else			enemys[i]=new ImageMove('fishImg/fish0'+type+'_0'+cartoon[i]+'.png',80,30,oPanel.w+parseInt(Math.random()*50),parseInt(Math.random()*(oPanel.h-30)),oPanel.panel,type);
		}
	}
};
hero.img.timer=setInterval(function(){//计时器
},80);*/
</script>
</body>
</html>