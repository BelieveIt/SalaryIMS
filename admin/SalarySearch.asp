<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<%
Syear=trim(Request("Syear"))
Smonth=trim(Request("Smonth"))
LX=trim(Request("LX"))
keywords=trim(Request("keywords"))
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
          <td class="optiontitle" colspan="8">��ѯְԱ����</td>	
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <form name="search" method="get" action="SalarySearch.asp">
            <td height="30" colspan="8">
			��ѡ���ѯ��Ϣ��
			<select name="Syear">
			<option  value="">-��ѡ�����-</option>
			<%for y=2011 to 2012%>
			<option value="<%=y%>"><%=y%></option>
			<%next%>
			</select>
			<select name="Smonth">
			<option value="">-��ѡ���·�-</option>
			<%for m=1 to 12%>
			<option value="<%=m%>"><%=m%></option>
		    <%next%>
			</select>
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
          <td width="10%">���</td>
          <td width="10%">�·�</td>
          <td width="10%">ְԱ����</td>	
          <td width="10%">ְԱ����</td>
          <td width="20%">�ϼƹ���</td>	
		  <td width="20%">ִ�в���</td>  
        </tr>
<%
 sql="select * from Salary where 5=5"
 if Syear<>"" then '�������ʾ
	sql=sql & " and Syear='" & Syear & "' "
 end if
 if Syear="" then
    Syear=Year(now())
	sql=sql & " and Syear='" & Syear & "' "
 end if
 if Smonth<>"" then '
	sql=sql & " and Smonth='" & Smonth & "' "
 end if
 if Smonth="" then
    Smonth=Month(now())
	sql=sql & " and Smonth='" & Smonth & "' "
 end if
 if LX="Sid" then '
	sql=sql & " and Sid like '%"&keywords&"%' "
 end if
 if LX="Sname" then '
	sql=sql & " and Sname like '%"&keywords&"%' "
 end if
 sql=sql & " order by id desc"
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
		  <td><%=rs("Syear")%></td>
          <td><%=rs("Smonth")%></td>
          <td><%=rs("Sid")%></td>
          <td><%=rs("Sname")%></td>
          <td><%=rs("Stotal")%></td>
          <td><IMG src="images/view.gif" align="absmiddle"><a href="Salary.asp?action=view&id=<%=rs("id")%>">��ϸ</a> <IMG src="images/edit.gif" align="absmiddle"><a href="Salary.asp?action=edit&id=<%=rs("id")%>">�޸�</a> <IMG src="images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('Salary.asp?work=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
<%
rs.MoveNext 
next
%>
		</tr>
		
<%
else
%>
        <tr align="center" bgcolor="#FFFFFF">
          <td colspan="8">�Բ���Ŀǰ���л�û�� <font color="#FF0000"><%=Syear%>-<%=Smonth%>-<%=keywords%>-</font> ��Ϣ��</td>
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