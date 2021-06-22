<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- <!DOCTYPE html> -->
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head>
<!--  <meta charset="UTF-8">-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>人机五子棋</title>
</head>
<body>
	<script src="three.js"></script>
	<script src="OrbitControls.js"></script>
     <script>
	 function AI(judgement){
		 this.nexti;this.nextj;
		 this.think=function(qp){
			 qp.reNeighbor();
			 if(qp.numQizi<=1){this.think0(qp);return;}//第一步随意走
			 if(qp.numQizi>=7&&this.think1(qp)!=0)return;//下一步可获胜
			 if(qp.numQizi>=4&&this.think2(qp)!=0)return;//有2*2种情况可以获胜
			 //if(qp.numQizi>=7&&this.think3(qp)!=0)return;//有2*2*2种情况可以获胜
			 if(qp.numQizi>=3&&this.think02(qp)!=0)return;//连下两步可获胜
			 //if(qp.numQizi>=3&&this.think03(qp)!=0)return;//连下三步可获胜
			 if(this.think00(qp)>0)return;
			 this.think0(qp);
		 }
		 this.think1=function(qp){
				var qp0=new QiPan(qp.Length-3);
				qp0.init();
				qp.copy(qp, qp0);
			    for(var i=1;i<=qp.Length-2;i++)
					for(var j=1;j<=qp.Length-2;j++)
						if(qp.array[i][j]=='*'){
							qp0.array[i][j]='O';
							if(judgement.judge(qp0)!=0){
								this.nexti=i;this.nextj=j;
								return 2;//害怕
							}
							qp0.array[i][j]='#';
							if(judgement.judge(qp0)!=0){
								this.nexti=i;this.nextj=j;
								return 1;//高兴	
							}
							qp0.array[i][j]='*';
						}
				return 0;//没有思考结果	
		 }//think1()
		 this.think2=function(qp){//连下两步可以获胜的情况
				if(this.think_2(qp,1))return 1;//这里报错:Uncaught ReferenceError: think_2 is not defined//高兴
				else if(this.think_2(qp,2))return 2;//害怕
				else return 0;
			} 
		 this.think_2=function(qp,n){
				var c1,c2;//c1为我方，c2为敌方
				if(n==1){
				    c1='#';c2='O';
				}else{
					c1='O';c2='#';
				}
				var i,j,i0=0,j0=0;
				var qp0=new QiPan(qp.Length-3);
				qp0.init();
				qp.copy(qp, qp0);
				for(i=1;i<=qp.Length-2;i++)
					for(j=1;j<=qp.Length-2;j++)
					if(qp0.array[i][j]=='*')//如果这个位置为空
					{//c1的回合
						qp0.array[i][j]=c1;
						
						var flag1=0;//
						for(var i1=1;i1<=qp.Length-2;i1++)
							for(var j1=1;j1<=qp.Length-2;j1++)
							if(qp0.array[i1][j1]=='*')
							{//c1
								qp0.array[i1][j1]=c1;
										if(judgement.judge(qp0)!=0) {//(judgement.judge(qp0)!=0)
											flag1++;
											i0=i1;
											j0=j1;
										}
								qp0.array[i1][j1]='*';
							}//i1 j1
						
						if(flag1>1){//falg1最少为2
							if(qp.xiangLinDian(i,j,i0,j0,c1)==1){this.nexti=i;this.nextj=j;}
							else{this.nexti=i0;this.nextj=j0;}
							return true;
						}else qp0.array[i][j]='*';
			      }//i j	
				return false;	
		 }//think_2()
		 this.think3=function(qp){//连下三步可以获胜的情况
				if(this.think_3(qp,1))return 1;//高兴
				else if(this.think_3(qp,2))return 2;//害怕
				else return 0;
			} 
		 this.think_3=function(qp,n){
				var c1;
				if(n==1){
				    c1='#';
				}else{
					c1='O';
				}
				var qp0=new QiPan(qp.Length-3);
				qp0.init();
				qp.copy(qp, qp0);
				for(var i=1;i<=qp.Length-2;i++)
					for(var j=1;j<=qp.Length-2;j++)
					if(qp0.array[i][j]=='*')
					{//c1的回合
						qp0.array[i][j]=c1;
						
						var flag1=0;
						for(var i1=1;i1<=qp.Length-2;i1++)
							for(var j1=1;j1<=qp.Length-2;j1++)
							if(qp0.array[i1][j1]=='*')
							{//c1
								qp0.array[i1][j1]=c1;
								
								var flag2=0;
								for(var i2=1;i2<=qp.Length-2;i2++)
									for(var j2=1;j2<=qp.Length-2;j2++)
									if(qp0.array[i2][j2]=='*')
									{//c1的回合
										qp0.array[i2][j2]=c1;
										if(judgement.judge(qp0)!=0){
											flag2++;
											//nexti=i1;nextj=j1;
											//return true;
										}
										qp0.array[i2][j2]='*';
									}//i2 j2			
								
								if(flag2>1)flag1++;
								qp0.array[i1][j1]='*';
							}//i1 j1
						 if(flag1>2) {this.nexti=i;this.nextj=j;return true;}
						 qp0.array[i][j]='*';
			      }//i j		

				return false;	
		 }//think_3()
		 this.think02=function(qp){//连下两步可以获胜的情况
				if(this.think_02(qp,1))return 1;//高兴
				else if(this.think_02(qp,2))return 2;//害怕
				else return 0;
		 } 
		 this.think_02=function(qp,n){
				var c1,c2;
				if(n==1){
				    c1='#';c2='O';
				}else{
					c1='O';c2='#';
				}
				var qp0=new QiPan(qp.Length-3);
				qp0.init();
				qp.copy(qp, qp0);
				var i=0,j=0,i1=0,j1=0,
					next_neighbor=-1;//上一个同级别的空位置，相邻点的个数
				for(i=1;i<=qp.Length-2;i++)
					for(j=1;j<=qp.Length-2;j++)
					if(qp0.array[i][j]=='*')
					{//c1的回合
						qp0.array[i][j]=c1;
						 //存在
						var flag1=0;
						for(i1=1;i1<=qp.Length-2;i1++)
							for(j1=1;j1<=qp.Length-2;j1++)
							if(qp0.array[i1][j1]=='*')
							{//c1
								qp0.array[i1][j1]=c1;
										if(judgement.judge(qp0)!=0)flag1=1;
								qp0.array[i1][j1]='*';
							}//i1 j1
						
						qp0.array[i][j]='*';
						if(flag1==1){
							if(next_neighbor<qp.neighbor(i, j))  {this.nexti=i;this.nextj=j;next_neighbor=qp.neighbor(i, j);}
							if(next_neighbor<qp.neighbor(i1, j1)){this.nexti=i1;this.nextj=j1;next_neighbor=qp.neighbor(i1, j1);}	
						}
			      }//i j		
		        if(next_neighbor>0)return true;
		        else return false;	
		 }//think_02()
		 this.think03=function(qp){//连下三步可以获胜的情况
				if(this.think_03(qp,1))return 1;//高兴
				else if(this.think_03(qp,2))return 2;//害怕
				else return 0;
		 } 
		 this.think_03=function(qp,n){
				var c1;
				if(n==1){
				    c1='#';
				}else{
					c1='O';
				}
				var qp0=new QiPan(qp.Length-3);
				qp0.init();
				qp.copy(qp, qp0);
				//int i=0,j=0,i1=0,j1=0,i2=0,j2=0,next_neighbor=-1;
				//int k=0,b=0,k1=0,b1=0,k2=0,b2=0,
				var next_neighbor=-1;
				for(var i=1;i<=qp.Length-2;i++)
					for(var j=1;j<=qp.Length-2;j++)
					if(qp0.array[i][j]=='*')
					{//c1的回合
						qp0.array[i][j]=c1;
						
						
						for(var i1=1;i1<=qp.Length-2;i1++)
							for(var j1=1;j1<=qp.Length-2;j1++)
							if(qp0.array[i1][j1]=='*')
							{//c1
								qp0.array[i1][j1]=c1;
								
								for(var i2=1;i2<=qp.Length-2;i2++)
									for(var j2=1;j2<=qp.Length-2;j2++)
									if(qp0.array[i2][j2]=='*')
									{//c1的回合
										qp0.array[i2][j2]=c1;
										if(judgement.judge(qp0)!=0){
											if(next_neighbor<qp.neighbor(i, j)) {this.nexti=i;this.nextj=j;next_neighbor=qp.neighbor(i, j);}
											if(next_neighbor<qp.neighbor(i1,j1)){this.nexti=i1;this.nextj=j1;next_neighbor=qp.neighbor(i1, j1);}
											if(next_neighbor<qp.neighbor(i2,j2)){this.nexti=i2;this.nextj=j2;next_neighbor=qp.neighbor(i2, j2);}
										}
										qp0.array[i2][j2]='*';
									}//i2 j2			
								
								qp0.array[i1][j1]='*';
							}//i1 j1
						
						 qp0.array[i][j]='*';
			      }//i j		
				if(next_neighbor>=0)return true;
				else return false;	
			}//think03()
		 this.think0=function(qp){
			 while(true){
					this.nexti=parseInt((Math.random()*(qp.Length-2))+1);
					this.nextj=parseInt((Math.random()*(qp.Length-2))+1);
				    if(qp.Error(qp,this.nexti,this.nextj)==0)return 2;//害怕
				}
		 }
		 this.think00=function(qp){
			 var next_neighbor=-1;
				for(var i=1;i<=qp.Length-2;i++)
					for(var j=1;j<=qp.Length-2;j++)
					if(qp.array[i][j]=='*'&&qp.neighbor(i, j)>next_neighbor){
						this.nexti=i;
						this.nextj=j;
						next_neighbor=qp.neighbor(i, j);
					}
			if(next_neighbor>0)return 2;//害怕
			else return 0;
		 }
     }
     function QiPan(length){//棋盘
    	 this.numQizi=0;//棋盘上的棋子个数，用于判断平局
    	 this.Length=length+2+1;
         this.array=new Array();//空白处为*,白棋为O,黑棋为#
         this.neighbor=new Array();//new int[length][length]; 
     	 this.reNeighbor=function(){
     		for(var i=1;i<this.Length-1;i++)
     			for(var j=1;j<this.Length-1;j++)
     				this.neighbor[i][j]=this.get_neighbor(i,j);
     	 }
     	 this.get_neighbor=function(i,j) {
     		var n=0;
     		if(this.array[i-1][j-1]=='#'||this.array[i-1][j-1]=='O')n++;
     		if(this.array[i-1][j  ]=='#'||this.array[i-1][j  ]=='O')n++;
     		if(this.array[i-1][j+1]=='#'||this.array[i-1][j+1]=='O')n++;
     		if(this.array[i  ][j-1]=='#'||this.array[i  ][j-1]=='O')n++;
     		if(this.array[i  ][j+1]=='#'||this.array[i  ][j+1]=='O')n++;
     		if(this.array[i+1][j-1]=='#'||this.array[i+1][j-1]=='O')n++;
     		if(this.array[i+1][j  ]=='#'||this.array[i+1][j  ]=='O')n++;
     		if(this.array[i+1][j+1]=='#'||this.array[i+1][j+1]=='O')n++;
     		return n;
     	 }
     	 this.neighbor=function(i,j){
     		return this.neighbor[i][j];
     	 }
     	 
         this.init=function(){
        	 for(var i=0;i<this.Length;i++){
        		 this.array[i]=new Array();
        		 this.neighbor[i]=new Array();
        		 for(var j=0;j<this.Length;j++){
        			 this.array[i][j]='*';
        			 this.neighbor[i][j]=0;
        		 } 
        	 }
         }
         this.Error=function(qp,i,j){
        	if(qp.array[i][j]!='*')return 1;//该位置已有棋子
     		else if(!(i>0&&i<(this.Length-1)&&j>0&&j<(this.Length-1)))return 2;//该位置不在棋盘上
     		return 0;//无错误
     	 }
         this.zhuanzhi=function(qp){//转置处理
			var qp0=new QiPan(length);
			qp0.init(qp0);
			for(var i=1;i<qp.Length;i++)
				for(var j=1;j<qp.Length;j++)
					qp0.array[i][j]=qp.array[j][i];
			return qp0;
		}
        this.jingmian=function(qp){//左右镜面处理
			var qp0=new QiPan(length);
			qp0.init(qp0);
			for(var i=1;i<qp.Length;i++)
				for(var j1=1,j2=qp.Length-2;j1<qp.Length;j1++,j2--)
					qp0.array[i][j1]=qp.array[i][j2];
			return qp0;
		}
        this.copy=function(qp1,qp2){
    		for(var k1=0;k1<qp1.Length;k1++){
    			for(var k2=0;k2<qp1.Length;k2++){	
    		        qp2.array[k1][k2]=qp1.array[k1][k2];
    			}
    		}		
    	}
        this.xiangLinDian=function(i1,j1,i2,j2,c){//如果点1和点2相邻，返回近c的一端
    		//1：近c端为点1		2：近c端为点2  		0：错误
    		if((i1-i2)<-1||(i1-i2)>1||(i1-i2)<-1||(i1-i2)>1)
    			if(i1==i2) {
    				if(j1==j2) {
    					return 0;//0：错误
    				}else if(j1<j2){
    					if(this.caiZhi(i1,j1+1,c))return 1;
    				}else {//(j1-1)==j2
    					if(this.caiZhi(i1,j1-1,c))return 1;
    				}
    			}else if(i1<i2){
    				if(j1==j2) {
    					if(this.caiZhi(i1+1,j1,c))return 1;
    				}else if(j1<j2){
    					if(this.caiZhi(i1+1,j1+1,c))return 1;
    				}else {//
    					if(this.caiZhi(i1+1,j1-1,c))return 1;
    				}
    			}else {//(i1-1)==i2
    				if(j1==j2) {
    					if(this.caiZhi(i1-1,j1,c))return 1;
    				}else if(j1<j2){
    					if(this.caiZhi(i1-1,j1+1,c))return 1;
    				}else {//
    					if(this.caiZhi(i1-1,j1-1,c))return 1;
    				}
    			}
    			//return 0;//0：错误
    		if(i1==i2) {
    			if(j1==j2) {
    				return 0;
    			}else if((j1+1)==j2){
    				if(this.caiZhi(i1,j1-1,c))return 1;
    			}else {//(j1-1)==j2
    				if(this.caiZhi(i1,j1+1,c))return 1;
    			}
    		}else if((i1+1)==i2){
    			if(j1==j2) {
    				if(this.caiZhi(i1-1,j1,c))return 1;
    			}else if((j1+1)==j2){
    				if(this.caiZhi(i1-1,j1-1,c))return 1;
    			}else {//(j1-1)==j2
    				if(this.caiZhi(i1-1,j1+1,c))return 1;
    			}
    		}else {//(i1-1)==i2
    			if(j1==j2) {
    				if(this.caiZhi(i1+1,j1,c))return 1;
    			}else if((j1+1)==j2){
    				if(this.caiZhi(i1+1,j1-1,c))return 1;
    			}else {//(j1-1)==j2
    				if(this.caiZhi(i1+1,j1+1,c))return 1;
    			}
    		}
    		return 2;//2：近c端为点2	
    	}
        this.caiZhi=function(i,j,c){//用于辅助函数xiangLinDian来完成:猜测一个位置的状态
    		if(i>=1&&i<=length&&j>=1&&j<=length) {
    			if(this.array[i][j]==c)return true;
    		}
    		return false;
    	}
     }
     function Player(){//用于操作棋盘的构造器
         this.put1=function(qp,i,j){//空白处为*,白棋为O,黑棋为#
        	 if(qp.Error(qp,i,j)==1)alert('该位置已有棋子');
        	 else if(qp.Error(qp,i,j)==2)alert('该位置不在棋盘上');
        	 else {qp.array[i][j]='O';qp.numQizi++;}
         }
         this.put2=function(qp,ai){
        	 	var nextij=[];
        	 	while(true){
         			ai.think(qp);
         	    	if(qp.Error(qp, ai.nexti, ai.nextj)==0){
         	  	    	qp.array[ai.nexti][ai.nextj]='#';
         		    	break; 	    
         		  	}
         		}
         		qp.numQizi++;
         		nextij[0]=ai.nexti;
         		nextij[1]=ai.nextj;
         		return nextij;
     	 }
     }
     function Judgement(){//裁判
    	 this.judge=function(qp){
   	          if(this.judgeA(qp,1)||this.judgeA(qp.zhuanzhi(qp),1)||this.judgeB(qp,1)||this.judgeB(qp.jingmian(qp),1))return 1;//白棋胜利
      		  else if(this.judgeA(qp,2)||this.judgeA(qp.zhuanzhi(qp),2)||this.judgeB(qp,2)||this.judgeB(qp.jingmian(qp),2))return 2;//黑棋胜利
   	          else return 0;
   		 }
    	 this.judgeA=function(qp,player){//这里的player为1代表白棋，为2代表黑棋
    			var c;
    			if(player==1)c='O';
    			else c='#';		
    			var flag=0;//没有横着连成5个的白棋
    			for(var k1=1;k1<=qp.Length-2;k1++){
    				for(var k2=1;k2<=qp.Length-2;k2++){	
    			        if(qp.array[k1][k2]==c)flag++;
    			        else flag=0;
    			        if(flag==5)return true;
    				}
    			    flag=0;
    			}
    			return false;
    	 }
    	 this.judgeB=function(qp,player){//这里的player为1代表白棋，为2代表黑棋
    			var c;
    			if(player==1)c='O';
    			else c='#';
    			var flag=0;
    			var k1=1;var k2=1;
    			while(true){
    				if(qp.array[k1][k2]==c)flag++;
    				else flag=0;
    				if(flag==5)return true;
    				k1++;k2--;
    				if(k2==qp.Length-3&&k1==qp.Length-1){
    					break;
    				}else if(k1==qp.Length-1){
    					flag=0;
    					k1=k2+2;
    					k2=qp.Length-2;
    				}else if(k2==0){
    					flag=0;
    					k2=k1;
    					k1=1;
    				}
    			}
    			return false;
    		}
     }
