<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<%
if Request("wor")="del" then
id=request("id")
idArr=split(id,",")
for i=0 to ubound(idArr)
sql="delete from Salary where id="&trim(idArr(i))
conn.execute(sql)
next
end if
%>
<%
action=Request("action")
id=Request("id")
if action="yes" Then
 set rs=server.createobject("adodb.recordset") 
if id="" then
   set rsCheck = conn.execute("select Syear,Smonth,Sname from Salary where Syear='" & trim(Request.Form("Syear")) & "' and Smonth='" & trim(Request.Form("Smonth")) & "' and Sid='" & trim(Request.Form("Sid")) & "'")
     if not (rsCheck.bof and rsCheck.eof) then
      response.write "<script language='javascript'>alert(' " & trim(Request.Form("Syear")) & "��" & trim(Request.Form("Smonth")) & "�� " & trim(Request.Form("Sname")) & " �����Ѵ��ڣ����飡');history.back(-1);</script>"
      response.end
     end if
   set rsCheck=nothing
   sql="select * from Salary" 
   rs.open sql,conn,3,3
   rs.addnew
else
   sql="select * from Salary where id="&id&"" 
   rs.open sql,conn,1,2
end if
rs("Sid")=Request("Sid")
rs("Sname")=Request("Sname")
rs("Syear")=Request("Syear")
rs("Smonth")=Request("Smonth")
rs("Basic")=Request("Basic")
rs("Perform")=Request("Perform")
rs("JT")=Request("JT")
rs("BT")=Request("BT")
rs("GJJ")=Request("GJJ")
rs("LB")=Request("LB")
rs("YB")=Request("YB")
rs("QT")=Request("QT")
rs("Stotal")=Request("Stotal")
rs("addtime")=Request("addtime")
 rs.update
 rs.close
set rs=nothing
 Response.Redirect "?action=list"
end if
%>
<html>
<head>
<title>У���ǹ���ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/main.css" rel="stylesheet" type="text/css">
<script language=JavaScript type=text/JavaScript>
function CheckAll(form)
{for (var i=0;i<form.elements.length;i++){
var e = form.elements[i];
if (e.name != 'chkall') e.checked = form.chkall.checked;
}
}

function DoEmpty(params)
{
if (confirm("���Ҫɾ��������¼��ɾ����˼�¼����������ݶ�����ɾ�������޷��ָ���"))
window.location = params ;
}
</script>
<script language=JavaScript type=text/JavaScript>
<!--
function check()
{
  if (document.add.Sid.value=="")
     {
      alert("����дְԱ���ţ�")
      document.add.Sid.focus()
      document.add.Sid.select()
      return
     }

  if (document.add.Sname.value=="")
     {
      alert("����дְԱ������")
      document.add.Sname.focus()
      document.add.Sname.select()
      return
     }
	 
  if (document.add.Syear.value=="")
     {
      alert("����д������ݣ�")
      document.add.Syear.focus()
      document.add.Syear.select()
      return
     }
	 
  if (document.add.Smonth.value=="")
     {
      alert("����д�����·ݣ�")
      document.add.Smonth.focus()
      document.add.Smonth.select()
      return
     }
	 
  if (document.add.Basic.value=="")
     {
      alert("����д�������ʣ�")
      document.add.Basic.focus()
      document.add.Basic.select()
      return
     }
	 
  if (document.add.Stotal.value=="")
     {
      alert("����д���ʺϼƣ�")
      document.add.Stotal.focus()
      document.add.Stotal.select()
      return
     }
	 	 
     document.add.submit()
}

 function changeN()
 {
  add.spec.disabled=true;
 }
 function changeY()
 {
  add.spec.disabled=false;
 }
 function next()
 {
  if(event.keyCode==13)event.keyCode=9;
 }
