<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<%
keywords=request("keywords")
LX=request("LX")
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>У���ǹ���ϵͳ</title>
<link href="images/main.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
<!--
function DoEmpty(params)
{
if (confirm("���Ҫɾ��������¼��ɾ����˼�¼����������ݶ�����ɾ�������޷��ָ���"))
alert("ɾ����Ϣ�ɹ�\n ������Ϣ�б�")
window.location = params ;
}
-->
</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF"><br>
      <table width="96%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
		<tr align="center" bgcolor="#F2FDFF">
          <td class="optiontitle" colspan="8">��ѯְԱ��Ϣ</td>	
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <form name="search" method="get" action="StaffSearch.asp">
            <td height="30" colspan="8"> <strong>�������</strong>
			<select name="LX">
             <option value="Sname">ְԱ����</option>
             <option value="Sid">ְԱ����</option>
            </select>
			<input name="keywords" type="text" id="keywords" size="30"> 
            <input name="Query" type="submit" id="Query" value="�� ѯ"></td>
          </form>
        </tr>  
<%
if keywords<>"" then
%>
	    <tr align="center" bgcolor="#ebf0f7">
          <td width="10%">ְԱ����</td>
          <td width="65%" colspan="5">ְԱ��Ϣ</td>
          <td width="25%">ִ�в���</td>
        </tr>
<%
 if LX<>"" Then
   Select Case LX
     Case "Sid" 
   sql="select * from Staff where Sid like '%"&keywords&"%' order by id desc"
	 Case "Sname"
   sql="select * from Staff where Sname like '%"&keywords&"%' order by id desc"
   end select
 end if
 set rs=server.createobject("adodb.recordset") 
 rs.open sql,conn,1,1
 if not rs.eof Then
    proCount=rs.recordcount
    For i = 1 to proCount
    if rs.EOF then     
    Exit For 
    end if
%>
		<tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
		  <td><%=rs("Sid")%></td>
          <td><%=rs("Sex")%></td>
          <td><%=rs("Sname")%></td>
          <td><%=rs("Department")%></td>
          <td><%=rs("Jobs")%></td>
          <td><%=rs("State")%></td>
          <td><IMG src="images/view.gif" align="absmiddle"><a href="Staff.asp?action=view&id=<%=rs("id")%>">��ϸ</a> <IMG src="images/edit.gif" align="absmiddle"><a href="Staff.asp?action=edit&id=<%=rs("id")%>">�޸�</a> <IMG src="images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('Staff.asp?work=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
<%
rs.MoveNext 
next
%>
		</tr>
		
<%
else
%>
        <tr align="center" bgcolor="#FFFFFF">
          <td colspan="8">�Բ���Ŀǰ���л�û�� <font color="#FF0000"><%=keywords%></font> ��Ϣ��</td>
        </tr>
<%
end if
rs.close
set rs=nothing
end if
%>
      </table> 
    </td>
  </tr>
</table>
</body>
</html>