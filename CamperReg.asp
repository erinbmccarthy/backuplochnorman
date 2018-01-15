<% If (CStr(Request("XYzy")) = "goaway") Then %>
<%
Const cdoSendUsingPickup = 1
Const cdoSendUsingPort = 2
Const cdoAnonymous = 0 
Const cdoBasic = 1 
Const cdoNTLM = 2 
Set oMail = CreateObject("CDO.Message") 

oMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusing") = 1
oMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "72.18.132.194"
oMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = cdoBasic
oMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusername") = "webmaster@ruralhill.net"
oMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "mario1"
oMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
oMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False
oMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
oMail.Configuration.Fields.Update 
	
oMail.Sender = "webmaster@ruralhill.net" 
oMail.From = "webmaster@ruralhill.net"
oMail.To = "mvandivier@ruralhill.net"
oMail.Cc = "office@ruralhill.net"
oMail.Bcc = "webwizard@carolina.rr.com"
'oMail.Bcc = "jeff@jeffpblues.com"

oMail.Subject = "LNHG Camper Registration"

oMail.HTMLBody = "<font size='2' face='Verdana, Arial, Helvetica, sans-serif'>"
oMail.HTMLBody = oMail.HTMLBody + "Date: <b>"& Date() &"</b><br><br>"

oMail.HTMLBody = oMail.HTMLBody + "Name: <b>"& request.form("Name")&"</b><br>"
oMail.HTMLBody = oMail.HTMLBody + "Address: <b>"& request.form("Address")&"</b><br>"
oMail.HTMLBody = oMail.HTMLBody + "City: <b>"& request.form("City")&"</b><br>"
oMail.HTMLBody = oMail.HTMLBody + "State: <b>"& request.form("State")&"</b><br>"
oMail.HTMLBody = oMail.HTMLBody + "Zip: <b>"& request.form("ZipCode")&"</b><br>"
oMail.HTMLBody = oMail.HTMLBody + "Work Phone: <b>"& request.form("WorkPhone")&"</b><br>"
oMail.HTMLBody = oMail.HTMLBody + "Home Phone: <b>"& request.form("HomePhone")&"</b><br>"
oMail.HTMLBody = oMail.HTMLBody + "Email: <b>"& request.form("Email")&"</b><br>"
oMail.HTMLBody = oMail.HTMLBody + "Date Arriving: <b>"& request.form("DateArriving")&"</b><br>"
oMail.HTMLBody = oMail.HTMLBody + "Time of Arrival: <b>"& request.form("Time")&"</b><br><br>"

oMail.HTMLBody = oMail.HTMLBody + "I am not required to purchase tickets because I am (Check One)<br>"
if request.form("LP") = "Yes" then
oMail.HTMLBody = oMail.HTMLBody + "<b>Life Patron or Patron</b><br>"
end if

if request.form("CS") = "Yes" then
oMail.HTMLBody = oMail.HTMLBody + "<b>Clan Sponsor</b><br>"
end if

if request.form("Part") = "Yes" then
oMail.HTMLBody = oMail.HTMLBody + "<b>Participant</b>, Event: <b>" & request.form("Event") & "</b><br>"
end if

if request.form("Vol") = "Yes" then
oMail.HTMLBody = oMail.HTMLBody + "<b>Volunteer</b>, Area: <b>" & request.form("Area") & "</b><br>"
end if

if request.form("Other") = "Yes" then
oMail.HTMLBody = oMail.HTMLBody + "<b>Other</b>, Event: <b>" & request.form("Describe") & "</b><br>"
end if

oMail.HTMLBody = oMail.HTMLBody + "</font>"
	
oMail.Send 

Set oMail = Nothing 
Set oMailConfig = Nothing 

%>
<% end if %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Rural Hill Scottish Festival & Loch Norman Highland Games</title>
<script language="JavaScript1.2" type="text/javascript" src="mm_css_menu.js"></script>
<link rel="stylesheet" type="text/css" href="global.css">
<link rel="stylesheet" type="text/css" href="nav.css">
<script type="text/javascript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/stepcarousel.js">

/***********************************************
* Step Carousel Viewer script- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* Visit http://www.dynamicDrive.com for hundreds of DHTML scripts
* This notice must stay intact for legal use
***********************************************/

</script>
<script type="text/javascript">

