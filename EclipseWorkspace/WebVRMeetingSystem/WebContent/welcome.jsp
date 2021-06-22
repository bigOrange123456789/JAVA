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
欢迎使用WebVR会议系统</br></br></br>  

<font size=7>
		<form action="avatarSelect.jsp"method="post">            
				         手机号：<input type="text" name="user"value="" style="font-size:30px;width:200px;height:35px"/></br>  
				   <input type="text" name="pwd"value="" style="font-size:30px;width:200px;height:35px"/><button type="button" id="button0"><font size=6>获取验证码</font></button></br></br> 
&nbsp&nbsp&nbsp&nbsp<input type="submit" value="登录" style="font-size:40px;width:250px;height:70px">
		</form>
</font>

<script>
window.onload=function(){
	    var o_btn=document.getElementById("button0");
	    o_btn.addEventListener("click",function(){
	    		alert("验证码已发送，请注意查收！")
	    			   },false)
}  
</script>

</body>
</html>