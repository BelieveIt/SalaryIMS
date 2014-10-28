<!--#include file=images/conn.asp -->
<% 
if request("action")="login" then
   CheckCode=replace(trim(Request("CheckCode")),"'","")
   if CheckCode="" then
      response.write("<script>alert('验证码不能为空！');window.close();</script>")
   end if
   if session("CheckCode")="" then
      response.write("<script>alert('验证码失效，请重新输入！');window.close();</script>")
   end if
   if CheckCode<>CStr(session("CheckCode")) then
      response.write("<script>alert('您输入的验证码与系统产生的不一致，请重新输入！');window.close();</script>")
   end if
   Sid = Request("Sid")
   Idcard = Request("Idcard")
   Pws = Request("Pws")
end if
if Instr(Sid,"or")<>0 or Instr(Idcard,"or")<>0 or Instr(Pws,"or")<>0 or Instr(Sid,"and")<>0 or Instr(Idcard,"and")<>0 or Instr(Pws,"and")<>0 Then
   response.write("<script>alert('没事别搞人家后台，谢谢！<br>否则一切后果自负！');window.close();</script>")
else
  if Sid<>"" then
   sql="select * from Staff where Sid='"&trim(Sid)&"' and Pws='"&trim(Pws)&"' "
  else
   sql="select * from Staff where Idcard='"&trim(Idcard)&"' and Pws='"&trim(Pws)&"' "
  end if
  set rs=server.createobject("adodb.recordset") 
  rs.open sql,conn,1,3
    if rs.eof then
       response.write"<SCRIPT language=JavaScript>alert('对不起，工号或身份证号不匹配!\n \n请检查，返回重新输入！');"
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