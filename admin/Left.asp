<!--#include file="inc/right.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>У���ǹ���ϵͳ</title>
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
      <td height=25><a href="main.asp" target="mainFrame">ϵͳ��ҳ</a></td>
     </tr>
     <tr>
      <td>
	  <script type="text/javascript">
	  <!--
	  d = new dTree('d');
	  d.config.target="mainFrame";
	  d.add(0,-1,' ��վ���ݹ���');
      d.add(1, 0, ' ����Ա����', 'Admin.asp?action=list');
	  d.add(2, 0, ' ְԱ��Ϣ����', '');
	  d.add(21, 2, ' ְԱ��Ϣ�б�', 'Staff.asp?action=list');
	  d.add(22, 2, ' ���ְԱ��Ϣ', 'Staff.asp?action=add');
	  d.add(24, 2, ' ��ѯְԱ��Ϣ', 'StaffSearch.asp');

	  d.add(3, 0, ' ְԱ���ʹ���', '');
	  d.add(31, 3, ' ְԱ�����б�', 'Salary.asp?action=list');
	  d.add(32, 3, ' ���ְԱ����', 'Salary.asp?action=add');
      d.add(34, 3, ' ��ѯְԱ����', 'SalarySearch.asp');
		
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