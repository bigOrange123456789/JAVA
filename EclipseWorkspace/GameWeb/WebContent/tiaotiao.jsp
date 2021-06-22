<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- <!DOCTYPE html> -->
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
<!--  <meta charset="UTF-8">-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>开心跳一跳</title>
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
        alert('按下鼠标左键开始蓄力，松开左键起跳');
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
        document.body.onmousedown=function(e){
        	if(!tiao){
        		e=e||window.event;
        		startTime=new Date(); // 开始时间
        		player2.rotation.z -=0.2;
        		mouseDown=true;
        	}
        };//document.body.onclick
        //onmouseup
        document.body.onmouseup=function(e){
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
</html>