-->
</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF">
	<%if action="add" then%><BR>
	<table width="98%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
      <form name="add" method="post" action="Salary.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="10"  class="optiontitle"> ��ӹ��� </td>
        </tr>
        <tr bgcolor="#F2FDFF">
          <td width="10%" align="right">ְԱ����</td>
          <td align="left" colspan="9"><input name="Sid" type="text" id="Sid" onKeyDown="next()" >
            ���س�\TAB������������һѡ��</td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td width="10%" align="right">ְԱ����</td>
          <td align="left" colspan="9"><input name="Sname" type="text" id="Sname" onKeyDown="next()" ></td>
        </tr>
        <tr bgcolor='#FFFFFF'>
          <td align='right'> ��������</td>
          <td colspan="9"><input name="Syear" type="text" id="Syear" onKeyDown="next()" value="<%=Year(now())%>" size="5" maxlength="4" >��
            <input name="Smonth" type="text" id="Smonth" onKeyDown="next()" value="<%=Month(now())%>" size="3" maxlength="2" >��</td>
        </tr>
        <tr align='center' bgcolor='#F2FDFF'>
          <td align="right">�����굥</td>
          <td>��������</td>
          <td>��Ч</td>
          <td>����</td>
          <td>����</td>
          <td>������</td>
          <td>���ϱ���</td>
          <td>ҽ�Ʊ���</td>
          <td>����</td>
          <td>���ʺϼ�</td>
        </tr>
        <tr bgcolor='#FFFFFF'>
          <td align="right">�������</td>
          <td><input name="Basic" type="text" id="Basic" onKeyDown="next()" size="10" maxlength="6" ></td>
          <td><input name="Perform" type="text" id="Perform" onKeyDown="next()" size="10" maxlength="6" ></td>
          <td><input name="JT" type="text" id="JT" onKeyDown="next()" size="10" maxlength="6" ></td>
          <td><input name="BT" type="text" id="BT" onKeyDown="next()" size="10" maxlength="6" ></td>
          <td><input name="GJJ" type="text" id="GJJ" onKeyDown="next()" size="10" maxlength="6" ></td>
          <td><input name="LB" type="text" id="LB" onKeyDown="next()" size="10" maxlength="6" ></td>
          <td><input name="YB" type="text" id="YB" onKeyDown="next()" size="10" maxlength="6" ></td>
          <td><input name="QT" type="text" id="QT" onKeyDown="next()" size="10" maxlength="6" ></td>
          <td><input name="Stotal" type="text" id="Stotal" onKeyDown="next()" size="10" maxlength="10" ></td>
	    </tr>
        <tr bgcolor='#FFFFFF'>
          <td colspan="1" align='right'> ���ʱ��</td>
          <td colspan="9"><input name="addtime" type="text" id="addtime" value="<%response.write now()%>" onKeyDown="next()" ></td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td  colspan="10" ><input type="hidden" name="action" value="yes">
              <input type="button" name="Submit" value="�ύ" onClick="check()">
              <input type="button" name="Submit2" value="����" onClick="history.back(-1)"></td>
        </tr>
      </form>
	  </table>
	<%end if%>
<br>
<%if action="list" then%>
      <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="7"  class="optiontitle">ְԱ�����б�</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
		  <td width="40">ѡ��</td>
          <td width="10%">���</td>
          <td width="10%">�·�</td>
          <td width="15%">ְԱ����</td>	
          <td width="15%">ְԱ����</td>
          <td width="20%">�ϼƹ���</td>	
		  <td>ִ�в���</td>  
        </tr>	
<%
sql="select * from Salary order by id desc"
 set rs=server.createobject("adodb.recordset") 
 rs.open sql,conn,1,1
 if not rs.eof then
 proCount=rs.recordcount
	rs.PageSize=15					  '������ʾ��Ŀ
     if not IsEmpty(Request("ToPage")) then
	    ToPage=CInt(Request("ToPage"))
		if ToPage>rs.PageCount then
		   rs.AbsolutePage=rs.PageCount
		   intCurPage=rs.PageCount
		elseif ToPage<=0 then
		   rs.AbsolutePage=1
		   intCurPage=1
		else
		   rs.AbsolutePage=ToPage
		   intCurPage=ToPage
		end if
	 else
		rs.AbsolutePage=1
		intCurPage=1
	 end if
	 intCurPage=CInt(intCurPage)
	 For i = 1 to rs.PageSize
	 if rs.eof then     
	 Exit For 
	 end if
