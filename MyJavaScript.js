//START
function start()
{
    startTime();
    Initial();
}
//CLOCK
function startTime() {
    var today = new Date();
    var hr = today.getHours();
    var min = today.getMinutes();
    var sec = today.getSeconds();
    ap = (hr < 12) ? "<span>AM</span>" : "<span>PM</span>";
    hr = (hr == 0) ? 12 : hr;
    hr = (hr > 12) ? hr - 12 : hr;
    hr = checkTime(hr);
    min = checkTime(min);
    sec = checkTime(sec);
    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];
    var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    var curWeekDay = days[today.getDay()];
    var curDay = today.getDate();
    var curMonth = months[today.getMonth()];
    var curYear = today.getFullYear();
    var date = curWeekDay+" "+curMonth+" "+curDay+", "+curYear;
    document.getElementById("time").innerHTML=hr+":"+min+" "+ap;    
    document.getElementById("date").innerHTML=date;
    var time = setTimeout(function(){ startTime() }, 500);
  }
function checkTime(i) {
    if (i < 10)
        i = "0" + i;
    return i;
}

//THEMES
var path_to_icon="file:///home/esha/ESHA/V-SEM/WT/Project/Theme1/[img].png";

// function to set a given theme/color-scheme
function setTheme(themeName) {
    localStorage.setItem('theme', themeName);
        document.documentElement.className = themeName;
}
// function to toggle between light and dark theme
function toggleTheme() {
    var arr=document.getElementsByName("icon");
    if (localStorage.getItem('theme') === 'theme2') {
        document.getElementById("theme").innerHTML="Dark Theme";
        setTheme('theme1');
        for(i=0;i<arr.length;i++)
        {
            var path=document.getElementsByName('icon')[i].src;
            newp=path.replace("2","1");
            document.getElementsByName('icon')[i].src=newp;
        }
    } 
    else {
        document.getElementById("theme").innerHTML="Light Theme";
        setTheme('theme2');
        for(i=0;i<arr.length;i++)
        {
            var path=document.getElementsByName('icon')[i].src;
            newp=path.replace("1","2");
            document.getElementsByName('icon')[i].src=newp;
        }
    }
    document.getElementById("myFrame").src=document.getElementById("myFrame").src;
}
// Immediately invoked function to set the theme on initial load
(function () {
    if (localStorage.getItem('theme') === 'theme2') {
        setTheme('theme2');
        } else {
        setTheme('theme1');
        }
})();
function Initial() {
    var arr=document.getElementsByName("icon");
    if (localStorage.getItem('theme') === 'theme2') {
        document.getElementById("theme").innerHTML="Light Theme";
        for(i=0;i<arr.length;i++)
        {
            var path=document.getElementsByName('icon')[i].src;
            newp=path.replace("1","2");
            document.getElementsByName('icon')[i].src=newp;
        }
    } else {
        document.getElementById("theme").innerHTML="Dark Theme";
        for(i=0;i<arr.length;i++)
        {
            var path=document.getElementsByName('icon')[i].src;
            newp=path.replace("2","1");
            document.getElementsByName('icon')[i].src=newp;
        }
    }
}
function On_Click(Ids)
{
    if (Ids!="Dash")
    {   
        var iframe=Ids+".asp" ;
        document.getElementById("myFrame").src=iframe;        
    }    
    else
    {
        document.getElementById("myFrame").src=document.getElementsByClassName("active")[0].id+'.asp';
    }
    var p=document.getElementsByClassName("active")[1].innerHTML;
    var  newp= p.replace('W','');
    document.getElementsByClassName("active")[1].innerHTML = newp;
    document.getElementsByClassName("active")[1].className = "B";
    var p=document.getElementById(Ids).innerHTML;
    var  newp= p.replace('.','W.');
    document.getElementById(Ids).innerHTML = newp;
    document.getElementById(Ids).className = "active";
}
function OnClickInFrame(Ids)
{
    if (Ids!="Dash")
    {   
        var iframe=Ids+".asp" ;
        parent.document.getElementById("myFrame").src=iframe;        
    }
    var p=parent.document.getElementsByClassName("active")[1].innerHTML;
    var  newp= p.replace('W','');
    parent.document.getElementsByClassName("active")[1].innerHTML = newp;
    parent.document.getElementsByClassName("active")[1].className = "B";
    var p=parent.document.getElementById(Ids).innerHTML;
    var  newp= p.replace('.','W.');
    parent.document.getElementById(Ids).innerHTML = newp;
    parent.document.getElementById(Ids).className = "active";
}
function OFF() {
    var iframe=parent.document.getElementById("myFrame").src;
    parent.document.getElementById("myFrame").src="Off.asp"; 
}
function LF() 
{
    var on,off,onF,offF,onC,offC,onE,offE;
    if (localStorage.getItem('theme') === 'theme2')
    { 
        document.getElementById("House").src="House2.png";
        on="Theme2/light-on1.png";
        off="Theme2/light-off1.png";
        onF="Theme2/fan-speed.png";
        offF="Theme2/fan-speed-off.png";
        onC="Theme2/cc.png";
        offC="Theme2/cc-off.png";
        onE="Theme2/geyser.png";
        offE="Theme2/geyser-off.png";
    }
    if (localStorage.getItem('theme') === 'theme1')
    { 
        document.getElementById("House").src="House1.png";
        on="Theme1/light-on1.png";
        off="Theme1/light-off1.png";
        onF="Theme1/fan-speed.png";
        offF="Theme1/fan-speed-off.png";
        onC="Theme1/cc.png";
        offC="Theme1/cc-off.png";
        onE="Theme1/geyser.png";
        offE="Theme1/geyser-off.png";
    }
    var str=document.getElementById("pL").innerHTML;
    var l = str.split(" ");
    var arr=document.getElementsByClassName("lightI");
    for(i=0;i<arr.length;i++)
    {   
        if(l[i]=="True")
        {
            document.getElementsByClassName("lightI")[i].src=on;
            document.getElementsByClassName("lightI")[i].style.borderColor="#FFBD3D";
        }
        else
        {
            document.getElementsByClassName("lightI")[i].src=off;
            document.getElementsByClassName("lightI")[i].style.borderColor="#949494";
        }
    }
    var strF=document.getElementById("pF").innerHTML;
    var lF = strF.split(" ");
    var arrF=document.getElementsByClassName("Fan");
    for(i=0;i<arrF.length;i++)
    {   
        if(lF[i]=="True")
        {
            document.getElementsByClassName("Fan")[i].src=onF;
        }
        else
        {
            document.getElementsByClassName("Fan")[i].src=offF;
        }
    }
    var strE=document.getElementById("pE").innerHTML;
    var lE = strE.split(" ");
    if(lE[0]=="True")
        document.getElementsByName("Extras")[0].src=onE;
    else
        document.getElementsByName("Extras")[0].src=offE;
    if(lE[1]=="True")
        document.getElementsByName("Extras")[1].src=onC;
    else
        document.getElementsByName("Extras")[1].src=offC;
    Watts("LF");
}
function Lights() 
{
    var on,off;
    if (localStorage.getItem('theme') === 'theme2')
    { 
        document.getElementById("House").src="House2.png";
        on="Theme2/light-on1.png";
        off="Theme2/light-off1.png";
    }
    if (localStorage.getItem('theme') === 'theme1')
    { 
        document.getElementById("House").src="House1.png";
        on="Theme1/light-on1.png";
        off="Theme1/light-off1.png";
    }
    var str=document.getElementById("pL").innerHTML;
    var l = str.split(" ");
    var arr=document.getElementsByClassName("lightI");
    for(i=0;i<arr.length;i++)
    {   
        if(l[i]=="True")
        {
            document.getElementsByClassName("lightI")[i].src=on;
            document.getElementsByClassName("lightI")[i].style.borderColor="#FFBD3D";
        }
        else
        {
            document.getElementsByClassName("lightI")[i].src=off;
            document.getElementsByClassName("lightI")[i].style.borderColor="#949494";
        }
    }
    Watts("Lights");
}
function Fans()
{
    var onF,offF,onC,offC,onE,offE;
    if (localStorage.getItem('theme') === 'theme2')
    { 
        document.getElementById("House").src="House2.png";
        onF="Theme2/fan-speed.png";
        offF="Theme2/fan-speed-off.png";
        onC="Theme2/cc.png";
        offC="Theme2/cc-off.png";
        onE="Theme2/geyser.png";
        offE="Theme2/geyser-off.png";
    }
    if (localStorage.getItem('theme') === 'theme1')
    { 
        document.getElementById("House").src="House1.png";
        onF="Theme1/fan-speed.png";
        offF="Theme1/fan-speed-off.png";
        onC="Theme1/cc.png";
        offC="Theme1/cc-off.png";
        onE="Theme1/geyser.png";
        offE="Theme1/geyser-off.png";
    }
    var strF=document.getElementById("pF").innerHTML;
    var lF = strF.split(" ");
    var arrF=document.getElementsByClassName("Fan");
    for(i=0;i<arrF.length;i++)
    {   
        if(lF[i]=="True")
        {
            document.getElementsByClassName("Fan")[i].src=onF;
        }
        else
        {
            document.getElementsByClassName("Fan")[i].src=offF;
        }
    }
    var strE=document.getElementById("pE").innerHTML;
    var lE = strE.split(" ");
    if(lE[0]=="True")
        document.getElementsByName("Extras")[0].src=onE;
    else
        document.getElementsByName("Extras")[0].src=offE;
    if(lE[1]=="True")
        document.getElementsByName("Extras")[1].src=onC;
    else
        document.getElementsByName("Extras")[1].src=offC;
    Watts("Fans");
}
var color=["red", "darkorange", "yellow", "lime", "cyan", "blue", "darkorchid", "deeppink", "white"];
var op=['0', '50', '75', '90', '120'];
function Slide(n){
    if (localStorage.getItem('theme') === 'theme2')
    {   
        document.getElementById("FAN").src="Theme2/fan-speed.png";
        if(n==="Living")
            document.getElementById("CC").src="Theme2/cc.png";
    }
    if (localStorage.getItem('theme') === 'theme1')
    {
        document.getElementById("FAN").src="Theme1/fan-speed.png";
        if(n==="Living")
            document.getElementById("CC").src="Theme1/cc.png";
    }
    var ids="Inputs";
    var str=document.getElementById("pt").innerHTML;
    var l = str.split(", ");
    var ct=0;
    var p,bg;
    for(i=0;i<l.length-1;i++)
        document.getElementsByName(ids)[i].value=l[i];
    document.getElementById("fan").innerHTML=document.getElementById("Fan").value;
    if(n==="Living")
    {
        document.getElementById("cc").innerHTML=document.getElementById("Cc").value+"&degC";
        parent.document.getElementById("Temperature").innerHTML="Temperature: "+document.getElementById("Cc").value+"&degC";
    }
    for(i=0;i<l.length-1;i++)
    {
        if(i<2)
        { 
            p=op[l[ct]];
            ct++;
            if(p=='0')
                bg='background-image:radial-gradient(black,transparent 75%)';                
            else
                bg='background-image:radial-gradient('+color[l[ct]]+',transparent '+p+'%)';
            document.getElementsByName("Light")[i].style=bg;
            ct++; 
        }
    }
    Watts(n); 
}
function Change(ids) 
{
    document.getElementById("myFrame").src=ids+'.asp'; 
    document.getElementsByClassName("active")[0].className=document.getElementById(ids).className;
    document.getElementById(ids).className="active"; 
    document.getElementsByClassName("active")[2].className=document.getElementById(ids).className;
    document.getElementById(ids).className="active";
}
function Watts(names)
{
    var arr=[],stroke=[],max=534.286,semimax=267.143,val,max1=565.714;
    var watt=document.getElementById("Watts").innerHTML;
    var l = watt.split(" ");
    if(names=="LF")
    {
        arr[0]=5305;
        arr[1]=2080;
        arr[2]=130;
        arr[3]=3095;
    }
    else if(names=="Lights")
    {
        arr[0]=105;
        arr[1]=30;
        arr[2]=30;
        arr[3]=45;
    }
    else if(names=="Fans")
    {
        arr[0]=5200;
        arr[1]=2050;
        arr[2]=100;
        arr[3]=3050;
    }
    stroke[0]=(l[0]/arr[0])*max1;
    for(i=1;i<4;i++)
        stroke[i]=(l[i]/arr[i])*semimax;
    parent.document.getElementById("System").innerHTML=l[0]+" W";
    parent.document.getElementById("Sys").style.strokeDasharray=stroke[0]+","+max1;

    parent.document.getElementById("SysLiving").innerHTML=l[1]+" W";
    parent.document.getElementById("SysL").style.strokeDasharray=stroke[1]+","+max;
    parent.document.getElementById("MaxL").innerHTML=arr[1]+" W";

    parent.document.getElementById("SysBed").innerHTML=l[2]+" W";
    parent.document.getElementById("SysB").style.strokeDasharray=stroke[2]+","+max;
    parent.document.getElementById("MaxB").innerHTML=arr[2]+" W";

    parent.document.getElementById("SysKitchen").innerHTML=l[3]+" W";
    parent.document.getElementById("SysK").style.strokeDasharray=stroke[3]+","+max;    
    parent.document.getElementById("MaxK").innerHTML=arr[3]+" W";

    if(names=="LF" || name=="Fans")
        parent.document.getElementById("Temperature").innerHTML="Temperature: "+document.getElementById("Temp").innerHTML+"&degC";   
}