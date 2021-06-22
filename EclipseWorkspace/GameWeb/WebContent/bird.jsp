<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- <!DOCTYPE html> -->
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
<!--  <meta charset="UTF-8">-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>飞翔的小鸟</title>
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
	this.up=function(n){
		this.y-=n;
		this.img.style.top=this.y+'px';
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
	this.setXY=function(x,y){
		this.setX(x);
		this.setY(y);
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
	alert('您的得分为'+score);
	time=0;
	score=0;
	hero.setXY(0,oPanel.h*2/3-100);
	enemys[0].setXY(0,oPanel.h/5*4);
	enemys[1].setXY(oPanel.w    ,-300);
	enemys[2].setXY(oPanel.h,oPanel.w+50);
	enemys[3].setXY(oPanel.h,oPanel.w*3/2+50,-oPanel.h/3*2);
	enemys[4].setXY(oPanel.w*3/2+100,300);
	score=0;
	return 0;
}
var score=0;
var time=0;
document_color('#0a0');//窗体
var oPanel=new Div(300,500);//div面板
image('birdImg/bg/bg_day.png',oPanel.w,oPanel.h,0,0,oPanel.panel);
alert('开始游戏!');

var enemys=[];

enemys[1]=new ImageMove('birdImg/column/pipe_down.png',oPanel.w/8,oPanel.h,oPanel.w    ,-300,oPanel.panel);
enemys[2]=new ImageMove('birdImg/column/pipe_up.png'  ,oPanel.w/8,oPanel.h,oPanel.w+50	   ,350,oPanel.panel);
enemys[3]=new ImageMove('birdImg/column/pipe_down.png',oPanel.w/8,oPanel.h,oPanel.w*3/2+50,-oPanel.h/3*2,oPanel.panel);
enemys[4]=new ImageMove('birdImg/column/pipe_up.png'  ,oPanel.w/8,oPanel.h,oPanel.w*3/2+100,300,oPanel.panel);

enemys[0]=new ImageMove('birdImg/bg/land.png',oPanel.w*3,oPanel.h/5,0,oPanel.h/5*4,oPanel.panel);


var hero=new ImageMove('birdImg/birth/bird0.png',50,50,0,oPanel.h*2/3-100,oPanel.panel);//ImageMove(src,w,h,x,y,parent)//图片	

var text=new Span('分数：0','#ff0',15,oPanel.panel);

hero.img.timer=setInterval(function(){//计时器
	time++;
	hero.setY(hero.y+(-time*25+time*time)/50);
	for(var i=0;i<enemys.length;i++){
		enemys[i].left(1);
		if(hit(hero,enemys[i])){
			score=reStart();
		}
	}
	if(enemys[0].x<-enemys[0].w/3)enemys[0].right(enemys[0].w/3);
	if(enemys[1].x<-enemys[1].w){
		enemys[1].setX(oPanel.w+50);score++;text.reHtml('分数：'+score);
		}
	if(enemys[2].x<-enemys[2].w){
		enemys[2].setX(oPanel.w+50);score++;text.reHtml('分数：'+score);
		}
	if(enemys[3].x<-enemys[3].w){
		enemys[3].setX(oPanel.w+50);score++;text.reHtml('分数：'+score);
		}
	if(enemys[4].x<-enemys[4].w){
		enemys[4].setX(oPanel.w+50);score++;text.reHtml('分数：'+score);
		}
},45);
document.body.onclick=function(){//鼠标监控器
	time=0;
};



</script>
</body>
</html>