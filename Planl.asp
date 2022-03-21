<%@Language=VBScript%>
<%option explicit%>
<html>
<head>
	<meta http-Equiv="Cache-Control" Content="no-cache">
  	<meta http-Equiv="Pragma" Content="no-cache">
  	<meta http-Equiv="Expires" Content="0">
	<style type="text/css">
		map.Plan,area{
			outline:0;
		}
		button.light {
			background-color: transparent; 
			border-color: transparent;
			border-radius: 50%;
			size: 80%;
			outline:none;
			height: 30px;
			width: 30px;
			display: inline-block;
    		position:absolute;
		}
		img.lightI{
			top:0px;
			left:0px;
			padding:0;
			height: 30px;
			width: 30px;
    		position:absolute;
		}
		img.Fan{
			top:0px;
			left:0px;
			padding:0;
			height: 30px;
			width: 30px;
    		position:absolute;
		}
		p{
			color: transparent;
		}
	</style>	<script type="text/javascript" src="MyJavaScript.js"></script>
</head>
<body onload="Lights()">
	<%dim statL(7),i,con,rs,path,fs
	dim arrL(4),boo
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	path=Server.MapPath(".")
	path=path+"\Current.mdb"
	set con=Server.CreateObject("ADODB.connection")
	con.Provider="Microsoft.Jet.OLEDB.4.0"
	con.Open path
	set rs=Server.CreateObject("ADODB.RecordSet")
	rs.Open "Table1",con,0,3,2
	i=0
	for boo=0 to 3
		arrL(boo)=0
	next
	do until rs.EOF
		if rs("ID")=request.form("light") then
			if rs("Status")="True" then
				rs("Status")="False"
				rs("Brightness")=0
				rs("LightsC")=0*3
				rs.Update
			else
				rs("Status")="True"
				rs("Brightness")=3
				rs("LightsC")=3*3
				rs.Update
			end if	
		end if
	 	statL(i)=rs("Status")
	 	i=i+1
	 	rs("TotalC")=rs("LightsC")+rs("FanC")

		if rs("ID")="Living1" or rs("ID")="Living2" then
      		arrL(0)=arrL(0)+rs("LightsC")
    	elseif rs("ID")="Bed" or rs("ID")="Mbed" then
      		arrL(1)=arrL(1)+rs("LightsC")
     	elseif rs("ID")="Kitchen" or rs("ID")="Bath1" or rs("ID")="Bath2" then
      		arrL(2)=arrL(2)+rs("LightsC")
    	end if

		rs.Movenext
	loop
    arrL(3)=arrL(0)+arrL(2)+arrL(2)
	rs.close
	con.close
	set con=Nothing
	%>
<form method="post" action="Planl.asp">
	<img id="House" height="300" width="auto" src="House1.png" usemap="#plan" border="0" style="margin-left: 10px;"> 
	<map name="plan">
  		<area shape="rect" coords="47,38,205,130" alt="Bedroom" id="Bed" onclick="OnClickInFrame(this.id)">
  		<area shape="rect" coords="37,140,160,260" alt="MasterBed" id="Mbed" onclick="OnClickInFrame(this.id)">
  		<area shape="rect" coords="215,40,305,130" alt="Kitchen" id="Kitchen" onclick="OnClickInFrame(this.id)">
  		<area shape="rect" coords="172,175,215,260" alt="Bath1">
  		<area shape="rect" coords="225,175,275,260" alt="Bath2">
  		<area shape="poly" coords="315,40,418,40,418,260,288,260,288,170,315,170" alt="Living" id="Living" onclick="OnClickInFrame(this.id)">
  	</map>
	<button type="submit" class="light" name="light" style="top:185px;left:205px;height:25px;width:25px;" id="Bath1" value="Bath1"><img class="lightI" id="Bath1" style="height:25px;width:25px;" src="Theme1/light-off1.png"></button>
	<button type="submit" class="light" name="light" style="top:185px;left:265px;height:25px;width:25px;" id="Bath2" value="Bath2"><img class="lightI" id="Bath2" style="height:25px;width:25px;" src="Theme1/light-off1.png"></button>
	<button type="submit" class="light" name="light" style="top:50px;left:170px;" id="Bed" value="Bed"><img class="lightI" id="Bed" src="Theme1/light-off1.png"></button>
	<button type="submit" class="light" name="light" style="top:50px;left:285px;" id="Kitchen" value="Kitchen"><img class="lightI" id="Kitchen" src="Theme1/light-off1.png"></button>
	<button type="submit" class="light" name="light" style="top:60px;left:390px;" id="Living1" value="Living1"><img class="lightI" id="Living1" src="Theme1/light-off1.png"></button>
	<button type="submit" class="light" name="light" style="top:220px;left:390px;" id="Living2" value="Living2"><img class="lightI" id="Living2" src="Theme1/light-off1.png"></button>
	<button type="submit" class="light" name="light" style="top:230px;left:60px;" id="Mbed" value="Mbed"><img class="lightI" id="Mbed" src="Theme1/light-off1.png"></button>
	<p id="pL"><%for i=0 to 6%> <%response.write(statL(i)&" ")%> <%next%></p>	
	<p id="Watts"><%response.write(arrL(3)&" "&arrL(0)&" "&arrL(1)&" "&arrL(2))%></p>
</body>
</html>



