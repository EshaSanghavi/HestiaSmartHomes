<%@Language=VBScript%>
<%option explicit%>
<html>
<head>
	<meta http-Equiv="Cache-Control" Content="no-cache">
  	<meta http-Equiv="Pragma" Content="no-cache">
  	<meta http-Equiv="Expires" Content="0">
  	<script type="text/javascript" src="MyJavaScript.js"></script>
</head>
<body>
<%dim con,rs,path,fs
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	path=Server.MapPath(".")
	path=path+"\Current.mdb"
	set con=Server.CreateObject("ADODB.connection")
	con.Provider="Microsoft.Jet.OLEDB.4.0"
	con.Open path
	set rs=Server.CreateObject("ADODB.RecordSet")
	rs.Open "Table1",con,0,3,2
	do until rs.EOF
		rs("Status")="False"
		rs("Brightness")=0
		rs("LightsC")=0
		rs("Fan")="False"
		rs("Fanc")=0
		if rs("ID")<>"Bath1" or rs("ID")<>"Living1" then
			rs("Speed")=0
		else
			rs("Speed")=24
		end if
		rs("TotalC")=rs("LightsC")+rs("Fanc")
		rs.Update
		rs.Movenext
	loop
	con.close
	set con=Nothing
	response.Redirect("Plan.asp")
%>
</body>
</html>



