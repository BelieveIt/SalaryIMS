<!--#include file="inc/right.asp"--> 
<!--#include file="inc/conn.asp"-->
<%
if Request("wor")="del" then
id=request("id")
idArr=split(id,",")
for i=0 to ubound(idArr)
sql="delete from Staff where id="&trim(idArr(i))
conn.execute(sql)
next
end if
%>
<%
IF Request("work")="del" Then
sql="delete from Staff where id="&Request("id")
Conn.execute(sql)
Response.Redirect "?action=list"
End IF
%>
<%
action=Request("action")
id=Request("id")
if action="yes" Then
 set rs=server.createobject("adodb.recordset") 
if id="" then
   set rsCheck = conn.execute("select Sid from Staff where Sid='" & trim(Request.Form("Sid")) & "'")
     if not (rsCheck.bof and rsCheck.eof) then
      response.write "<script language='javascript'>alert('ְԱ����" & trim(Request.Form("Sid")) & " �Ѵ��ڣ����飡');history.back(-1);</script>"
      response.end
     end if
   set rsCheck=nothing
   sql="select * from Staff" 
   rs.open sql,conn,3,3
   rs.addnew 
else
   sql="select * from Staff where id="&id&"" 
   rs.open sql,conn,1,2
end if
rs("Sid")=Request("Sid")
rs("Pws")=Request("Pws")
rs("Sname")=Request("Sname")
rs("State")=Request("State")
rs("Idcard")=Request("Idcard")
rs("Sex")=Request("Sex")
rs("Home")=Request("Home")
rs("National")=Request("National")
rs("Birth")=Request("Birth")
rs("Marriage")=Request("Marriage")
rs("Political")=Request("Political")
rs("Political_date")=Request("Political_date")
rs("Culture")=Request("Culture")
rs("School")=Request("School")
rs("Graduate")=Request("Graduate")
rs("Address")=Request("Address")
rs("Phone")=Request("Phone")
rs("Email")=Request("Email")
rs("IM")=Request("IM")
rs("Department")=Request("Department")
rs("Jobs")=Request("Jobs")
rs("Duty")=Request("Duty")
rs("Entrance")=Request("Entrance")
rs("Comment")=Request("Comment")
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
function check()
{
  if (document.add.Sid.value=="")
     {
      alert("����дְԱ���ţ�")
      document.add.Sid.focus()
      document.add.Sid.select()
      return
     } 
	 
  if (document.add.Pws.value=="")
     {
      alert("����дְԱ��ѯ���룡")
      document.add.Pws.focus()
      document.add.Pws.select()
      return
     } 

  if (document.add.State.value=="")
     {
      alert("����дְԱ״̬��")
      document.add.State.focus()
      document.add.State.select()
      return
     } 
	 
  if (document.add.Sname.value=="")
     {
      alert("����дְԱ������")
      document.add.Sname.focus()
      document.add.Sname.select()
      return
     } 

  if (document.add.Idcard.value=="")
     {
      alert("����дְԱ���֤�ţ�")
      document.add.Idcard.focus()
      document.add.Idcard.select()
      return
     } 
	 
  if (document.add.Sex.value=="")
     {
      alert("����дְԱ�Ա�")
      document.add.Sex.focus()
      document.add.Sex.select()
      return
     } 
	 
  if (document.add.Department.value=="")
     {
      alert("����дְԱ���ڲ��ţ�")
      document.add.Department.focus()
      document.add.Department.select()
      return
     } 

  if (document.add.Jobs.value=="")
     {
      alert("����дְԱ����ְ��")
      document.add.Jobs.focus()
      document.add.Jobs.select()
      return
     } 

  if (document.add.Duty.value=="")
     {
      alert("����дְԱְ�ƣ�")
      document.add.Duty.focus()
      document.add.Duty.select()
      return
     } 
	 
  if (document.add.Entrance.value=="")
     {
      alert("����дְԱ��ְʱ�䣡")
      document.add.Entrance.focus()
      document.add.Entrance.select()
      return
     } 
     document.add.submit()
	 
}
</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td bgcolor="#FFFFFF">
	<%if action="add" then%><BR>
	<table width="98%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
      <form name="add" method="post" action="Staff.asp">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="8"  class="optiontitle">���ְԱ</td>
        </tr>
        <tr bgcolor="#F2FDFF">
          <td width="10%" align="right"> ְԱ����</td>
          <td width="15%"><input name="Sid" type="text" id="Sid" value="" size="18">
              <font color="red">*</font></td>
          <td width="10%" align="right"> ְԱ����</td>
          <td width="15%" ><input name="Sname" type="text" id="Sname" value="" size="18">
              <font color="red">*</font></td>
          <td width="10%" align="right">��ѯ����</td>
          <td width="15%" ><input name="Pws" type="text" id="Pws" value="123456" size="18">
              <font color="red">*</font></td>
          <td width="10%" align="right">ְԱ״̬</td>
          <td width="15%"><select name="State" id="State" selfvalue="ְԱ״̬">
              <option value="��ְ">��ְ</option>
              <option value="��ְ">��ְ</option>
              <option value="����">����</option>
              <option value="�ݼ�">�ݼ�</option>
            </select>
              <font color="red">*</font></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right">���֤��</td>
          <td ><input name="Idcard" type="text" id="Idcard" value="" size="18">
              <font color="red">*</font></td>
          <td align="right">�Ա�</td>
          <td><input type="radio" name="Sex" value="��" />��<input type="radio" name="Sex" value="Ů" />Ů<font color="red">*</font></td>
          <td align="right">����</td>
          <td><input name="Home" type="text" id="Home" value=""></td>
          <td align="right">����</td>
          <td><input name="National" type="text" id="National" value=""></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right"> ��������</td>
          <td><input name="Birth" type="text" id="Birth" value=""></td>
          <td align="right">����״��</td>
          <td><select name="Marriage" id="Marriage" selfvalue="����״��">
              <option value="">��ѡ��</option>
              <option value="δ��">δ��</option>
              <option value="�ѻ�">�ѻ�</option>
          </select></td>
          <td align="right">������ò</td>
          <td><select name="Political" id="Political" selfvalue="������ò">
              <option value="">��ѡ��</option>
              <option value="��">��</option>
              <option value="��Ա">��Ա</option>
              <option value="��Ա">��Ա</option>
              <option value="����">����</option>
            </select>          </td>
          <td align="right">����ʱ��</td>
          <td><input name="Political_date" type="text" id="Political_date" value=""></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right"> �Ļ��̶�</td>
          <td><input name="Culture" type="text" id="Culture" value=""></td>
          <td align="right">��ҵѧУ</td>
          <td><input name="School" type="text" id="School" value=""></td>
          <td align="right">��ҵʱ��</td>
          <td><input name="Graduate" type="text" id="Graduate" value=""></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right"> ��ϵסַ</td>
          <td><input name="Address" type="text" id="Address" value=""></td>
          <td align="right">��ϵ�绰</td>
          <td><input name="Phone" type="text" id="Phone" value=""></td>
          <td align="right">Email</td>
          <td><input name="Email" type="text" id="Email" value=""></td>
          <td align="right">�����</td>
          <td><input name="IM" type="text" id="IM" value=""></td>
        </tr>
        <tr bgcolor="#F2FDFF">
          <td align="right"> ���ڲ���</td>
          <td><select name="Department" id="Department" selfvalue="���ڲ���">
              <option value="">��ѡ��</option>
              <option value="ҵ��">ҵ��</option>
              <option value="�ͷ���">�ͷ���</option>
              <option value="������">������</option>
            </select>
              <font color="red">*</font></td>
          <td align="right">����ְ��</td>
          <td><select name="Jobs" id="Jobs" selfvalue="����ְ��">
              <option value="">��ѡ��</option>
              <option value="����Ա">����Ա</option>
              <option value="����">����</option>
              <option value="����">����</option>
            </select>
              <font color="red">*</font></td>
          <td align="right">ְ��</td>
          <td><select name="Duty" id="Duty" selfvalue="ְ��">
              <option value="">��ѡ��</option>
              <option value="����">����</option>
              <option value="�м�">�м�</option>
              <option value="�߼�">�߼�</option>
            </select>
              <font color="red">*</font></td>
          <td align="right">��ְʱ��</td>
          <td><input name="Entrance" type="text" id="Entrance" size="18">
              <font color="red">*</font></td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right"> ��ע</td>
          <td colspan="7" align="left"><textarea name="Comment" cols="100" rows="5" id="Comment"></textarea></td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
          <td  colspan="8" ><input type="hidden" name="action" value="yes">
              <input type="button" name="Submit" value="�ύ" onClick="check()">
              <input type="button" name="Submit22" value="����" onClick="history.back(-1)"></td>
        </tr>
      </form>
	  </table>
	<%end if%>
