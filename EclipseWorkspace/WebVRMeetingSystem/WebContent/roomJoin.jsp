<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>加入房间</title>
</head>
<body>
<font size=5>

<form action="roomJoin.jsp"method="get">  
<select name="cars" style="font-size:20px;width:180px;height:35px">
	<option value="city">会议检索方式</option>
　　<option value="city">通过会议ID</option>
　　<option value="hefei">通过会议名称</option> 
</select>           
<input type="text" name="tableName"value="" style="font-size:30px;width:100px;height:35px"/> 
<input type="submit" value="查询" style="font-size:20px;width:200px;height:40px"></br> 
</form>


	<div id="container"></div>
	<script>
	var data0=['会议ID','会议名称',''];
	var data1=[data0,['1001','上海VR大会',''],['1003','北京AR大会','']];
	var tbl = "<table border='1'>";
		for (var i = 0; i < data1.length; i++) {
			var td = "";
			for (var j = 0; j < data0.length; j++) {
					td = td + "<td>" + data1[i][j] + "</td>";
			}
			tbl = tbl + "<tr>" + td   
			+"<th>"
			+ "<form action='meeting.jsp'method='get'><input type='submit' value='加入会议' style='font-size:20px;width:100px;height:40px'></form>"
			+ "</th>"
			  + "</tr>";
		}
		tbl = tbl + "</table>";
	document.getElementById("container").innerHTML = tbl;
	</script>

<br/><br/> 
<form action="avatarSelect.jsp"method="get">  
<input type="submit" value="返回" style="font-size:20px;width:200px;height:40px"></br>
</form> 
</font>
</body>
</html>