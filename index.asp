<% 
option explicit
'ǿ����������·��ʷ���������ҳ��
Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
'��Ҫ��ʹ������ֵ�ͼƬ�������
%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>У�������¹���ϵͳ_У���ǿƼ�_Www.Xiao5u.Com</title>
<meta http-equiv=Content-type content="text/html; charset=gb2312">
<meta name="keywords" content="У�������¹���ϵͳ">
<meta name="description" content="У�������¹���ϵͳ">
<meta name="copyright" content="У���ǿƼ�_Www.Xiao5u.Com">
<link href="images/css.css" rel="stylesheet" type="text/css">
<!--#include file=images/ini.sys -->
<script language=javascript>
<!--
function check(){
 if (chaxun.Sid.value=="" && chaxun.Idcard.value==""){
 alert("����������Ա���Ż����֤�ţ�����ѡһ!");
 chaxun.Sid.focus();
 return false;
 }
 
 if (chaxun.Pws.value==""){
 alert("���������Ĳ�ѯ����!");
 chaxun.Pws.focus();
 return false;
 } 
 
  if (chaxun.CheckCode.value==""){
 alert("�����������֤��!");
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
        <tr><td width=460 background=images/top.gif height=54 class="bt">У���ǹ��ʲ�ѯ</td>
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
                      <td align=right height=30> Ա �� �ţ�</td>
                      <td height=30><INPUT id=Sid maxLength=10 size=18 name=Sid> </td>
					</tr>
                    <tr>
                      <td align=right height=30>���֤�ţ�</td>
                      <td height=30><INPUT id=Idcard maxLength=18 size=18 name=Idcard> </td>
					</tr>
                    <tr>
                      <td align=right height=30>��ѯ���룺</td>
                      <td height=30><INPUT name=Pws type="password" id=Pws size=18 maxLength=16> </td>
					</tr>
                    <tr>
                      <td align=right> �� ֤ �룺</td>
                      <td><input name="CheckCode"  class=input type="text" size="4" maxlength="4" onMouseOver ="this.style.backgroundColor='#ffffff'" onMouseOut ="this.style.backgroundColor='#f0ffff'">
<img src="images/CheckCode.asp" style='cursor:hand;width:40px;height:14px' border='0' align='absmiddle' onClick="this.src='images/CheckCode.asp'" alt='����ˢ����֤��' /></td></tr>
                    <tr align=middle>
                      <td colSpan=2 height=40><input name="submit" type="submit" style="WIDTH: 5.6em; HEIGHT: 2.1em; FONT: 14px;" value="�� ѯ" /> <input name="submit" type="reset" style="WIDTH: 5.6em; HEIGHT: 2.1em; FONT: 14px;" value="�� ��" /> </td>
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