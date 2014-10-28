<!--#include file=images/right.asp -->
<!--#include file=images/conn.asp -->
<%
action=Request("action")
id=session("id")
if action="yes" Then
 set rs=server.createobject("adodb.recordset") 
   sql="select * from Staff where id="&id&"" 
   rs.open sql,conn,1,2
rs("Pws")=Request("Pws1")
 rs.update 		'更新数据表记录
 rs.close
set rs=nothing
 response.write"<SCRIPT language=JavaScript>alert('密码修改成功，请重新登录！\n \n校无忧科技-Xiao5u.Com');"
 response.write"location.href='Logout.asp'</SCRIPT>"
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>校无忧工资查询_校无忧科技_Www.Xiao5u.Com</title>
<meta http-equiv=Content-type content="text/html; charset=gb2312">
<link href="images/css.css" rel="stylesheet" type="text/css">
<script language="Javascript">
function check()
{
  if (document.add.Pws1.value=="")
     {
      alert("请输入您的查询密码！")
      document.add.Pws1.focus()
      document.add.Pws1.select()		
      return
     }
  if (document.add.Pws1.value.length<6)
     {
      alert("请输入查询密码(字符数在6-16位之间)！")
      document.add.Pws1.focus()
      document.add.Pws1.select()		
      return
     }
  if (document.add.Pws1.value.length>16)
     {
      alert("请输入查询密码(字符数在6-16位之间)！")
      document.add.Pws1.focus()
      document.add.Pws1.select()		
      return
     }
  if (document.add.Pws1.value!=document.add.Pws2.value)
     {
      alert("您输入的两次密码不相同！")
      document.add.Pws2.focus()
      document.add.Pws2.select()		
      return
     }
     document.add.submit()
}
</script>
</head>
<body>
<table cellSpacing=1 cellPadding=5 width=460 align=center bgColor=#b9b0a9 border=0>
  <tr>
    <td vAlign=top bgColor=#ffffff>
      <table cellSpacing=0 cellPadding=0 width="100%" border=0>
        <tbody>
        <tr><td width=460 background=images/top.gif height=54 class="bt">校无忧工资查询</td></tr>
        <tr>
          <td bgColor=#FFFFFF height=150>
            <table height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <tbody>
              <tr>
                <td>
<%
if action="view" then
set rs=server.createobject("adodb.recordset") 
sql="select * from Staff where id="&id&""
rs.open sql,conn,1,1
if not rs.eof Then
%>
                  <table cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
                    <tr>
                      <td align=right height=30 width="30%">职员工号：</td>
                      <td height=30><%=rs("Sid")%> </td>
					</tr>
                    <tr>
                      <td align=right height=30>职员姓名：</td>
                      <td height=30><%=rs("Sname")%></td>
					</tr>
                    <tr>
                      <td align=right height=30 width="30%">身份证号：</td>
                      <td height=30><%=rs("Idcard")%> </td>
					</tr>
                    <tr>
                      <td align=right height=30>所在部门：</td>
                      <td height=30><%=rs("Department")%></td>
					</tr>
                    <tr>
                      <td align=right height=30>担任职务：</td>
                      <td height=30><%=rs("Jobs")%></td>
					</tr>
					<%if rs("luqu")="录取" then%>
                    <tr>
                      <td align=right height=30>职员职称：</td>
                      <td height=30><%=rs("Duty")%></td>
					</tr>
					<%end if%>
					<tr>
                      <td align=right height=30>入职时间：</td>
                      <td height=30><%=rs("Entrance")%></td>
					</tr>
					<tr>
                      <td align=right height=30>查询密码：</td>
                      <td height=30><%=rs("Pws")%></td>
					</tr>
					<tr>
                      <td height=30 colspan="2" align=center>
					  <input type="button" name="Submit2" value="返回" onClick="history.back(-1)"></td>
                      </tr>
				   </table>
<%
else
  response.write"<SCRIPT language=JavaScript>alert('对不起，工号或身份证号不匹配!\n \n请检查，返回重新输入！\n \n校无忧科技-友情提示');"
  response.write"location.href='index.asp'</SCRIPT>"
end if
end if
%>
<%
if action="edit" then
set rs=server.createobject("adodb.recordset") 
sql="select * from Staff where id="&id&""
rs.open sql,conn,1,1
if not rs.eof Then
%>				   
                  <table cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
					<form name="add" method="post" action="User.asp">
                    <tr>
                      <td align=right height=30 width="30%">职员工号：</td>
                      <td height=30><%=rs("Sid")%> </td>
					</tr>
                    <tr>
                      <td align=right height=30>职员姓名：</td>
                      <td height=30><%=rs("Sname")%></td>
					</tr>
                    <tr>
                      <td align=right height=30 width="30%">身份证号：</td>
                      <td height=30><%=rs("Idcard")%> </td>
					</tr>
                    <tr>
                      <td align=right height=30>所在部门：</td>
                      <td height=30><%=rs("Department")%></td>
					</tr>
                    <tr>
                      <td align=right height=30>担任职务：</td>
                      <td height=30><%=rs("Jobs")%></td>
					</tr>
					<%if rs("luqu")="录取" then%>
                    <tr>
                      <td align=right height=30>职员职称：</td>
                      <td height=30><%=rs("Duty")%></td>
					</tr>
					<%end if%>
					<tr>
                      <td align=right height=30>入职时间：</td>
                      <td height=30><%=rs("Entrance")%></td>
					</tr>
					<tr>
                      <td align=right height=30>查询密码：</td>
                      <td height=30><input name="Pws1" type="password" id="Pws1" value="<%=rs("Pws")%>" size="16"></td>
					</tr>
					<tr>
                      <td align=right height=30>密码确认：</td>
                      <td height=30><input name="Pws2" type="password" id="Pws2" value="<%=rs("Pws")%>" size="16"></td>
					</tr>
					<tr>
                      <td height=30 colspan="2" align=center><input type="hidden" name="action" value="yes">
          <input type="button" name="Submit2" value="修改" onClick="check()">
          <input type="button" name="Submit2" value="返回" onClick="history.back(-1)">
		  <input name="id" type="hidden" id="id" value="<%=rs("id")%>">	</td>
                      </tr>
					  </form>
				   </table>
<%
else
  response.write"<SCRIPT language=JavaScript>alert('对不起，工号或身份证号不匹配!\n \n请检查，返回重新输入！\n \n校无忧科技-友情提示');"
  response.write"location.href='index.asp'</SCRIPT>"
end if
end if
%>
				 </td>
			  </tr>
			 </tbody>
		   </table>
		 </td>
		</tr>
        <tr>
          <td align="center" bgColor="#9CBFE5" height=25>2008-2013 &copy;校无忧科技  All Rights Reserved</td>
        </tr>
		</tbody>
	  </table>
	</td>
   </tr>
   </tbody>
  </table>
</body>
</html>