stepcarousel.setup({
	galleryid: 'mygallery', //id of carousel DIV
	beltclass: 'belt', //class of inner "belt" DIV containing all the panel DIVs
	panelclass: 'panel', //class of panel DIVs each holding content
	autostep: {enable:true, moveby:1, pause:5000},
	panelbehavior: {speed:500, wraparound:true, persist:true},
	defaultbuttons: {enable: false, moveby: 1, leftnav: ['images/leftnav.gif', 12, 6], rightnav: ['images/rightnav.gif', -53, 6]},
	statusvars: ['statusA', 'statusB', 'statusC'], //register 3 variables that contain current panel (start), current panel (last), and total panels
	contenttype: ['inline'] //content setting ['inline'] or ['ajax', 'path_to_external_file']
})

</script>
<style type="text/css">

.stepcarousel{
position: relative; /*leave this value alone*/
/* border: 10px solid black; */
overflow: scroll; /*leave this value alone*/
width: 240px; /*Width of Carousel Viewer itself*/
height: 136px; /*Height should enough to fit largest content's height*/
}

.stepcarousel .belt{
position: absolute; /*leave this value alone*/
left: 0;
top: 0;
}

.stepcarousel .panel{
float: left; /*leave this value alone*/
overflow: hidden; /*clip content that go outside dimensions of holding panel DIV*/
margin: 0px; /*margin around each panel*/
width: 240px; /*Width of each panel holding each content. If removed, widths should be individually defined on each content DIV then. */
}
div.Section1
	{page:Section1;}