%>
        <form name="del" action="" method="post">
        <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
		  <td><input type="checkbox" name="id" value="<%=rs("id")%>"></td>
		  <td><%=rs("Syear")%></td>
          <td><%=rs("Smonth")%></td>
          <td><%=rs("Sid")%></td>
          <td><%=rs("Sname")%></td>
          <td><%=rs("Stotal")%></td>
          <td><IMG src="images/view.gif" align="absmiddle"><a href="?action=view&id=<%=rs("id")%>">��ϸ</a> <IMG src="images/edit.gif" align="absmiddle"><a href="?action=edit&id=<%=rs("id")%>">�޸�</a> <IMG src="images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('?work=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
        </tr>
<%
rs.movenext 
next
%>
		<tr bgcolor="#ffffff">
		  <td colspan="12">&nbsp;&nbsp;
		   <input name="chkall" type="checkbox" id="chkall" value="select" onclick=CheckAll(this.form)> ȫѡ
		   <input name="wor" type="hidden" id="wor" value="del" />
		   <input type="submit" name="Submit3" value="ɾ����ѡ" onClick="{if(confirm('ȷ��Ҫɾ����¼��ɾ���󽫱��޷��ָ���')){return true;}return false;}" />
		  </td>
		</tr>
		</form>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="7"> �ܹ���<font color="#ff0000"><%=rs.PageCount%></font>ҳ, <font color="#ff0000"><%=proCount%></font>��������Ϣ, ��ǰҳ��<font color="#ff0000"><%=intCurPage%> </font><%if intCurPage<>1 then%><a href="?action=list">��ҳ</a>|<a href="?action=list&ToPage=<%=intCurPage-1%>">��һҳ</a>|<% end if
if intCurPage<>rs.PageCount then %><a href="?action=list&ToPage=<%=intCurPage+1%>">��һҳ</a>|<a href="?action=list&ToPage=<%=rs.PageCount%>"> ���ҳ</a><% end if%></span></td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
          <td colspan="7">�Բ���Ŀǰ���ݿ��л�û�����ְԱ���ʣ�</td>
        </tr>
<%
rs.close
set rs=nothing
end if
%>
      </table>
	  <br>
<%end if%>
<%if action="view" then
set rs=server.createobject("adodb.recordset") 
sql="select * from Salary where id="&Request("id")
rs.open sql,conn,1,1
if not rs.eof Then
%>
<br>
	  <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="10"  class="optiontitle"> �鿴���� </td>
        </tr>
        <tr bgcolor="#F2FDFF">
          <td width="10%" align="right">ְԱ����</td>
          <td align="left" colspan="9"><%=rs("Sid")%></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td width="10%" align="right">ְԱ����</td>
          <td align="left" colspan="9"><%=rs("Sname")%></td>
        </tr>
        <tr bgcolor='#FFFFFF'>
          <td align='right'> ��������</td>
          <td colspan="9"><%=rs("Syear")%>��<%=rs("Smonth")%>��</td>
        </tr>
        <tr bgcolor='#F2FDFF' align="center">
          <td align="right">�����굥</td>
          <td>��������</td>
          <td>��Ч</td>
          <td>����</td>
          <td>����</td>
          <td>������</td>
          <td>���ϱ���</td>
          <td>ҽ�Ʊ���</td>
          <td>����</td>
          <td>���ʺϼ�</td>
        </tr>
        <tr bgcolor='#FFFFFF' align="center">
          <td align="right">�������</td>
          <td><%=rs("Basic")%></td>
          <td><%=rs("Perform")%></td>
          <td><%=rs("JT")%></td>
          <td><%=rs("BT")%></td>
          <td><%=rs("GJJ")%></td>
          <td><%=rs("LB")%></td>
          <td><%=rs("YB")%></td>
          <td><%=rs("QT")%></td>
          <td><%=rs("Stotal")%></td>
	    </tr>
        <tr bgcolor='#FFFFFF'>
          <td colspan="1" align='right' bgcolor="#FFFFFF"> ���ʱ��</td>
          <td colspan="9"><%=rs("addtime")%></td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="10" >
              <input type="button" name="Submit4" value="����" onClick="history.back(-1)"><input name="id" type="hidden" id="id" value="<%=rs("id")%>"></td>
        </tr>
	  </table>
