<%@Language=VBScript%>
<%option explicit%>
<html>
<head>
	<meta http-Equiv="Cache-Control" Content="no-cache">
  	<meta http-Equiv="Pragma" Content="no-cache">
  	<meta http-Equiv="Expires" Content="0">
  	<link rel="stylesheet" type="text/css" href="Iframes.css">
	<script type="text/javascript" src="MyJavaScript.js"></script>
</head>
<body onload="Slide('Mbed')">
	<%dim stat,i,con,rs,path,fs,a(3),s
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	path=Server.MapPath(".")
	path=path+"\Current.mdb"
	set con=Server.CreateObject("ADODB.connection")
	con.Provider="Microsoft.Jet.OLEDB.4.0"
	con.Open path
	set rs=Server.CreateObject("ADODB.RecordSet")
	rs.Open "Table1",con,0,3,2
	stat=request.form("Inputs")
	s=1
	for i=0 to 2
		a(i)=Mid(stat,s,1)
		s=s+3
	next
	if isNumeric(a(0)) then
	do until rs.EOF
		if rs("ID")="Mbed" then
			rs("Brightness")=a(0)
			rs("LightsC")=a(0)*3
			rs("Color")=a(1)
			rs("Speed")=a(2)
			rs("FanC")=a(2)*10
			rs.Update
		end if
		rs.Movenext
	loop
	else
	do until rs.EOF
		if rs("ID")="Mbed" then
			a(0)=rs("Brightness")
			a(1)=rs("Color")
			a(2)=rs("Speed")
		end if
		rs("TotalC")=rs("LightsC")+rs("FanC")
		rs.Movenext
	loop
	end if
	rs.close
	con.close
	set con=Nothing
	%>
	<h3>Master Bedroom</h3>
	<form method="post" action="Mbed.asp">
		<div class="Page">
			<div class="Outer">	
				<div class="Inner">
					<button type="submit" class="light" name="Light"><img class="lightI" id="1" src="Theme2/light-off1.png"></button><br>
				</div>
				<button class="slidercontainer1">
					<input type="range" class="slider1" name="Inputs" min="0" max="4" value="1">
				</button>
				<button class="slidercontainer2">
					<input type="range" class="slider2" name="Inputs" min="0" max="8" value="2">
				</button>
			</div>
			<div class="Outer" style="width:30%;">	
				<div class="Inner">
					<button type="submit" class="light" name="Fan"><img class="lightI" id="FAN" src="Theme1/fan-speed.png"></button><br>
				</div>
				<button class="slidercontainer3">
					<input type="range" class="slider3" id="Fan" name="Inputs" min="0" max="4" value="3">
					<span class="range_value" name="speed" id="fan"></span>
				</button>
			</div>
		</div>
		<p  class="pt" style="color: transparent;" id="pt"><%for i=0 to 2%><%response.write(a(i)&", ")%><%next%></p>
</body>
</html>



 