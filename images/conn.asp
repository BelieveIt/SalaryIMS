<%
dim db,Connstr
db="data/Xiao5u.mdb"  '���ݿ�����·��
Connstr="driver={Microsoft Access Driver (*.mdb)};pwd=Xiao5u;dbq="&Server.MapPath(db)
On Error Resume Next '���Դ���
Set conn=Server.CreateObject("ADODB.Connection")
conn.open ConnStr
If Err Then '�ж��Ƿ��Ǵ���
err.Clear '�������
Set Conn = Nothing '�ر�����
Response.Write "���ݿ����ӳ������������ִ���" '��ʾ����
Response.End 'ֹͣ�������
End If
%>