/////////////////////////////////////////////以上为构造器，以下为具体程序
    	//场景
        var scene = new THREE.Scene();
        //相机
        var camera = new THREE.PerspectiveCamera(115, window.innerWidth/window.innerHeight, 0.1, 2000);
        camera.position.x=2;camera.position.y=2;camera.position.z=5;
        //渲染器
        var renderer = new THREE.WebGLRenderer();
        renderer.setSize(window.innerWidth, window.innerHeight);//设置渲染器的大小为窗口大小
        document.body.appendChild(renderer.domElement);
        //renderer.setClearColor('rgb(135,206,250)',1.0);
    	//renderer.setClearColor(0xffffff,1.0);
    	//renderer.setClearColor('#428bca',1.0);
    	renderer.setClearColor('rgba(135,206,250,0.5)',1.0);
        //添加网格
        var length=10;//棋盘边长有多少格子
        //var length=4;
        var helper = new THREE.GridHelper(length,length);//(整个方格区域的边长，大方格边长为几个小方格)
        scene.add( helper );
        var x0=-length/2,z0=-length/2;
        //棋盘
        var qp=new QiPan(length);//注意length是方格数不是交点数
        qp.init();
        //棋盘的管理者
        var player=new Player();
        //裁判
        var judgement=new Judgement();
        //计算机玩家
        var ai=new AI(judgement);
        //两种颜色白色、黑色
        var material1 = new THREE.MeshBasicMaterial({color: 0xffffff});//白色
        var material2 = new THREE.MeshBasicMaterial({color: 0x000000});//黑色
        //两种形状正方形、球形
        var square = new THREE.CubeGeometry(0.2,0.2,0.2);//正方形//width立方体x轴、height立方体y轴、 depth立方体z轴
        var sphere = new THREE.SphereGeometry(0.25,60,16);//球形//(半径、密封、环)
        
        //玩家A的棋子cubeA、cubeA0
        var cubeA0= new THREE.Mesh(square, material1);
        cubeA0.position.x=x0+5;
        cubeA0.position.z=z0-1;
        cubeA0.position.y=0.5;
        scene.add(cubeA0);
        var cubeA=[];
        for(var i=0;i<62;i++){
        	cubeA[i]= new THREE.Mesh(sphere, material1);
        	cubeA[i].position.x=x0+5;
        	cubeA[i].position.z=z0-1;
        	scene.add(cubeA[i]);
        }
        //玩家B的棋子cubeB、cubeB0 
        var cubeB0= new THREE.Mesh(square, material2);
        cubeB0.position.x=x0+5;
        cubeB0.position.z=z0+11;
        cubeB0.position.y=0.5;
        scene.add(cubeB0);
        var cubeB=[];
        for(var i=0;i<62;i++){
        	cubeB[i]= new THREE.Mesh(sphere, material2);
        	cubeB[i].position.x=x0+5;
        	cubeB[i].position.z=z0+11;
        	scene.add(cubeB[i]);
        }

        function render() {//渲染循环
            requestAnimationFrame(render);//让浏览器去执行一次参数中的函数
            renderer.render(scene, camera);//渲染
        }
        render();//渲染循环的函数
        
        var iA=0;//数组cubeA[]的下标
        var iB=0;//数组cubeB[]的下标
        document.addEventListener('keydown', function (event) {
        	switch (event.keyCode) { 
                case 37://左
                	cubeA[iA].position.z--;cubeA0.position.z--;break; 
                case 38://上
                	cubeA[iA].position.x++;cubeA0.position.x++;break; 
                case 39://右
                	cubeA[iA].position.z++;cubeA0.position.z++;break; 
                case 40://下
                	cubeA[iA].position.x--;cubeA0.position.x--;break;
                default:
                	/*if(qp.Error(qp,getQPx(cubeA[iA].position.x),getQPy(cubeA[iA].position.z))==1){
                		alert('这个位置已有棋子！');
                	}else if(qp.Error(qp,getQPx(cubeA[iA].position.x),getQPy(cubeA[iA].position.z))==2){
                		alert('这个位置不在棋盘上！');
                	}else{
                		//操作抽象棋盘
                		player.put1(qp,getQPx(cubeA[iA].position.x),getQPy(cubeA[iA].position.z));
               			//操作具体棋盘
                		iA++;cubeA0.position.x=x0+5;cubeA0.position.z=z0-1;
               			//判断
                		if(judgement.judge(qp)!=0)alert('白棋胜出');
                		if(qp.numQizi==(qp.Length-2)*(qp.Length-2))alert('平局');
               			//以下为电脑玩家AI的操作
                		var nextij=player.put2(qp,ai);
                		cubeB[iB].position.x=ni_getQPx(nextij[0]);
              	  		cubeB[iB].position.z=ni_getQPx(nextij[1]);
                		cubeB0.position.x=ni_getQPx(nextij[0]);
                		cubeB0.position.z=ni_getQPx(nextij[1]);
                		iB++;
                		if(qp.numQizi==(qp.Length-2)*(qp.Length-2))alert('平局');
                	}*/
                break; 
            }
            renderer.render(scene, camera);
        });
        var controls = new THREE.OrbitControls(camera);//创建控件对象 camera是你的相机对象
		controls.addEventListener('change', render);//监听鼠标、键盘事件
		function getQPx(x){return x-x0+1;}//返回位置下标从1开始
		function getQPy(z){return z-z0+1;}
		function ni_getQPx(x){return x+x0-1;}
		function ni_getQPz(y){return y+z0-1;}
		function atQP(x,z){return getQPx(x)>0&&getQPx(x)<=length&&getQPy(z)>0&&getQPy(z)<=length;}	
