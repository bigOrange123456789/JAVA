<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录页面</title>
</head>
<body>
<font size=14>
请编辑您的个人名片 </br></br></br>
<img src="card/addImg2.png" alt=""></img>
</font>
<script>
//div面板
function div(width,height){
	var oPanel=document.createElement('div');
	oPanel.style.cssText='width:300px;'+
	   'background:#01f;'+//背景颜色
	   'width:'+width+'px;height:'+height+'px;'+//面板大小
	   'border:10px solid #fff;'+//显示边框
	   //'margin:50px auto;'+//居于窗口中间
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
function H1(html,color,size,parentNode){//文本
	this.html=html;this.color=color;this.size=size;
	this.oText=h1(html,color,size,parentNode);
	this.reText=function(text){
		this.text=text;
		this.oText=h1(html,color,size,parentNode);
	}	
}
//var oPanel=new Div(200,200);//div面板
//var oText=new H1('','#e00',50,oPanel.panel);
//var oText=new H1('点击添加头像','#e00',50,oPanel.panel);
</script>

<font size=7>
		<form action="avatarSelect.jsp"method="get">            
				         真实姓名：<input type="text" name="user"value="" style="font-size:30px;width:200px;height:35px"/></br>  
		 	职&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp业：<input type="text" name="user"value="" style="font-size:30px;width:200px;height:35px"/></br>  
				   个人简介：<input type="text" name="pwd"value="" style="font-size:30px;width:200px;height:35px"/></br> 
&nbsp&nbsp&nbsp&nbsp<input type="submit" value="保存" style="font-size:40px;width:150px;height:70px">
				<button type="button" id="button0"style="font-size:40px;width:150px;height:70px"><font size=7>取消</font></button></br>
		</form>
</font>

<script>
window.onload=function(){
	    var o_btn=document.getElementById("button0");
	    o_btn.addEventListener("click",function(){
	    		window.location.href='avatarSelect.jsp';
	    			   },false)
}  
</script>

</body>
</html>