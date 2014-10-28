<%
session.TimeOut=60
if session("id")="" and session("UserId")="" and session("UserName")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登录或者超时,请登录！');"&"window.location.href = 'index.asp'"&" </script>"
response.end
end if
%>