////////////////////////////////////////////以上为核心代码，以下为补充的按钮控制代码
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
        function ImageMove(src,w,h,x,y,parent){//添加的是image对象，而不是ImageMove对象
        	this.w=w;
        	this.h=h;
        	this.x=x;//在parent中的位置
        	this.y=y;//在parent中的位置
        	this.img=image(src,w,h,x,y,parent);
        	this.nextCartoon=function(cartoon){
        		this.cartoon=cartoon;
        	}
        	this.atImg=function(x,y){
        		if(x>this.x&&x<this.x+this.w&&y>this.y&&y<this.y+this.h)return true;
        		else return false;
        	}
        };
        var bx=150,by=150;
        var Bdetermine=new ImageMove('button.png',50,50,bx   ,by,document.body);
        var Bup       =new ImageMove('button.png',50,50,bx+55,by  ,document.body);
        var Bdown     =new ImageMove('button.png',50,50,bx-55,by  ,document.body);
        var Bleft     =new ImageMove('button.png',50,50,bx   ,by-55,document.body);
        var Bright    =new ImageMove('button.png',50,50,bx   ,by+55,document.body);
        document.body.onclick=function(e){
        	e=e||window.event;
        	if(Bup.atImg(e.pageX,e.pageY)       ){cubeA[iA].position.x++;cubeA0.position.x++;}
        	if(Bdown.atImg(e.pageX,e.pageY)     ){cubeA[iA].position.x--;cubeA0.position.x--;}
        	if(Bleft.atImg(e.pageX,e.pageY)     ){cubeA[iA].position.z--;cubeA0.position.z--;}
        	if(Bright.atImg(e.pageX,e.pageY)    ){cubeA[iA].position.z++;cubeA0.position.z++;}
        	if(Bdetermine.atImg(e.pageX,e.pageY)){
            	//iA++;cubeA0.position.x=x0+5;cubeA0.position.z=z0-1;
        		if(qp.Error(qp,getQPx(cubeA[iA].position.x),getQPy(cubeA[iA].position.z))==1){
            		alert('这个位置已有棋子！');
            	}else if(qp.Error(qp,getQPx(cubeA[iA].position.x),getQPy(cubeA[iA].position.z))==2){
            		alert('这个位置不在棋盘上！');
            	}else{
            		//操作抽象棋盘
            		player.put1(qp,getQPx(cubeA[iA].position.x),getQPy(cubeA[iA].position.z));
           			//操作具体棋盘
            		iA++;cubeA0.position.x=x0+5;cubeA0.position.z=z0-1;
           			//判断
            		if(judgement.judge(qp)==1){alert('白棋胜出');window.location.href ='welcome.jsp';}
            	    if(qp.numQizi==(qp.Length-2)*(qp.Length-2)){alert('平局');window.location.href ='welcome.jsp';}
           			//以下为电脑玩家AI的操作
            		var nextij=player.put2(qp,ai);
            		cubeB[iB].position.x=ni_getQPx(nextij[0]);
          	  		cubeB[iB].position.z=ni_getQPx(nextij[1]);
            		cubeB0.position.x=ni_getQPx(nextij[0]);
            		cubeB0.position.z=ni_getQPx(nextij[1]);
            		iB++;
            		if(judgement.judge(qp)==2){alert('黑棋胜出');window.location.href ='welcome.jsp';}
            		if(qp.numQizi==(qp.Length-2)*(qp.Length-2)){alert('平局');window.location.href ='welcome.jsp';}
            	}
            									  }
        };//document.body.onclick
</script>
</body>
</html>