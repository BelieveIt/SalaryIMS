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
 rs.update 		'�������ݱ��¼
 rs.close
set rs=nothing
 response.write"<SCRIPT language=JavaScript>alert('�����޸ĳɹ��������µ�¼��\n \nУ���ǿƼ�-Xiao5u.Com');"
 response.write"location.href='Logout.asp'</SCRIPT>"
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>У���ǹ��ʲ�ѯ_У���ǿƼ�_Www.Xiao5u.Com</title>
<meta http-equiv=Content-type content="text/html; charset=gb2312">
<link href="images/css.css" rel="stylesheet" type="text/css">
<script language="Javascript">
function check()
{
  if (document.add.Pws1.value=="")
     {
      alert("���������Ĳ�ѯ���룡")
      document.add.Pws1.focus()
      document.add.Pws1.select()		
      return
     }
  if (document.add.Pws1.value.length<6)
     {
      alert("�������ѯ����(�ַ�����6-16λ֮��)��")
      document.add.Pws1.focus()
      document.add.Pws1.select()		
      return
     }
  if (document.add.Pws1.value.length>16)
     {
      alert("�������ѯ����(�ַ�����6-16λ֮��)��")
      document.add.Pws1.focus()
      document.add.Pws1.select()		
      return
     }
  if (document.add.Pws1.value!=document.add.Pws2.value)
     {
      alert("��������������벻��ͬ��")
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
        <tr><td width=460 background=images/top.gif height=54 class="bt">У���ǹ��ʲ�ѯ</td></tr>
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
                      <td align=right height=30 width="30%">ְԱ���ţ�</td>
                      <td height=30><%=rs("Sid")%> </td>
					</tr>
                    <tr>
                      <td align=right height=30>ְԱ������</td>
                      <td height=30><%=rs("Sname")%></td>
					</tr>
                    <tr>
                      <td align=right height=30 width="30%">���֤�ţ�</td>
                      <td height=30><%=rs("Idcard")%> </td>
					</tr>
                    <tr>
                      <td align=right height=30>���ڲ��ţ�</td>
                      <td height=30><%=rs("Department")%></td>
					</tr>
                    <tr>
                      <td align=right height=30>����ְ��</td>
                      <td height=30><%=rs("Jobs")%></td>
					</tr>
					<%if rs("luqu")="¼ȡ" then%>
                    <tr>
                      <td align=right height=30>ְԱְ�ƣ�</td>
                      <td height=30><%=rs("Duty")%></td>
					</tr>
					<%end if%>
					<tr>
                      <td align=right height=30>��ְʱ�䣺</td>
                      <td height=30><%=rs("Entrance")%></td>
					</tr>
					<tr>
                      <td align=right height=30>��ѯ���룺</td>
                      <td height=30><%=rs("Pws")%></td>
					</tr>
					<tr>
                      <td height=30 colspan="2" align=center>
					  <input type="button" name="Submit2" value="����" onClick="history.back(-1)"></td>
                      </tr>
				   </table>
<%
else
  response.write"<SCRIPT language=JavaScript>alert('�Բ��𣬹��Ż����֤�Ų�ƥ��!\n \n���飬�����������룡\n \nУ���ǿƼ�-������ʾ');"
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
                      <td align=right height=30 width="30%">ְԱ���ţ�</td>
                      <td height=30><%=rs("Sid")%> </td>
					</tr>
                    <tr>
                      <td align=right height=30>ְԱ������</td>
                      <td height=30><%=rs("Sname")%></td>
					</tr>
                    <tr>
                      <td align=right height=30 width="30%">���֤�ţ�</td>
                      <td height=30><%=rs("Idcard")%> </td>
					</tr>
                    <tr>
                      <td align=right height=30>���ڲ��ţ�</td>
                      <td height=30><%=rs("Department")%></td>
					</tr>
                    <tr>
                      <td align=right height=30>����ְ��</td>
                      <td height=30><%=rs("Jobs")%></td>
					</tr>
					<%if rs("luqu")="¼ȡ" then%>
                    <tr>
                      <td align=right height=30>ְԱְ�ƣ�</td>
                      <td height=30><%=rs("Duty")%></td>
					</tr>
					<%end if%>
					<tr>
                      <td align=right height=30>��ְʱ�䣺</td>
                      <td height=30><%=rs("Entrance")%></td>
					</tr>
					<tr>
                      <td align=right height=30>��ѯ���룺</td>
                      <td height=30><input name="Pws1" type="password" id="Pws1" value="<%=rs("Pws")%>" size="16"></td>
					</tr>
					<tr>
                      <td align=right height=30>����ȷ�ϣ�</td>
                      <td height=30><input name="Pws2" type="password" id="Pws2" value="<%=rs("Pws")%>" size="16"></td>
					</tr>
					<tr>
                      <td height=30 colspan="2" align=center><input type="hidden" name="action" value="yes">
          <input type="button" name="Submit2" value="�޸�" onClick="check()">
          <input type="button" name="Submit2" value="����" onClick="history.back(-1)">
		  <input name="id" type="hidden" id="id" value="<%=rs("id")%>">	</td>
                      </tr>
					  </form>
				   </table>
<%
else
  response.write"<SCRIPT language=JavaScript>alert('�Բ��𣬹��Ż����֤�Ų�ƥ��!\n \n���飬�����������룡\n \nУ���ǿƼ�-������ʾ');"
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
          <td align="center" bgColor="#9CBFE5" height=25>2008-2013 &copy;У���ǿƼ�  All Rights Reserved</td>
        </tr>
		</tbody>
	  </table>
	</td>
   </tr>
   </tbody>
  </table>
</body>
</html>