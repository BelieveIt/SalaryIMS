<!--#include file="inc/right.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>校无忧管理系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	background-color: #E6F0F7;
}
.dtree {
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #0000ff;
	white-space: nowrap;
}
.dtree img {
	border: 0px;
	vertical-align: middle;
}
.dtree a {
	color: #333;
	text-decoration: none;
}
.dtree a.node, .dtree a.nodeSel {
	white-space: nowrap;
	padding: 1px 2px 1px 2px;
}
.dtree a.node:hover, .dtree a.nodeSel:hover {
	color: #0000ff;
}
.dtree a.nodeSel {
	background-color: #AED0F4;
}
.dtree .clip {
	overflow: hidden;
}
-->
</style>
<link href="images/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="images/dtree.js"></script>
</head>
<body>
<table width="96%"  border="0" cellpadding="10" cellspacing="0" align=center >
  <tr>
   <td valign="top" >
   <div class=menu>
    <table width="100%"  border="0" cellpadding="0" cellspacing="0">
     <tr>
      <td height=25><a href="javascript: d.openAll();"><img src="images/view_detailed.gif" width="15" height="15" border="0" align="absmiddle" alt="展开列表"></a> <a href="javascript: d.closeAll();"><img src="images/view_tree.gif" width="15" height="15" border="0" align="absmiddle" alt="收缩列表"></a> | <a href="main.asp" target="mainFrame">系统首页</a> | <a href="../" target="_blank">查询页面</a></td>
     </tr>
     <tr>
      <td>
	  <script type="text/javascript">
	  <!--
	  d = new dTree('d');
	  d.config.target="mainFrame";
	  d.add(0,-1,' 网站内容管理');
      d.add(1, 0, ' 管理员管理', 'Admin.asp?action=list');
	  d.add(2, 0, ' 职员信息管理', '');
	  d.add(21, 2, ' 职员信息列表', 'Staff.asp?action=list');
	  d.add(22, 2, ' 添加职员信息', 'Staff.asp?action=add');
	  d.add(23, 2, ' 批量添加职员', 'Buy.asp');
	  d.add(24, 2, ' 查询职员信息', 'StaffSearch.asp');
	  d.add(25, 2, ' 导出打印[商]', 'Buy.asp') 
	  d.add(26, 2, ' 定制服务[商]', 'Buy.asp') 
	  d.add(3, 0, ' 职员工资管理', '');
	  d.add(31, 3, ' 职员工资列表', 'Salary.asp?action=list');
	  d.add(32, 3, ' 添加职员工资', 'Salary.asp?action=add');
      d.add(33, 3, ' 批量添加工资', 'Buy.asp');
      d.add(34, 3, ' 查询职员工资', 'SalarySearch.asp');
	  d.add(35, 3, ' 导出打印[商]', 'Buy.asp') 
	  d.add(36, 3, ' 定制服务[商]', 'Buy.asp') 
	  d.add(6, 0, ' 数据管理[商]', '');
	  d.add(61, 6, ' 系统占用[商]', 'Buy.asp');
	  d.add(62, 6, ' 压缩数据[商]', 'Buy.asp');	
	  d.add(63, 6, ' 备份数据[商]', 'Buy.asp');	
	  d.add(64, 6, ' 恢复数据[商]', 'Buy.asp');	
	  d.add(8, 0, ' 技术支持', '');
	  d.add(81, 8, ' 网站：校无忧科技', 'http://www.xiao5u.com');
	  d.add(82, 8, ' QQ：94009759', 'tencent://message/?uin=94009759&Site=校无忧-Xiao5u.Com&Menu=yes');		
	  d.add(83, 8, ' KF@Xiao5u.Com', 'mailto:kf@Xiao5u.Com');			
	  document.write(d);
	  //-->
	  </script>
	  </td>
     </tr>
    </table>
   </div>
   </td>
  </tr>
</table>
</body>
</html>