<br>
    <%if action="list" then%>
      <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
        <tr align="center" bgcolor="#F2FDFF">
          <td colspan="8"  class="optiontitle">ְԱ�б�</td>
        </tr>
        <tr align="center" bgcolor="#ebf0f7">
		  <td width="40">ѡ��</td>
          <td width="10%">ְԱ����</td>
          <td colspan="5">ְԱ��Ϣ</td>
          <td width="20%">ִ�в���</td>
        </tr>
		
<%
sql="select * from Staff order by id desc"
 set rs=server.createobject("adodb.recordset") 
 rs.open sql,conn,1,1
 if not rs.eof then
 proCount=rs.recordcount
	rs.PageSize=10					  '������ʾ��Ŀ
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
		  <td><%=rs("Sid")%></td>
          <td><%=rs("Sex")%></td>
          <td><%=rs("Sname")%></td>
          <td><%=rs("Department")%></td>
          <td><%=rs("Jobs")%></td>
          <td><%=rs("State")%></td>
          <td><IMG src="images/view.gif" align="absmiddle"><a href="?action=view&id=<%=rs("id")%>">��ϸ</a> <IMG src="images/edit.gif" align="absmiddle"><a href="?action=edit&id=<%=rs("id")%>">�޸�</a> <IMG src="images/drop.gif" align="absmiddle"><a href="javascript:DoEmpty('?work=del&id=<%=rs("id")%>&action=list&ToPage=<%=intCurPage%>')">ɾ��</a></td>
        </tr>
