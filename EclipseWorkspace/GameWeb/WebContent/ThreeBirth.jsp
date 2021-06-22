<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- <!DOCTYPE html> -->
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
<!--  <meta charset="UTF-8">-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>飞翔的小球</title>
</head>
<body>
	<script src="three.js"></script>
     <script>
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
        //自发光材质:两种颜色白色、蓝色
        var material01 = new THREE.MeshBasicMaterial({color: 0xffffff});//白色
        var material02 = new THREE.MeshBasicMaterial({color: 0x0000dd});//蓝色
        //两种形状正方形、球形
        var square = new THREE.CubeGeometry(1,1,1);//正方形//width立方体x轴、height立方体y轴、 depth立方体z轴
        var square0= new THREE.CubeGeometry( 4,0.2, 4);
        var sphere1 = new THREE.SphereGeometry(0.4,60,16);//球形//(半径、密封、环)
        var sphere2 = new THREE.SphereGeometry(0.8,60,16);
        var cylinder=new THREE.CylinderGeometry(0.3,0.3,8,50,50);//顶面半径, 底面半径, 圆柱体的高度, 顶面分段, 高度分段
        //
        // new THREE.CylinderGeometry(80,50,300,50,50);
        var square11= new THREE.Mesh(cylinder, material4);
        square11.position.set(-6,-3,0);
        var square12= new THREE.Mesh(cylinder, material4);
        square12.position.set(-16,6,0);
        var square21= new THREE.Mesh(cylinder, material4);
        square21.position.set(-26,-3,0);
        var square22= new THREE.Mesh(cylinder, material4);
        square22.position.set(-36,6,0);
        var square3= new THREE.Mesh(new THREE.CubeGeometry(80,10,3), material4);
        square3.position.set(-10,-8,0);
        var player1= new THREE.Mesh(sphere1, material1);
        /*function hit(x1,y1,x2,y2){//圆柱位置，球的位置
        	var h=8,br=0.3,r=0.4;//
        	if(x1-br <x2+r&&x1+br>x2-r&&
        	   y1-h/2<y2+r&&y1+h/2>y2-r)return true;//有碰撞
        	return false;//无碰撞
        }*/
        function hit(X,Y,x,y){//圆柱位置，球的位置//矩形位置，圆的位置
        	var H=8,R=0.3,r=0.4;//圆柱高，圆柱半径，球半径
        	if(inCircle(X-R,Y-H/2,x,y)//A1在圆中
        	 ||inCircle(X+R,Y-H/2,x,y)//A2在圆中
        	 ||inCircle(X-R,Y+H/2,x,y)//A3在圆中
        	 ||inCircle(X+R,Y+H/2,x,y)//A4在圆中
        	 ||inRectangle(x-r,y,X,Y)//B1在矩形中
        	 ||inRectangle(x,y+r,X,Y)//B2在矩形中
        	 ||inRectangle(x+r,y,X,Y)//B3在矩形中
        	 ||inRectangle(x,y-r,X,Y)//B4在矩形中
        	    )return true;
        	else return false;//无碰撞
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
        //var player2= new THREE.Mesh(sphere2, material1);
        //player2.position.y=-1.5;
        scene.add(square11);
        scene.add(square12);
        scene.add(square21);
        scene.add(square22);
        scene.add(square3);
        scene.add(player1);
        //scene.add(player2);
        
		var time=0;
		var y1_0=player1.position.y;
		//var y2_0=player2.position.y;
		var tiao=false;
		alert('点击屏幕小球向上飞行，否则小球下落，不要碰到柱子和地面');
		function render() {//渲染循环
			time+=0.01;
			square11.position.x+=0.05;if(square11.position.x>20)square11.position.x=-20;
			square12.position.x+=0.05;if(square12.position.x>20)square12.position.x=-20;
			square21.position.x+=0.05;if(square21.position.x>20)square21.position.x=-20;
			square22.position.x+=0.05;if(square22.position.x>20)square22.position.x=-20;
			if( hit(square11.position.x,square11.position.y,player1.position.x,player1.position.y)||
				hit(square12.position.x,square12.position.y,player1.position.x,player1.position.y)||
				hit(square21.position.x,square21.position.y,player1.position.x,player1.position.y)||
				hit(square22.position.x,square22.position.y,player1.position.x,player1.position.y)||
				player1.position.y<(-8+5+0.4)
					){alert('游戏结束');
					 window.location.href ='welcome.jsp';
					 }
			player1.position.y=y1_0+3*time-2*time*time;////////////
			//player2.position.y=y2_0+3*time-2*time*time;
			requestAnimationFrame(render);//让浏览器（生成一个新的线程）去执行一次参数中的函数
            renderer.render(scene, camera);//渲染
        }
        render();//渲染循环的函数//JS里面不能有死循环
		
        document.addEventListener('keydown', function (event) {
        	switch (event.keyCode) { 
                case 37://左
                	//alert(player1.position.y);
                	//alert(square11.position.x);
                	//if(strength<10)strength=+0.1;//蓄力
                	break; 
                case 38://上
                	time=0;
            		y1_0=player1.position.y;
            		//y2_0=player2.position.y;
            		tiao=true;
                	break; 
                case 39://右
                	//if(strength<10)strength=+0.1;//蓄力
                	break; 
                case 40://下
                	//if(strength<10)strength=+0.1;//蓄力
                	break;
                default:break; 
            }
            renderer.render(scene, camera);
        });
        document.body.onclick=function(e){
        	e=e||window.event;
        	time=0;
    		y1_0=player1.position.y;
        };//document.body.onclick
        //var controls = new THREE.OrbitControls(camera);//创建控件对象 camera是你的相机对象
		//controls.addEventListener('change', render);//监听鼠标、键盘事件
</script>
</body>
</html>