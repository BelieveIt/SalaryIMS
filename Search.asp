<!--#include file=images/right.asp -->
<!--#include file=images/conn.asp -->
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>校无忧工资查询_校无忧科技_Www.Xiao5u.Com</title>
<meta http-equiv=Content-type content="text/html; charset=gb2312">
<link href="images/css.css" rel="stylesheet" type="text/css">
<!--#include file=images/ini.sys -->
</head>
<body>
<table cellSpacing=1 cellPadding=5 width=460 align=center bgColor=#b9b0a9 border=0>
  <tbody>
  <tr>
    <td vAlign=top bgColor=#ffffff>
      <table cellSpacing=0 cellPadding=0 width="100%" border=0>
        <tbody>
        <tr><td width=460 background=images/top.gif height=54 class="bt">校无忧工资查询</td></tr>
        <tr>
          <td bgColor=#FFFFFF height=150>
            <table height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <tbody>
              <tr>
                <td valign="top">
                  <table cellSpacing=1 cellPadding=2 width="100%" align=center border=0>
                    <tbody>
                    <tr>
                      <td align=right height=30 width="25%">职员工号：</td>
                      <td><%=session("UserId")%></td>
					  <td align=right width="25%">职员姓名：</td>
					  <td><%=session("UserName")%></td>
                    </tr>
                    <tr align="center">
                      <td><a href="Search.asp">查询工资</a></td>
                      <td><a href="User.asp?action=view">用户信息</a></td>
                      <td><a href="User.asp?action=edit">修改密码</a></td>
                      <td><a href="Logout.asp">退出查询</a></td>
                    </tr>
                    <tr>
					 <form name="search" method="post" action="Search.asp">
                      <td height="30" colspan="4" align=center>
						<select name="Syear">
						<option  value="">-请选择年份-</option>
						<%for y=2013 to year(date())%>
						<option value="<%=y%>"><%=y%></option>
						<%next%>
						</select>
						<select name="Smonth">
						<option value="">-请选择月份-</option>
						<%for m=1 to 12%>
						<option value="<%=m%>"><%=m%></option>
					    <%next%>
						</select> 
            			<input name="Query" type="submit" id="Query" value="查 询">					  </td>
					  </form>
                    </tr>
<%
Syear=trim(Request("Syear"))
Smonth=trim(Request("Smonth"))
Sid=session("UserId")
 sql="select * from Salary where 5=5"
 if Syear<>"" then '按类别显示
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
 sql=sql & " and Sid='" & Sid & "' "
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
                    <tr align="center">
                      <td height="30"><b>基本工资</b></td>
                      <td><b>绩效</b></td>
                      <td><b>津贴</b></td>
                      <td><b>补贴</b></td>
                    </tr>
                    <tr align="center">
                      <td height="30"><%=rs("Basic")%></td>
                      <td><%=rs("Perform")%></td>
                      <td><%=rs("JT")%></td>
                      <td><%=rs("BT")%></td>
                    </tr>
                    <tr align="center">
                      <td height="30"><b>公积金</b></td>
                      <td><b>养老保险</b></td>
                      <td><b>医疗保险</b></td>
                      <td><b>其它</b></td>
                    </tr>
                    <tr align="center">
                      <td height="30"><%=rs("GJJ")%></td>
                      <td><%=rs("LB")%></td>
                      <td><%=rs("YB")%></td>
                      <td><%=rs("QT")%></td>
                    </tr>
                    <tr>
                      <td align="center" height="30"><font color="#FF0000"><b><%=Syear%>年<%=Smonth%>月</b></font></td>
                      <td colspan="3"><b>工资合计：</b><%=rs("Stotal")%> 元</td>
					</tr>
<%
rs.MoveNext 
next
%>
<%
else
%>
        <tr align="center" bgcolor="#FFFFFF">
          <td colspan="8">对不起！目前还没有 <font color="#FF0000"><%=Syear%>年<%=Smonth%>月</font>工资信息！</td>
        </tr>
<%
end if
rs.close
set rs=nothing
%>				
				    </tbody>
				   </table>
				 </td>
			  </tr>
			 </tbody>
		   </table>
		 </td>
		</tr>
        <tr>
          <td align="center" bgColor="#9CBFE5" height=25>2008-2013 &copy;校无忧科技  All Rights Reserved</td>
        </tr>
		</tbody>
	  </table>
	</td>
   </tr>
   </tbody>
  </table>
</body>
</html>