<%
rs.movenext 
next
%>
		<tr bgcolor="#ffffff">
		  <td colspan="8">&nbsp;&nbsp;
		   <input name="chkall" type="checkbox" id="chkall" value="select" onclick=CheckAll(this.form)> ȫѡ
		   <input name="wor" type="hidden" id="wor" value="del" />
		   <input type="submit" name="Submit3" value="ɾ����ѡ" onClick="{if(confirm('ȷ��Ҫɾ����¼��ɾ���󽫱��޷��ָ���')){return true;}return false;}" />
		  </td>
		</tr>
		</form>
        <tr align="center" bgcolor="#ebf0f7">
          <td colspan="8"> �ܹ�<font color="#ff0000"><%=rs.PageCount%></font>ҳ, <font color="#ff0000"><%=proCount%></font>��ְԱ, ��ǰҳ<font color="#ff0000"><%=intCurPage%> </font><%if intCurPage<>1 then%><a href="?action=list">��ҳ</a>|<a href="?action=list&ToPage=<%=intCurPage-1%>">��һҳ</a>|<% end if
if intCurPage<>rs.PageCount then %><a href="?action=list&ToPage=<%=intCurPage+1%>">��һҳ</a>|<a href="?action=list&ToPage=<%=rs.PageCount%>"> ���ҳ</a><% end if%></span></td>
        </tr>
<%
else
%>
        <tr align="center" bgcolor="#ffffff">
         <td colspan="8">�Բ���Ŀǰ���ݿ��л�û�����ְԱ��</td>
        </tr>
<%
rs.close
set rs=nothing
end if
%>
      </table>
	  <br>
