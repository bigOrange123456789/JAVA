<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>会议场景的创建与管理</title>
</head>
<body>
<font size=5>

<button id="btn0"type="button0"style="font-size:25px;width:180px;height:55px">新建场景</button>
<button id="btn1"type="button1"style="font-size:20px;width:180px;height:35px">我创建的场景</button>
<div id="container"></div>


<br/><br/> 
<form action="avatarSelect.jsp"method="post">  
<input type="submit" value="返回" style="font-size:20px;width:200px;height:40px"></br>
</form> 


	<script>
	function change1(){
		document.getElementById('btn0').style="font-size:25px;width:180px;height:55px";
		document.getElementById('btn1').style="font-size:20px;width:180px;height:35px";
		document.getElementById("container").innerHTML = tbl1;
	}
	function change2(){
		btn0.style="font-size:20px;width:180px;height:35px";
		btn1.style="font-size:25px;width:180px;height:55px";
		document.getElementById("container").innerHTML = tbl2;
	}
	var tbl1 = "<table border='1'>";
		for (var i = 0; i < 4; i++) {
			var td = "";
			for (var j = 0; j < 4; j++) {
					td = td + "<td>" + "<img id='img0'src='roomCreate/room.png' onclick=change2()>" + "</td>";
			}
		tbl1 = tbl1 + "<tr>" + td+ "</tr>";
		}
	tbl1 = tbl1 + "</table>";
	var tbl2 = "<table border='1'>";
	for (var i = 0; i < 1; i++) {
		var td = "";
		for (var j = 0; j < 3; j++) {
				td = td + "<td>" + "<a href='meeting.jsp'><img src='roomCreate/room.png'></a>" + "</td>";
		}
		tbl2 = tbl2 +"<tr>"+td +"</tr>";
	}
	tbl2 = tbl2 + "</table>";
	document.getElementById("container").innerHTML = tbl1;
	var btn0=document.getElementById('btn0');
	var btn1=document.getElementById('btn1');
	btn0.onclick = function(){
		change1();
	};
	btn1.onclick = function(){
		change2();
	};	
	
	</script>

</font>

</body>
</html>