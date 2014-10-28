<% 
option explicit
'强制浏览器重新访问服务器下载页面
Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
'主要是使随机出现的图片数字随机
%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>校无忧人事工资系统_校无忧科技_Www.Xiao5u.Com</title>
<meta http-equiv=Content-type content="text/html; charset=gb2312">
<meta name="keywords" content="校无忧人事工资系统">
<meta name="description" content="校无忧人事工资系统">
<meta name="copyright" content="校无忧科技_Www.Xiao5u.Com">
<link href="images/css.css" rel="stylesheet" type="text/css">
<!--#include file=images/ini.sys -->
<script language=javascript>
<!--
function check(){
 if (chaxun.Sid.value=="" && chaxun.Idcard.value==""){
 alert("请输入您的员工号或身份证号，二者选一!");
 chaxun.Sid.focus();
 return false;
 }
 
 if (chaxun.Pws.value==""){
 alert("请输入您的查询密码!");
 chaxun.Pws.focus();
 return false;
 } 
 
  if (chaxun.CheckCode.value==""){
 alert("请输入随机验证码!");
 chaxun.CheckCode.focus();
 return false;
 }

}
//-->
</script>
</head>
<body onLoad="document.chaxun.Sid.focus();">
<table cellSpacing=1 cellPadding=5 width=460 align=center bgColor=#b9b0a9 border=0>
  <form  method="post" name="chaxun" action="Check.asp?action=login" onSubmit="return check();">
  <tbody>
  <tr>
    <td vAlign=top bgColor=#ffffff>
      <table cellSpacing=0 cellPadding=0 width="100%" border=0>
        <tbody>
        <tr><td width=460 background=images/top.gif height=54 class="bt">校无忧工资查询</td>
        </tr>
        <tr>
          <td bgColor=#FFFFFF height=150>
            <table height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <tbody>
              <tr>
                <td>
                  <table cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
                    <tbody>
                    <tr>
                      <td align=right height=30> 员 工 号：</td>
                      <td height=30><INPUT id=Sid maxLength=10 size=18 name=Sid> </td>
					</tr>
                    <tr>
                      <td align=right height=30>身份证号：</td>
                      <td height=30><INPUT id=Idcard maxLength=18 size=18 name=Idcard> </td>
					</tr>
                    <tr>
                      <td align=right height=30>查询密码：</td>
                      <td height=30><INPUT name=Pws type="password" id=Pws size=18 maxLength=16> </td>
					</tr>
                    <tr>
                      <td align=right> 验 证 码：</td>
                      <td><input name="CheckCode"  class=input type="text" size="4" maxlength="4" onMouseOver ="this.style.backgroundColor='#ffffff'" onMouseOut ="this.style.backgroundColor='#f0ffff'">
<img src="images/CheckCode.asp" style='cursor:hand;width:40px;height:14px' border='0' align='absmiddle' onClick="this.src='images/CheckCode.asp'" alt='请点击刷新验证码' /></td></tr>
                    <tr align=middle>
                      <td colSpan=2 height=40><input name="submit" type="submit" style="WIDTH: 5.6em; HEIGHT: 2.1em; FONT: 14px;" value="查 询" /> <input name="submit" type="reset" style="WIDTH: 5.6em; HEIGHT: 2.1em; FONT: 14px;" value="重 置" /> </td>
					</tr>
				    </tbody>
				   </table>
				 </td>
			  </tr>
			 </tbody>
		   </table>
		 </td>
		</tr>
</FORM>
   </tbody>
  </table>
</body>
</html>