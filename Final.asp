<%@Language=VBScript%>
<%option explicit%>
<html>
<head>
  <meta http-Equiv="Cache-Control" Content="no-cache">
  <meta http-Equiv="Pragma" Content="no-cache">
  <meta http-Equiv="Expires" Content="0">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="Final.css">
</head>
<body>
<%dim con,rs,path,fs,arrL(4),arrF(4),arr(4),i
  set fs=Server.CreateObject("Scripting.FileSystemObject")
  path=Server.MapPath(".")
  path=path+"\Current.mdb"
  set con=Server.CreateObject("ADODB.connection")
  con.Provider="Microsoft.Jet.OLEDB.4.0"
  con.Open path
  set rs=Server.CreateObject("ADODB.RecordSet")
  rs.Open "Table1",con,0,3,2
  for i=0 to 4 
    arr(i)=0
    arrL(i)=0
    arrF(i)=0
  next
  do until rs.EOF
    if rs("ID")="Living1" or rs("ID")="Living2" then
      arr(0)=arr(0)+rs("TotalC")
      arrL(0)=arrL(0)+rs("LightsC")
      arrF(0)=arrF(0)+rs("FanC")
    elseif rs("ID")="Bed" or rs("ID")="Mbed" then
      arr(1)=arr(1)+rs("TotalC")
      arrL(1)=arrL(1)+rs("LightsC")
      arrF(1)=arrF(1)+rs("FanC")
     elseif rs("ID")="Kitchen" or rs("ID")="Bath1" or rs("ID")="Bath2" then
      arr(2)=arr(2)+rs("TotalC")
      arrL(2)=arrL(2)+rs("LightsC")
      arrF(2)=arrF(2)+rs("FanC")
    else
      arr(3)=arr(0)+arr(1)+arr(2)
      arrL(3)=arrL(0)+arrL(1)+arrL(2)
      arrF(3)=arrF(0)+arrF(1)+arrF(2)
    end if
  loop
  rs.close
  con.close
  set con=Nothing
  %>

<svg height="300" widt="auto">
    <linearGradient id="gradient" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop class="C1" offset="0%"/>
      <stop class="C2" offset="100%"/>
    </linearGradient>
    <circle class="Cir1" cx="160" cy="150" r="90" stroke-width="15" fill="none" transform='rotate(225 160 150)'/>
    <circle cx="160" cy="150" r="90" stroke="url(#gradient)" stroke-width="15" fill="none" transform='rotate(225 160 150)'stroke-dasharray="300,565.714"/>
  <text class="SvgText" x="160" y="150"  text-anchor="middle" alignment-baseline="central" font-size="35"><%response.write(arr(3))%>W</text>
</svg>

</body>
</html>


