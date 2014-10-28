<%
dim db,Connstr
db="data/Xiao5u.mdb"  '数据库的相对路径
Connstr="driver={Microsoft Access Driver (*.mdb)};pwd=Xiao5u;dbq="&Server.MapPath(db)
On Error Resume Next '忽略错误
Set conn=Server.CreateObject("ADODB.Connection")
conn.open ConnStr
If Err Then '判断是否是错误
err.Clear '清除错误
Set Conn = Nothing '关闭连接
Response.Write "数据库连接出错，请检查连接字串。" '提示错误
Response.End '停止继续输出
End If
%>