<%end if%>
<%if action="edit" then
set rs=server.createobject("adodb.recordset") 
sql="select * from Staff where id="&Request("id")
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
       <form name="add" method="post" action="Staff.asp">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan="12" class="optiontitle">�޸�ְԱ</td>
		</tr>
        <tr bgcolor="#F2FDFF">
          <td width="10%" align="right"> ְԱ����</td>
          <td width="15%"><input name="Sid" type="text" id="Sid" value="<%=rs("Sid")%>" size="10"> <font color="red">*</font></td>
          <td width="10%" align="right"> ְԱ����</td>
          <td width="15%"><input name="Sname" type="text" id="Sname" value="<%=rs("Sname")%>" size="18"> 
          <font color="red">*</font></td>
		  <td width="10%" align="right">��ѯ����</td>
          <td width="15%"><input name="Pws" type="text" id="Pws" value="<%=rs("Pws")%>" size="16">
            <font color="red">*</font></td>
          <td width="10%" align="right">ְԱ״̬</td>
          <td width="15%">
		  <select name="State" selfValue="ְԱ״̬">
   		    <option value="��ְ" <% if rs("State")="��ְ" Then Response.write("Selected")%>>��ְ</option>
   		    <option value="��ְ" <% if rs("State")="��ְ" Then Response.write("Selected")%>>��ְ</option>
   		    <option value="����" <% if rs("State")="����" Then Response.write("Selected")%>>����</option>
   		    <option value="�ݼ�" <% if rs("State")="�ݼ�" Then Response.write("Selected")%>>�ݼ�</option>
  		  </select><font color="red">*</font></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right">���֤��</td>
          <td ><input name="Idcard" type="text" id="Idcard" value="<%=rs("Idcard")%>" size="18">
            <font color="red">*</font></td>
          <td align="right">�Ա�</td>
          <td><input type="radio" name="Sex" value="��"  <% if rs("Sex")="��"  then response.Write("checked") end if%>/>�� <input type="radio" name="Sex" value="Ů"  <% if rs("Sex")="Ů" then response.Write("checked") end if%> />Ů<font color="red">*</font></td>
          <td align="right">����</td>
          <td><input name="Home" type="text" id="Home" value="<%=rs("Home")%>"></td>
          <td align="right">����</td>
          <td><input name="National" type="text" id="National" value="<%=rs("National")%>"></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right"> ��������</td>
          <td><input name="Birth" type="text" id="Birth" value="<%=rs("Birth")%>" size="18"></td>
          <td align="right">����״��</td>
          <td>
		  <select name="Marriage" selfValue="����״��">
   		    <option value="">��ѡ��</option>
   		    <option value="δ��" <% if rs("Marriage")="δ��" Then Response.write("Selected")%>>δ��</option>
   		    <option value="�ѻ�" <% if rs("Marriage")="�ѻ�" Then Response.write("Selected")%>>�ѻ�</option>
  		  </select></td>
          <td align="right" width="10%">������ò</td>
          <td>
		  <select name="Political" selfValue="������ò">
   		    <option value="">��ѡ��</option>
   		    <option value="��" <% if rs("Political")="��" Then Response.write("Selected")%>>��</option>
   		    <option value="��Ա" <% if rs("Political")="��Ա" Then Response.write("Selected")%>>��Ա</option>
   		    <option value="��Ա" <% if rs("Political")="��Ա" Then Response.write("Selected")%>>��Ա</option>
   		    <option value="����" <% if rs("Political")="����" Then Response.write("Selected")%>>����</option>
  		  </select> </td>
          <td align="right" width="10%">����ʱ��</td>
          <td><input name="Political_date" type="text" id="Political_date" value="<%=rs("Political_date")%>"></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right"> �Ļ��̶�</td>
          <td><input name="Culture" type="text" id="Culture" value="<%=rs("Culture")%>" size="18"></td>
          <td align="right">��ҵѧУ</td>
          <td><input name="School" type="text" id="School" value="<%=rs("School")%>"></td>
          <td align="right">��ҵʱ��</td>
          <td><input name="Graduate" type="text" id="Graduate" value="<%=rs("Graduate")%>"></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right"> ��ϵסַ</td>
          <td><input name="Address" type="text" id="Address" value="<%=rs("Address")%>"></td>
          <td align="right">��ϵ�绰</td>
          <td><input name="Phone" type="text" id="Phone" value="<%=rs("Phone")%>"></td>
          <td align="right">Email</td>
          <td><input name="Email" type="text" id="Email" value="<%=rs("Email")%>"></td>
          <td align="right">�����</td>
          <td><input name="IM" type="text" id="IM" value="<%=rs("IM")%>"></td>
        </tr>
        <tr bgcolor="#F2FDFF">
          <td align="right"> ���ڲ���</td>
          <td><select name="Department" selfvalue="���ڲ���">
            <option value="">��ѡ��</option>
            <option value="ҵ��" <% if rs("Department")="ҵ��" Then Response.write("Selected")%>>ҵ��</option>
            <option value="�ͷ���" <% if rs("Department")="�ͷ���" Then Response.write("Selected")%>>�ͷ���</option>
            <option value="������" <% if rs("Department")="������" Then Response.write("Selected")%>>������</option>
          </select>
            <font color="red">*</font></td>
          <td align="right">����ְ��</td>
          <td>
		  <select name="Jobs" selfValue="����ְ��">
   		    <option value="">��ѡ��</option>
   		    <option value="����Ա" <% if rs("Jobs")="����Ա" Then Response.write("Selected")%>>����Ա</option>
   		    <option value="����" <% if rs("Jobs")="����" Then Response.write("Selected")%>>����</option>
   		    <option value="����" <% if rs("Jobs")="����" Then Response.write("Selected")%>>����</option>
  		  </select><font color="red">*</font></td>
          <td align="right">ְ��</td>
          <td><select name="Duty" selfvalue="ְ��">
            <option value="">��ѡ��</option>
            <option value="����" <% if rs("Duty")="����" Then Response.write("Selected")%>>����</option>
            <option value="�м�" <% if rs("Duty")="�м�" Then Response.write("Selected")%>>�м�</option>
            <option value="�߼�" <% if rs("Duty")="�߼�" Then Response.write("Selected")%>>�߼�</option>
          </select>
            <font color="red">*</font></td>
          <td align="right">��ְʱ��</td>
          <td><input name="Entrance" type="text" id="Entrance" value="<%=rs("Entrance")%>" size="18"> 
          <font color="red">*</font></td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right"> ��ע</td>
          <td colspan="7" align="left"><textarea name="Comment" cols="100" rows="5" id="Comment"><%=rs("Comment")%></textarea></td>
        </tr>
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="12">
		  <input type="hidden" name="action" value="yes">
          <input type="button" name="Submit2" value="�ύ" onClick="check()">
          <input type="button" name="Submit2" value="����" onClick="history.back(-1)">
		  <input name="id" type="hidden" id="id" value="<%=rs("id")%>">		  </td>
		</tr>
  		</form>
  	</table>
