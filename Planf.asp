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
		img.CC{
			top:0px;
			left:0px;
			padding:0;
			height: 40px;
			width: auto;
    		position:absolute;
		}
		img.Geyser{
			top:0px;
			left:0px;
			padding:0;
			height: 40px;
			width: auto;
    		position:absolute;
		}
		p{
			color: transparent;
		}
	</style>	<script type="text/javascript" src="MyJavaScript.js"></script>
</head>
<body onload="Fans()">
	<%dim statF(4),room(4),ex(2),ep(2),i,j,con,rs,path,fs,temp
	dim arrF(4),boo
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	path=Server.MapPath(".")
	path=path+"\Current.mdb"
	set con=Server.CreateObject("ADODB.connection")
	con.Provider="Microsoft.Jet.OLEDB.4.0"
	con.Open path
	set rs=Server.CreateObject("ADODB.RecordSet")
	rs.Open "Table1",con,0,3,2
	room(0)="Bed"
	room(1)="Kitchen"
	room(2)="Living2"
	room(3)="Mbed"
	ex(0)="Bath1"
	ex(1)="Living1"
	i=0
	j=0
	for boo=0 to 3
		arrF(boo)=0
	next
	do until rs.EOF
	 	i=i+1
		if rs("ID")=request.form("Fan") then
			if rs("Fan")="True" then
				rs("Fan")="False"
				rs("Speed")=0
				rs("FanC")=0*10
				rs.Update
			else
				rs("Fan")="True"
				if request.form("Fan")=ep(1) then
					rs("Speed")=rs("Speed")
				else
					rs("Speed")=3
					rs("FanC")=3*10
				end if
				rs.Update
			end if	
		end if
		if rs("ID")=ex(0) then
			ep(0)=rs("Fan")
			if rs("Fan")="False" then
				rs("FanC")=0
			else
				rs("FanC")=3000
			end if
		elseif rs("ID")=ex(1) then
			ep(1)=rs("Fan")
			if rs("Fan")="False" then
				rs("FanC")=0
				rs("Speed")=0
			else
				rs("Speed")=24
				rs("FanC")=2000
			end if
			temp=rs("Speed")
		elseif rs("ID")=room(j) then
			statF(j)=rs("Fan")
			j=j+1
		end if

		rs("TotalC")=rs("LightsC")+rs("FanC")

		if rs("ID")="Living1" or rs("ID")="Living2" then
     	 	arrF(0)=arrF(0)+rs("FanC")
    	elseif rs("ID")="Bed" or rs("ID")="Mbed" then
      		arrF(1)=arrF(1)+rs("FanC")
     	elseif rs("ID")="Kitchen" or rs("ID")="Bath1" or rs("ID")="Bath2" then
      		arrF(2)=arrF(2)+rs("FanC")
    	end if
		rs.Movenext
	loop
    arrF(3)=arrF(0)+arrF(1)+arrF(2)
	rs.close
	con.close
	set con=Nothing
	%>
<form method="post" action="Planf.asp">
	<img id="House" height="300" width="auto" src="House1.png" usemap="#plan" border="0" style="margin-left: 10px;"> 
	<map name="plan">
  		<area shape="rect" coords="47,38,205,130" alt="Bedroom" id="Bed" onclick="OnClickInFrame(this.id)">
  		<area shape="rect" coords="37,140,160,260" alt="MasterBed" id="Mbed" onclick="OnClickInFrame(this.id)">
  		<area shape="rect" coords="215,40,305,130" alt="Kitchen" id="Kitchen" onclick="OnClickInFrame(this.id)">
  		<area shape="rect" coords="172,175,215,260" alt="Bath1">
  		<area shape="rect" coords="225,175,275,260" alt="Bath2">
  		<area shape="poly" coords="315,40,418,40,418,260,288,260,288,170,315,170" alt="Living" id="Living" onclick="OnClickInFrame(this.id)">
  	</map>
  	<button type="submit" class="light" name="Fan" style="top:230px;left:230px;" id="Bath1" value="Bath1"><img class="Geyser" name="Extras" id="Bath1" src="Theme1/geyser-off.png"></button>
	<button type="submit" class="light" name="Fan" style="top:95px;left:120px;" id="Bed" value="Bed"><img class="Fan" id="Bed" src="Theme1/fan-speed-off.png"></button>
	<button type="submit" class="light" name="Fan" style="top:95px;left:260px;" id="Kitchen" value="Kitchen"><img class="Fan" id="Kitchen" src="Theme1/fan-speed-off.png"></button>
	<button type="submit" class="light" name="Fan" style="top:90px;left:330px;" id="Living1" value="Living1"><img class="CC" name="Extras" id="Living1" src="Theme1/cc-off.png"></button>
	<button type="submit" class="light" name="Fan" style="top:180px;left:365px;" id="Living2" value="Living2"><img class="Fan" id="Living2" src="Theme1/fan-speed-off.png"></button>
	<button type="submit" class="light" name="Fan" style="top:170px;left:100px;" id="Mbed" value="Mbed"><img class="Fan" id="Mbed" src="Theme1/fan-speed-off.png"></button>
	<p id="pF"><%for j=0 to 3%> <%response.write(statF(j)&" ")%> <%next%></p>
	<p id="pE"><%for j=0 to 1%> <%response.write(ep(j)&" ")%> <%next%></p>
	<p id="Watts"><%response.write(arrF(3)&" "&arrF(0)&" "&arrF(1)&" "&arrF(2))%></p>
	<p id="Temp"><%response.write(temp)%></p>
</body>
</html>



