<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- <!DOCTYPE html> -->
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
<!--  <meta charset="UTF-8">-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>化身编辑</title>
</head>
<body style='overflow:-Scroll;overflow-x:hidden;overflow-y:hidden'>
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
	   //'background:#01f;'+//背景颜色
	   'width:'+width+'px;height:'+height+'px;'+//面板大小
	   //'border:1px solid #fff;'+//显示边框
	   //'margin:50px auto;'+//居于窗口中间
	   'text-align:center;'+//内部文本居中
	   'position:absolute;'+
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
var oPanel=new Div(window.innerWidth-17,window.innerHeight-17);//div面板
var oText1=new H1('会议尚未开始','#e00',25,oPanel.panel);
var announcement=new ImageMove('meeting/announcement.png',oPanel.h/3.5,oPanel.h/14,oPanel.w/2-oPanel.h/3.5/2,oPanel.h/9,oPanel.panel);
var back         =new ImageMove('meeting/back.png',      oPanel.h/11,oPanel.h/11,oPanel.w/25,oPanel.h/19,oPanel.panel);
var help         =new ImageMove('meeting/help.png',      oPanel.h/11,oPanel.h/11,window.innerWidth-80,window.innerHeight-80,oPanel.panel);
var administrator=new ImageMove('meeting/administration.png',      oPanel.h/5,oPanel.h/11,window.innerWidth-130,oPanel.h/19,oPanel.panel);
var camera       =new ImageMove('meeting/camera.png',      oPanel.h/11,oPanel.h/11,oPanel.w/25,window.innerHeight-80,oPanel.panel);
var microphone=new ImageMove('meeting/microphone.png',      oPanel.h/11,oPanel.h/11,oPanel.w/15+oPanel.h-80,window.innerHeight-80,oPanel.panel);
var expression=new ImageMove('meeting/expression.png',      oPanel.h/11,oPanel.h/11,oPanel.w/15+oPanel.h,window.innerHeight-80,oPanel.panel);

var nod  =new ImageMove('meeting/expression/nod.png',  0,0,oPanel.w/15+oPanel.h+oPanel.h/11*0.5,window.innerHeight-128,oPanel.panel);
var smile=new ImageMove('meeting/expression/smile.png',0,0,oPanel.w/15+oPanel.h+oPanel.h/11*1.5,window.innerHeight-128,oPanel.panel);
var wave =new ImageMove('meeting/expression/wave.png', 0,0,oPanel.w/15+oPanel.h+oPanel.h/11*2.5,window.innerHeight-128,oPanel.panel);


