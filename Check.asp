<!--#include file=images/conn.asp -->
<% 
if request("action")="login" then
   CheckCode=replace(trim(Request("CheckCode")),"'","")
   if CheckCode="" then
      response.write("<script>alert('��֤�벻��Ϊ�գ�');window.close();</script>")
   end if
   if session("CheckCode")="" then
      response.write("<script>alert('��֤��ʧЧ�����������룡');window.close();</script>")
   end if
   if CheckCode<>CStr(session("CheckCode")) then
      response.write("<script>alert('���������֤����ϵͳ�����Ĳ�һ�£����������룡');window.close();</script>")
   end if
   Sid = Request("Sid")
   Idcard = Request("Idcard")
   Pws = Request("Pws")
end if
if Instr(Sid,"or")<>0 or Instr(Idcard,"or")<>0 or Instr(Pws,"or")<>0 or Instr(Sid,"and")<>0 or Instr(Idcard,"and")<>0 or Instr(Pws,"and")<>0 Then
   response.write("<script>alert('û�±���˼Һ�̨��лл��<br>����һ�к���Ը���');window.close();</script>")
else
  if Sid<>"" then
   sql="select * from Staff where Sid='"&trim(Sid)&"' and Pws='"&trim(Pws)&"' "
  else
   sql="select * from Staff where Idcard='"&trim(Idcard)&"' and Pws='"&trim(Pws)&"' "
  end if
  set rs=server.createobject("adodb.recordset") 
  rs.open sql,conn,1,3
    if rs.eof then
       response.write"<SCRIPT language=JavaScript>alert('�Բ��𣬹��Ż����֤�Ų�ƥ��!\n \n���飬�����������룡');"
       response.write"location.href='index.asp'</SCRIPT>"
    else
       session("id")=rs("id")
       session("UserId")=rs("Sid")
       session("UserName")=rs("Sname")
       response.redirect "Search.asp"
	end if 
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
%>