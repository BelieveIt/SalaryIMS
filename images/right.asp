<%
session.TimeOut=60
if session("id")="" and session("UserId")="" and session("UserName")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��¼���߳�ʱ,���¼��');"&"window.location.href = 'index.asp'"&" </script>"
response.end
end if
%>