<%
end if
end if
%>

<br>
<%if action="edit" then
set rs=server.createobject("adodb.recordset") 
sql="select * from Salary where id="&Request("id")
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
      <form name="add" method="post" action="Salary.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="10"  class="optiontitle"> �޸Ĺ��� </td>
        </tr>
        <tr align="center" bgcolor="#F2FDFF">
          <td width="10%" align="right">ְԱ����</td>
          <td align="left" colspan="9"><input name="Sid" type="text" id="Sid" onKeyDown="next()" value="<%=rs("Sid")%>" >
            ���س�\TAB������������һѡ��</td>
        </tr>
        <tr align="center" bgcolor="#F2FDFF">
          <td width="10%" align="right">ְԱ����</td>
          <td align="left" colspan="9"><input name="Sname" type="text" id="Sname" onKeyDown="next()" value="<%=rs("Sname")%>" ></td>
        </tr>
        <tr bgcolor='#FFFFFF'>
          <td align='right' bgcolor="#FFFFFF"> ��������</td>
          <td colspan="9"><input name="Syear" type="text" id="Syear" onKeyDown="next()" value="<%=rs("Syear")%>" size="5" maxlength="4" >��
            <input name="Smonth" type="text" id="Smonth" onKeyDown="next()" value="<%=rs("Smonth")%>" size="3" maxlength="2" >��</td>
        </tr>
        <tr align='center' bgcolor='#F2FDFF'>
          <td align="right">�����굥</td>
          <td>��������</td>
          <td bgcolor="#F2FDFF">��Ч</td>
          <td>����</td>
          <td>����</td>
          <td>������</td>
          <td>���ϱ���</td>
          <td>ҽ�Ʊ���</td>
          <td>����</td>
          <td>���ʺϼ�</td>
        </tr>
        <tr align='center' bgcolor='#FFFFFF'>
          <td align="right">�������</td>
          <td><input name="Basic" type="text" id="Basic" onKeyDown="next()" value="<%=rs("Basic")%>" size="10" maxlength="6" ></td>
          <td><input name="Perform" type="text" id="Perform" onKeyDown="next()" value="<%=rs("Perform")%>" size="10" maxlength="6" ></td>
          <td><input name="JT" type="text" id="JT" onKeyDown="next()" value="<%=rs("JT")%>" size="10" maxlength="6" ></td>
          <td><input name="BT" type="text" id="BT" onKeyDown="next()" value="<%=rs("BT")%>" size="10" maxlength="6" ></td>
          <td><input name="GJJ" type="text" id="GJJ" onKeyDown="next()" value="<%=rs("GJJ")%>" size="10" maxlength="6" ></td>
          <td><input name="LB" type="text" id="LB" onKeyDown="next()" value="<%=rs("LB")%>" size="10" maxlength="6" ></td>
          <td><input name="YB" type="text" id="YB" onKeyDown="next()" value="<%=rs("YB")%>" size="10" maxlength="6" ></td>
          <td><input name="QT" type="text" id="QT" onKeyDown="next()" value="<%=rs("QT")%>" size="10" maxlength="6" ></td>
          <td><input name="Stotal" type="text" id="Stotal" onKeyDown="next()" value="<%=rs("Stotal")%>" size="10" maxlength="10" ></td>
	    </tr>
        <tr bgcolor='#FFFFFF'>
          <td colspan="1" align='right' bgcolor="#FFFFFF"> ���ʱ��</td>
          <td colspan="9"><input name="addtime" type="text" id="addtime" value="<%=rs("addtime")%>" onKeyDown="next()" ></td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td  colspan="10" ><input type="hidden" name="action" value="yes">
           <input type="button" name="Submit3" value="�ύ" onClick="check()">
           <input type="button" name="Submit4" value="����" onClick="history.back(-1)"><input name="id" type="hidden" id="id" value="<%=rs("id")%>"></td>
        </tr>
      </form>
	  </table>
<%
end if
end if
%>     
    </td>
  </tr>
</table>
</body>
</html>