document.body.onmouseup=function(e){
	var x=e.pageX
		-oPanel.getX()
		-parseInt(oPanel.border);//边框宽度
	var y=e.pageY
		-oPanel.getY()
		-parseInt(oPanel.border);//height
	
	if(back.pointOnImg(x,y))window.location.href='roomJoin.jsp';
	else if(expression.pointOnImg(x,y)){
		nod.setScale(oPanel.h/11,oPanel.h/11);
		smile.setScale(oPanel.h/11,oPanel.h/11);
		wave.setScale(oPanel.h/11,oPanel.h/11);
	}else if(announcement.pointOnImg(x,y)){
		alert('按数字键可以操纵圆锥体');
	}else if(nod.pointOnImg(x,y)||smile.pointOnImg(x,y)||wave.pointOnImg(x,y)){
	}else{
		nod.setScale(0,0);
		smile.setScale(0,0);
		wave.setScale(0,0);
	}
};
</script>


	<script src="three.js"></script>
     <script>//width:50px;height:50px;
     //'position:absolute;'+//位置可变  
		//  'left:'+x+'px;'+//到部件左边距离
		  //'top:'+y+'px;'; //到部件右边 距离
    	//场景
        var scene = new THREE.Scene();
        //相机//透视投影相机：PerspectiveCamera( fov, aspect, near, far )
        var camera = new THREE.PerspectiveCamera(115, window.innerWidth/window.innerHeight, 0.1, 2000);
        camera.position.x=2;camera.position.y=2;camera.position.z=5;
        //渲染器
        var renderer = new THREE.WebGLRenderer();
        renderer.setSize(window.innerWidth, window.innerHeight);//设置渲染器的大小为窗口大小
        renderer.setClearColor(0x00EEEE,1.0)//设置背景颜色
        document.body.appendChild(renderer.domElement);
        //添加光线
		var light=new THREE.SpotLight(0xffffff);//(0xf876c6);//聚光
		light.position.set(40,40,40);//light.position.x=40;light.position.y=40;light.position.z=40;
		scene.add(light);
        var x0=-5,z0=-5;
        //材质
        //普通材质
        var material1=new THREE.MeshPhongMaterial({color:0xffffff});//白色
        var material2=new THREE.MeshPhongMaterial({color:0x000000});//黑色
        var material3=new THREE.MeshPhongMaterial({color:0x0000dd});//蓝色
        var material4=new THREE.MeshPhongMaterial({color:0xff0000});
        var material5=new THREE.MeshPhongMaterial({color:0x00de00});
        //自发光材质:两种颜色白色、蓝色
        var material01 = new THREE.MeshBasicMaterial({color: 0xffffff});//白色
        var material02 = new THREE.MeshBasicMaterial({color: 0x0000dd});//蓝色
        //两种形状正方形、球形
        var square = new THREE.CubeGeometry(1,1,1);//正方形//width立方体x轴、height立方体y轴、 depth立方体z轴
        var square0= new THREE.CubeGeometry( 4,0.2, 4);
        var sphere1 = new THREE.SphereGeometry(0.4,60,16);//球形//(半径、密封、环)
        var sphere2 = new THREE.SphereGeometry(0.8,60,16);
        var cylinder=new THREE.CylinderGeometry(0.3,0.3,8,50,50);//顶面半径, 底面半径, 圆柱体的高度, 顶面分段, 高度分段
        var x_cylinder=new THREE.CylinderGeometry(0.3,0.5,1.3,50,50);//圆台
        var y_cylinder=new THREE.CylinderGeometry(0,0.4,1.3,50,50);//圆锥
        // new THREE.CylinderGeometry(80,50,300,50,50);
        
        var square3= new THREE.Mesh(new THREE.CubeGeometry(80,10,3), material4);
        square3.position.set(-10,-8,0);
        
        var square_1= new THREE.Mesh(new THREE.CubeGeometry(3,3,2), material5);
        var square_2= new THREE.Mesh(new THREE.CubeGeometry(3,3,2), material5);
        var square_3= new THREE.Mesh(new THREE.CubeGeometry(3,3,2), material5);
        var square_4= new THREE.Mesh(new THREE.CubeGeometry(3,3,2), material5);
        var square_5= new THREE.Mesh(new THREE.CubeGeometry(3,3,2), material5);
        var square_6= new THREE.Mesh(new THREE.CubeGeometry(3,3,2), material5);
        var player1= new THREE.Mesh(sphere1, material1);
        var player2= new THREE.Mesh(y_cylinder,material1);
        square_1.position.set(0,-2.6-1.5,0);
        square_2.position.set(-6,-2.6-1.5,0);
        square_3.position.set(-16,-2.6-1.5,0);
        square_4.position.set(-23,-2.6-1.5,0);
        square_5.position.set(-36,-2.6-1.5,0);
        square_6.position.set(-49,-2.6-1.5,0);
        player2.position.set(0,-1.3,0);
        scene.add(square3);
        scene.add(square_1);
        scene.add(square_2);
        scene.add(square_3);
        scene.add(square_4);
        scene.add(square_5);
        scene.add(square_6);
        //scene.add(player1);
        scene.add(player2);
        
        function hit(x,X){//圆锥位置，地砖位置
        	var W=3,r=0.4;//方块的宽，圆锥半径
        	if(x-r>X-W/2&&x-r<X+W/2)return true;
        	if(x+r>X-W/2&&x+r<X+W/2)return true;
        	return false;//无碰撞
        }
        function inCircle(p1,p2,x,y){//点的位置，圆心位置
        	var r=0.4;//球半径
        	if(Math.pow(p1-x,2)+Math.pow(p2-y,2)<Math.pow(r,2))return true;
        	else return false;//点不在圆中
        }
        function inRectangle(p1,p2,X,Y){//点的位置，矩形位置
        	var H=8,R=0.3;//圆柱高，圆柱半径
        	if(p1>X-R&&p1<X+R&&p2>Y-H/2&&p2<Y+H/2)return true;
        	else return false;//点不在矩形中
        }
        //alert('按下鼠标左键开始蓄力，松开左键起跳');
        var score=0;//得分
		var time=0;
		//var y1_0=player1.position.y;
		var y_1=player1.position.y;//一次赋值不再改变
		var y_2=player2.position.y;//一次赋值不再改变
		var tiao=false;
		var strength;//=0.1;//0.1
		//alert('点击屏幕小球向上飞行，否则小球下落，不要碰到柱子和地面');
		var mouseDown=false;//鼠标没有被按压
		function render() {//渲染循环
			var Time  =new Date();
			if(tiao){
				time+=0.01;
				square_1.position.x+=0.05;if(square_1.position.x>30)square_1.position.x=-30;
				square_2.position.x+=0.05;if(square_2.position.x>30)square_2.position.x=-30;
				square_3.position.x+=0.05;if(square_3.position.x>30)square_3.position.x=-30;
				square_4.position.x+=0.05;if(square_4.position.x>30)square_4.position.x=-30;
				square_5.position.x+=0.05;if(square_5.position.x>30)square_5.position.x=-30;
				square_6.position.x+=0.05;if(square_5.position.x>30)square_6.position.x=-30;
				player1.position.y=y_1+strength*3*time-(2*time*time);
				player2.position.y=y_2+strength*3*time-(2*time*time);
				player2.rotation.z +=0.01*2*6.283/(3*strength);
				if(player1.position.y<=y_1){
					player2.rotation.z=0;
					//player2.height=1.3;
					tiao=false;
					//var flag_final=true;
					if(!hit(player2.position.x,square_1.position.x)
					 &&!hit(player2.position.x,square_2.position.x)
					 &&!hit(player2.position.x,square_3.position.x)
					 &&!hit(player2.position.x,square_4.position.x)
					 &&!hit(player2.position.x,square_5.position.x)
					 &&!hit(player2.position.x,square_6.position.x)
					 ){alert('您的得分为：'+score);//window.location.href ='tiaotiao02.jsp';
					 	score=0;
					 	square_1.position.set(0,-2.6-1.5,0);
				        square_2.position.set(-6,-2.6-1.5,0);
				        square_3.position.set(-16,-2.6-1.5,0);
				        square_4.position.set(-23,-2.6-1.5,0);
				        square_5.position.set(-36,-2.6-1.5,0);
				        square_6.position.set(-49,-2.6-1.5,0);
						}
					else score++;
				} 
			}else if(mouseDown&&((Time - startTime)/500<3)){
				//player2.parameters.width=0.01;
				//player2=new THREE.Mesh(new THREE.CylinderGeometry(0,0.4,2,50,50),material1);
				//player2.scale.set(0.99,0.99,0.99);
				player2.rotation.z-=0.01;
			}//else{var flag_final=true;}
			
			requestAnimationFrame(render);//让浏览器（生成一个新的线程）去执行一次参数中的函数
            renderer.render(scene, camera);//渲染
        }
        render();//渲染循环的函数//JS里面不能有死循环
		
        var startTime=new Date(); // 开始时间//new Date('2018-1-1'); // 开始时间
        var endTime  =new Date(); // 结束时间
        document.body.onkeydown=function(e){
        	if(!tiao){
        		e=e||window.event;
        		startTime=new Date(); // 开始时间
        		player2.rotation.z -=0.2;
        		mouseDown=true;
        	}
        };//document.body.onclick
        //onmouseup
        document.body.onkeyup=function(e){
        	if(!tiao){
	        	var endTime  =new Date();
    	    	//alert(endTime - startTime);
        		strength=(endTime - startTime)/500;
        		if(strength>3)strength=3;
	        	time=0;
    			tiao=true;//y1_0=player1.position.y;
    			mouseDown=false;
    			player2.rotation.z=0;
        	}
        };

        //var controls = new THREE.OrbitControls(camera);//创建控件对象 camera是你的相机对象
		//controls.addEventListener('change', render);//监听鼠标、键盘事件
</script>
</body>