</style>
<!-- InstanceBeginEditable name="head" --> 
<script language="JavaScript" type="text/javascript">
	function calculate01 (what) {
	
	what.form.subt1.value = currency(what.form.VARQuantity01.value * what.form.ns1.value * 12);
	what.form.AppendItemCamp_Reg001.value = "ruralhill| 2 Man Tent(s), 56 sq. ft., " + what.form.ns1.value +  " nights|+" + ((what.form.VARQuantity01.value * what.form.ns1.value * 12)/what.form.VARQuantity01.value);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculate02 (what) {
	
	what.form.subt2.value = currency(what.form.VARQuantity02.value * what.form.ns2.value * 17);
	what.form.AppendItemCamp_Reg002.value = "ruralhill| 4 Man Tent(s), 80 sq. ft., " + what.form.ns2.value +  " nights|+" + ((what.form.VARQuantity02.value * what.form.ns2.value * 17)/what.form.VARQuantity02.value);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculate10 (what) {
	
	what.form.subt10.value = currency(what.form.VARQuantity10.value * what.form.ns10.value * 22);
	what.form.AppendItemCamp_Reg010.value = "ruralhill| 6 Man Tent, 100 sq. ft., " + what.form.ns10.value +  " nights|+" + ((what.form.VARQuantity10.value * what.form.ns10.value * 22)/what.form.VARQuantity10.value);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculate11 (what) {
	
	what.form.subt11.value = currency(what.form.VARQuantity11.value * what.form.ns11.value * 27);
	what.form.AppendItemCamp_Reg011.value = "ruralhill| 8 Man Tent, 160 sq. ft., " + what.form.ns11.value +  " nights|+" + ((what.form.VARQuantity11.value * what.form.ns11.value * 27)/what.form.VARQuantity11.value);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculate12 (what) {
	
	what.form.subt12.value = currency(what.form.VARQuantity12.value * what.form.ns12.value * 32);
	what.form.AppendItemCamp_Reg012.value = "ruralhill| 10 Man Tent, 200 sq. ft., " + what.form.ns11.value +  " nights|+" + ((what.form.VARQuantity12.value * what.form.ns12.value * 32)/what.form.VARQuantity12.value);

	}
</script>





<script language="JavaScript" type="text/javascript">
	function calculate03 (what) {
	
	what.form.subt3.value = currency(what.form.VARQuantity03.value * what.form.ns3.value * 35);
	what.form.AppendItemCamp_Reg003.value = "ruralhill| Pop-Ups/Pick-Ups up to 160sq. ft., " + what.form.ns3.value +  " nights|+" + ((what.form.VARQuantity03.value * what.form.ns3.value * 35)/what.form.VARQuantity03.value);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculate04 (what) {
	
	what.form.subt4.value = currency(what.form.VARQuantity04.value * what.form.ns4.value * 30);
	what.form.AppendItemCamp_Reg004.value = "ruralhill| Self-contained Units up to 20', " + what.form.ns4.value +  " nights|+" + ((what.form.VARQuantity04.value * what.form.ns4.value * 30)/what.form.VARQuantity04.value);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculate05 (what) {
	
	what.form.subt5.value = currency(what.form.VARQuantity05.value * what.form.ns5.value * 40);
	what.form.AppendItemCamp_Reg005.value = "ruralhill| Self-contained Units 20'-24', " + what.form.ns5.value +  " nights|+" + ((what.form.VARQuantity05.value * what.form.ns5.value * 40)/what.form.VARQuantity05.value);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculate06 (what) {
	
	what.form.subt6.value = currency(what.form.VARQuantity06.value * what.form.ns6.value * 45);
	what.form.AppendItemCamp_Reg006.value = "ruralhill| Self-contained Units 25'-30', " + what.form.ns6.value +  " nights|+" + ((what.form.VARQuantity06.value * what.form.ns6.value * 45)/what.form.VARQuantity06.value);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculate07 (what) {
	
	what.form.subt7.value = currency(what.form.VARQuantity07.value * what.form.ns7.value * 50);
	what.form.AppendItemCamp_Reg007.value = "ruralhill| Self-contained Units 31' and Up, " + what.form.ns7.value +  " nights|+" + ((what.form.VARQuantity07.value * what.form.ns7.value * 50)/what.form.VARQuantity07.value);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculate (what) {

	what.form.sub3.value = currency(what.form.VARTixQuantity08.value * 25);

	}
</script>

<script language="JavaScript" type="text/javascript">
	function calculateT (what) {

	what.form.sub6.value = currency(what.form.VARTixQuantity09.value * 12);

	}
</script>

<script language="JavaScript" type="text/javascript">
<!--
//-- JavaScript code written by Alan Simpson - www.coolnerds.com
function currency(anynum) {
   //-- Returns passed number as string in $xxx,xxx.xx format.
   anynum=eval(anynum)
   workNum=Math.abs((Math.round(anynum*100)/100));workStr=""+workNum
   if (workStr.indexOf(".")==-1){workStr+=".00"}
   dStr=workStr.substr(0,workStr.indexOf("."));dNum=dStr-0
   pStr=workStr.substr(workStr.indexOf("."))
   while (pStr.length<3){pStr+="0"}

   //--- Adds comma in thousands place.
   if (dNum>=1000) {
      dLen=dStr.length
      dStr=parseInt(""+(dNum/1000))+","+dStr.substring(dLen-3,dLen)
   }

   //-- Adds comma in millions place.
   if (dNum>=1000000) {
      dLen=dStr.length
      dStr=parseInt(""+(dNum/1000000))+","+dStr.substring(dLen-7,dLen)
   }
   retval = dStr + pStr 
   //-- Put numbers in parentheses if negative.
   if (anynum<0) {retval="("+retval+")"}
   return retval
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('images/navOver_02.jpg','images/navOver_03.jpg','images/navOver_04.jpg','images/navOver_05.jpg','images/navOver_06.jpg','images/navOver_07.jpg','images/navOver_08.jpg','images/footerOver_03.gif','images/footerOver_04.gif','images/footerOver_05.gif','images/footerOver_06.gif','images/footerOver_07.gif','images/footerOver_09.gif','images/footerOver_10.gif','images/footerOver_11.gif','images/footerOver_12.gif','images/footerOver_13.gif','images/footerOver_14.gif','images/footerOver_15.gif','images/footerOver_16.gif','images/footerOver_17.gif','images/footerOver_18.gif','images/footerOver_19.gif','images/footerOver_20.gif','images/footerOver_21.gif','images/footerOver_22.gif')">
<div align="center">
<!--#include file="header.asp" -->
<!--#include file="nav.asp" --> 
<table width="772" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><img src="images/body_01.png" width="772" height="25" alt="" /></td>
  </tr>
  <tr>
    <td width="30" background="images/body_02.png">&nbsp;</td>
    <td width="711" align="left" valign="top" bgcolor="#EDE4D8">
    <!-- InstanceBeginEditable name="text" -->
    <!--#include file="FeaturedSponsors.asp" -->
		  <h1 align="left">2013 Camper Registration</h1>
		  <p><strong>All campers are welcome  on a first come and space available basis. You will be camping in the pasture</strong>. </p>
	      <p align="center"><font size="3"><strong><font color="#800000" size="4">Two-day  minimum reservation and 2-day event tickets required</font></strong></font></p>
      <p> The Rural  Hill Scottish Festival and Loch Norman Highland Games is a family event. For  this reason inappropriate behavior on the part of any one in attendance will  not be tolerated.&nbsp; Any incidents  requiring investigation by Games officials and, if necessary, local law  enforcement agencies could result in expulsion from the camping area and Rural Hill  without refund of fees.<u> </u></p>
          <p align="center">&nbsp;</p>
          <p align="center">&nbsp;</p>
          <p align="center"><strong><font color="#800000" size="3">POWER AND WATER ARE NOT  OFFERED AT TENT SITES</font></strong></p>
        <div align="left">
          

    <table width="705" border="0" cellspacing="4" cellpadding="0" style="font-size:12px">
          <tr>
                <td width="234">&nbsp;</td>
                <td width="89">&nbsp;</td>
                <td width="64">&nbsp; Qty</td>
                <td width="105">&nbsp; Nights Stay</td>
                <td width="189">&nbsp; Total</td>
            </tr>
              <form method="post" style="margin-bottom: 0" action="https://www.globalcart.net/cgi-bin/cart.cgi">
              <tr>
                <td>2 Man Tents - 56 square feet</td>
                <td align="right">$12.00 per night</td>
                <td><font face="Arial, Helvetica, sans-serif">
                   &nbsp;
                   <input name="VARQuantity01" type="text" id="VARQuantity01" value="" size="2" onkeyup="calculate01(this)" />
                x</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  <input name="ns1" type="text" id="ns1" size="7" onkeyup="calculate01(this)" />
                =</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  $
                  <input name="subt1" type="text" id="subt1" size="5" onfocus="blur()" />
                  <input type="hidden" name="AddItemCamp_Reg" value="ruralhill|Camping Registration|0|VARQuantity01|Camp_Reg||||Tax">
                  <input type="hidden" name="AppendItemCamp_Reg001" value="" />
                  <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
          </form>
              
              <form method="post" style="margin-bottom: 0" action="https://www.globalcart.net/cgi-bin/cart.cgi">
              <tr>
                <td>4 Man Tents - 80 square feet</td>
                <td align="right">$17.00 per night</td>
                <td><font face="Arial, Helvetica, sans-serif">&nbsp;
                    <input name="VARQuantity02" type="text" id="VARQuantity02" size="2" onkeyup="calculate02(this)" />
x</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  <input name="ns2" type="text" id="ns2" size="7" onkeyup="calculate02(this)" />
=</font></td>
                <td><font face="Arial, Helvetica, sans-serif">$
                    <input name="subt2" type="text" id="subt2" size="5" onfocus="blur()" />
                    <input type="hidden" name="AddItemCamp_Reg" value="ruralhill|Camping Registration|0|VARQuantity02|Camp_Reg||||Tax">
                  <input type="hidden" name="AppendItemCamp_Reg002" value="" />
                  <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
              <tr>
                <td>6  Man Tent up to 100 square feet</td>
                <td align="right">$22.00 per night</td>
                <td><font face="Arial, Helvetica, sans-serif">&nbsp;
                      <input name="VARQuantity10" type="text" id="VARQuantity10" size="2" onkeyup="calculate10(this)" />
                  x</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  <input name="ns10" type="text" id="ns10" size="7" onkeyup="calculate10(this)" />
                  =</font></td>
                <td><font face="Arial, Helvetica, sans-serif">$
                  <input name="subt10" type="text" id="subt10" size="5" onfocus="blur()" />
                      <input type="hidden" name="AddItemCamp_Reg" value="ruralhill|Camping Registration|0|VARQuantity10|Camp_Reg||||Tax" />
                      <input type="hidden" name="AppendItemCamp_Reg010" value="" />
                      <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
              <tr>
                <td>8  Man Tent up to 160 square feet </td>
                <td align="right">$27.00 per night</td>
                <td><font face="Arial, Helvetica, sans-serif">&nbsp;
                      <input name="VARQuantity11" type="text" id="VARQuantity11" size="2" onkeyup="calculate11(this)" />
                  x</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  <input name="ns11" type="text" id="ns11" size="7" onkeyup="calculate11(this)" />
                  =</font></td>
                <td><font face="Arial, Helvetica, sans-serif">$
                  <input name="subt11" type="text" id="subt11" size="5" onfocus="blur()" />
                      <input type="hidden" name="AddItemCamp_Reg" value="ruralhill|Camping Registration|0|VARQuantity11|Camp_Reg||||Tax" />
                      <input type="hidden" name="AppendItemCamp_Reg011" value="" />
                      <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
              <tr>
                <td>10  Man Tent up to 200 square feet</td>
                <td align="right">$32.00 per night</td>
                <td><font face="Arial, Helvetica, sans-serif">&nbsp;
                      <input name="VARQuantity12" type="text" id="VARQuantity12" size="2" onkeyup="calculate12(this)" />
                  x</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  <input name="ns12" type="text" id="ns12" size="7" onkeyup="calculate12(this)" />
                  =</font></td>
                <td><font face="Arial, Helvetica, sans-serif">$
                  <input name="subt12" type="text" id="subt12" size="5" onfocus="blur()" />
                      <input type="hidden" name="AddItemCamp_Reg" value="ruralhill|Camping Registration|0|VARQuantity12|Camp_Reg||||Tax" />
                      <input type="hidden" name="AppendItemCamp_Reg012" value="" />
                      <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
              <tr>
                <td colspan="5" align="center"><p align="center"><font size="2"><strong><font color="#800000" size="3">SELF CONTAINED UNITS</font></strong></font><br />
                    <strong><font color="#800000" size="2">Water and Power are First Come First Serve </font></strong></p></td>
                </tr>
              </form>
              
              
              
       <form method="post" style="margin-bottom: 0" action="https://www.globalcart.net/cgi-bin/cart.cgi">       
      <tr>
                <td>Pickups  / Pop Ups up to 160 square feet </td>
                <td align="right">$35.00 per night</td>
                <td><font face="Arial, Helvetica, sans-serif">&nbsp;
                    <input name="VARQuantity03" type="text" id="VARQuantity03" size="2" onkeyup="calculate03(this)" />
x</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  <input name="ns3" type="text" id="ns3" size="7" onkeyup="calculate03(this)" />
=</font></td>
                <td><font face="Arial, Helvetica, sans-serif">$
                    <input name="subt3" type="text" id="subt3" size="5" onfocus="blur()" />
                    <input type="hidden" name="AddItemCamp_Reg" value="ruralhill|Camping Registration|0|VARQuantity03|Camp_Reg||||Tax">
                  <input type="hidden" name="AppendItemCamp_Reg003" value="" />
                  <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
          </form>
              
              
      <form method="post" style="margin-bottom: 0" action="https://www.globalcart.net/cgi-bin/cart.cgi">        
            </form>
              
         <form method="post" style="margin-bottom: 0" action="https://www.globalcart.net/cgi-bin/cart.cgi">     
              <tr>
                <td>Units 20'-24'</td>
                <td align="right">$40.00 per night</td>
                <td><font face="Arial, Helvetica, sans-serif">&nbsp;
                    <input name="VARQuantity05" type="text" id="VARQuantity05" size="2" onkeyup="calculate05(this)" />
x</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  <input name="ns5" type="text" id="ns5" size="7" onkeyup="calculate05(this)" />
=</font></td>
                <td><font face="Arial, Helvetica, sans-serif">$
                    <input name="subt5" type="text" id="subt5" size="5" onfocus="blur()" />
                    <input type="hidden" name="AddItemCamp_Reg" value="ruralhill|Camping Registration|0|VARQuantity05|Camp_Reg||||Tax">
                  <input type="hidden" name="AppendItemCamp_Reg005" value="" />
                  <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
          </form>
              
              
              
      <form method="post" style="margin-bottom: 0" action="https://www.globalcart.net/cgi-bin/cart.cgi">         
      <tr>
                <td> 25'-30'</td>
                <td align="right">$45.00 per night</td>
                <td><font face="Arial, Helvetica, sans-serif">&nbsp;
                    <input name="VARQuantity06" type="text" id="VARQuantity06" size="2" onkeyup="calculate06(this)" />
x</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  <input name="ns6" type="text" id="ns6" size="7" onkeyup="calculate06(this)" />
=</font></td>
                <td><font face="Arial, Helvetica, sans-serif">$
                    <input name="subt6" type="text" id="subt6" size="5" onfocus="blur()" />
                     <input type="hidden" name="AddItemCamp_Reg" value="ruralhill|Camping Registration|0|VARQuantity06|Camp_Reg||||Tax">
                  <input type="hidden" name="AppendItemCamp_Reg006" value="" />
                  <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
          </form>
              
              
              
       <form method="post" style="margin-bottom: 0" action="https://www.globalcart.net/cgi-bin/cart.cgi">         
      <tr>
                <td>Units 31' and Up</td>
                <td align="right">$50.00 per night</td>
                <td><font face="Arial, Helvetica, sans-serif">&nbsp;
                    <input name="VARQuantity07" type="text" id="VARQuantity07" size="2" onkeyup="calculate07(this)" />
x</font></td>
                <td><font face="Arial, Helvetica, sans-serif">
                  <input name="ns7" type="text" id="ns7" size="7" onkeyup="calculate07(this)" />
=</font></td>
                <td><font face="Arial, Helvetica, sans-serif">$
                    <input name="subt7" type="text" id="subt7" size="5" onfocus="blur()" />
                    <input type="hidden" name="AddItemCamp_Reg" value="ruralhill|Camping Registration|0|VARQuantity07|Camp_Reg||||Tax">
                  <input type="hidden" name="AppendItemCamp_Reg007" value="" />
                  <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
          </form>
        </table>
        <hr />
       
            
            <table width="707" cellspacing="4">
              
              <tr>
                <td valign="baseline"><strong><font face="Arial, Helvetica, sans-serif">Gate Tickets</font></strong></td>
                <td valign="baseline"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Quantity</strong></td>
                <td valign="baseline"><strong>Cost</strong></td>
                <td valign="baseline"><strong>Total</strong></td>
              </tr>
              <tr>
                <td width="201" valign="baseline"><font face="Arial, Helvetica, sans-serif"><strong>Adult &amp; Older</strong></font></td>
                <td width="135">&nbsp;</td>
                <td width="54">&nbsp;</td>
                <td width="287">&nbsp;</td>
              </tr>
              
              
              <form method="post" style="margin-bottom: 0" action="https://www.globalcart.net/cgi-bin/cart.cgi">
              <tr>
                <td align="right" valign="baseline"><font face="Arial, Helvetica, sans-serif">Saturday and Sunday:</font></td>
                <td colspan="3" valign="baseline"><font face="Arial, Helvetica, sans-serif">Number tickets
                    <input name="VARTixQuantity08" type="text" id="VARTixQuantity08" size="2" onkeyup="calculate(this)" />
x $25.00 = $
<input name="sub3" type="text" id="sub3" size="5" onfocus="blur()" />
<input type="hidden" name="AddItemTix" value="ruralhill|Adult Tickets, Sat. and Sun.|25|VARTixQuantity08|Tix||||Tax">
                  <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
              </form>
              
              
              
              
              <form method="post" style="margin-bottom: 0" action="https://www.globalcart.net/cgi-bin/cart.cgi">
              <tr>
                <td valign="baseline"><font face="Arial, Helvetica, sans-serif"><strong>Children age 5-12</strong></font></td>
                <td colspan="3" valign="baseline">&nbsp;</td>
              </tr>
              
              <tr>
                <td align="right" valign="baseline"><font face="Arial, Helvetica, sans-serif">Saturday and Sunday:</font></td>
                <td colspan="3" valign="baseline"><font face="Arial, Helvetica, sans-serif">Number tickets
                    <input name="VARTixQuantity09" type="text" id="VARTixQuantity09" size="2" onkeyup="calculateT(this)" />
x $12.00 = $
<input name="sub6" type="text" id="sub6" size="5" onfocus="blur()" />
<input type="hidden" name="AddItemTix" value="ruralhill|Child Tickets, Sat. and Sun.|12|VARTixQuantity09|Tix||||Tax">
                  <input name="AddGraphic" type="image" src="images/AddToCart.gif" alt="Add To Cart" align="middle" border="0" />
                </font></td>
              </tr>
            </table>
            <p>NO OPEN CAMPFIRES are allowed in the wooded areas. If you are camping in  a wooded area you must use a camp stove for cooking. Anyone who must use an  open fire will have to camp in the open pasture area. All camps with open fires  must have a CONTAINER OF WATER or a FIRE EXTINGUISHER for fire suppression  available at all times.</p>
          <p align="center"><strong><font color="#800000">Camping Waiver:</font></strong></p>
            <p>For good and valuable consideration including my use of the camping area  at  Rural Hill, I and/or my heirs or  assigns will forever release and hold HARMLESS the Rural Hill, Inc. and  their  sponsors, their insurance  carriers, Mecklenburg County and/or their representatives from all claims, causes  of action, costs and judgments for claims for any damages or injuries (up to  and including death) which may be suffered by me (named below) arising out of  my involvement with the Rural Hill Scottish Festival and Loch Norman Highland  Games in Huntersville, NC. </p>
        </div>
        <hr />
        <p>NOTES FOR CAMPERS AT Rural Hill Scottish Festival and  Loch Norman Highland Games</p>
		<p>Historic  Rural Hill is the property of Mecklenburg County.&nbsp; For this reason individuals and groups  camping on the premises must follow requirements set by County Park and Recreation,  as well as the rules of Rural Hill, Inc.&nbsp;  None of the requirements are excessively restrictive but they must be  adhered to.</p>
		<p>The  Rural Hill Scottish Festival and Loch Norman Highland Games is a family event.  For this reason inappropriate behavior on the part of any one in attendance  will not be tolerated.&nbsp; Any incidents  requiring investigation by Games officials and, if necessary, local law  enforcement agencies could result in expulsion from the camping area and Rural  Hill without refund of fees.</p>
		<p>1.  ALCOHOLIC BEVERAGES-The North Carolina ABC permit for the games allows the  serving of alcoholic beverages by the organizers at GAMES-SPONSORED functions  and the Patrons &amp; Sponsors hospitality tent. Discretion and good judgement  are the order of the day!</p>
		<p>&nbsp;2. FIRES-<u>NO OPEN CAMPFIRES</u> are allowed  in the wooded areas. The woods are full of Cedar trees and dry leaves that  could easily ignite. If you are camping in a wooded area you must use a camp  stove for cooking. Anyone who must use an open fire will have to camp in the  open pasture area. All camps with open fires must have a<strong> CONTAINER OF WATER or a FIRE EXTINGUISHER</strong> for fire suppression  available at all times. </p>
		<p><u>For  open fires please dig a shallow fire pit and plan to refill the hole before  leaving. If you line your campfire with rocks please move them out of the open  field before you leave. The rocks that lay unseen in the tall grass destroy hay  rakes and bailers as well as blades and couplings..</u></p>
		<p>3.  TRASH- There are ample trash receptacles located around the grounds. Please use  them. The alternative is to pack your trash out with you. If you keep your  trash in your camp, please keep it covered. There are raccoons and possums and  skunks in the area that would love to dine on your leftovers and, in the  process, scatter them over most of Rural Hill.</p>
		<p>4. PORTABLE  TOILETS-Portable toilets are conveniently located around the grounds and black  tank service is available.&nbsp; <u>Campers  may rent a private porta-jon plus lock for the weekend for $70.</u>&nbsp; (The porta-jon must be placed in an area that  can be serviced.)</p>
		<p>5. WATER-  There is an ample supply of water available. Hook up for RV&rsquo;s and water access  for the tent camping area. </p>
		<p>6. ICE-  Ice will be available on the grounds at $1.50 per 8 pound bag. Ice will be  delivered to the Campground on Friday evening at 6:00pm as well as Saturday and Sunday about 7- 7:30 am. </p>
		<p>7.  WAIVER- Make sure that you have signed a camping waiver and returned it to the  Games office.</p>
		<p>8.  NOISE-We know this is a Scottish event, but please, no bagpipe playing, loud  radios or televisions after <strong>11 p.m</strong>.  each night.</p>
		<p>9. One  last thing....&nbsp; <strong><font color="#800000">pets are NOT</font></strong> allowed in the campground nor during the Rural Hill  Scottish Festival and Loch Norman Highland Games. </p>
		10. If you have any  questions about any of these guidelines, please ask for Eric Ferguson<br />
	    <br />
	  <!-- InstanceEndEditable -->        </td>
    <td width="31" background="images/body_04.png">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><img src="images/body_05.png" width="772" height="31" alt="" /></td>
  </tr>
</table>
<!--#include file="footer.asp" -->
</div>
</body>
<!-- InstanceEnd --></html>