<%
end if
end if
%>
<br>
<%if action="view" then
set rs=server.createobject("adodb.recordset") 
sql="select * from Staff where id="&Request("id")
rs.open sql,conn,1,1
if not rs.eof Then
%>
	  <table width="98%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
		<tr align="center" bgcolor="#F2FDFF">
		  <td colspan="12" class="optiontitle">ְԱ��Ϣ</td>
		</tr>
        <tr bgcolor="#F2FDFF">
          <td width="10%" align="right">ְԱ����</td>
          <td width="20%"><%=rs("Sid")%></td>
          <td width="10%" align="right">ְԱ����</td>
          <td width="15%" ><%=rs("Sname")%></td>
          <td width="10%" align="right">��ѯ����</td>
          <td width="15%"><%=rs("Pws")%></td>
          <td width="10%" align="right">ְԱ״̬</td>
          <td width="10%"><%=rs("State")%></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right">���֤��</td>
          <td><%=rs("Idcard")%></td>
          <td align="right">�Ա�</td>
          <td><%=rs("Sex")%></td>
          <td align="right">����</td>
          <td><%=rs("Home")%></td>
          <td align="right">����</td>
          <td><%=rs("National")%></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right"> ��������</td>
          <td><%=rs("Birth")%></td>
          <td align="right">����״��</td>
          <td><%=rs("Marriage")%></td>
          <td align="right" width="10%">������ò</td>
          <td><%=rs("Political")%></td>
          <td align="right" width="10%">����ʱ��</td>
          <td><%=rs("Political_date")%></td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right"> �Ļ��̶�</td>
          <td><%=rs("Culture")%></td>
          <td align="right">��ҵѧУ</td>
          <td><%=rs("School")%></td>
          <td align="right">��ҵʱ��</td>
          <td><%=rs("Graduate")%></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td align="right"> ��ϵסַ</td>
          <td><%=rs("Address")%></td>
          <td align="right">��ϵ�绰</td>
          <td><%=rs("Phone")%></td>
          <td align="right">Email</td>
          <td><%=rs("Email")%></td>
          <td align="right">�����</td>
          <td><%=rs("IM")%></td>
        </tr>
        <tr bgcolor="#F2FDFF">
          <td align="right"> ���ڲ���</td>
          <td><%=rs("Department")%></td>
          <td align="right">����ְ��</td>
          <td><%=rs("Jobs")%></td>
          <td align="right">ְ��</td>
          <td><%=rs("Duty")%></td>
          <td align="right">��ְʱ��</td>
          <td><%=rs("Entrance")%></td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="right"> ��ע</td>
          <td colspan="7" align="left"><%=rs("Comment")%></td>
        </tr>
		<tr align="center" bgcolor="#ebf0f7">
		  <td colspan="12">
          <input type="button" name="Submit2" value="����" onClick="history.back(-1)">		  </td>
		</tr>
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