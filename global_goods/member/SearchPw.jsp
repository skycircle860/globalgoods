<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	if(outputTable.get("pwSearchList")!= null && ((ArrayList)outputTable.get("pwSearchList")).size() >0)
	{
		ArrayList pwSearchList = (ArrayList)outputTable.get("pwSearchList");
		Hashtable pwTable = (Hashtable)pwSearchList.get(0);
		String pw = (String)pwTable.get("PASS");
		String name = (String)pwTable.get("NAME");
%>
<div style="margin:10px;">
<img src="/images/common/5.gif">&nbsp;<B>��й�ȣ �˻� ���</B>
</div>
<div class="nomal_radius searchIdPwDiv">
<TABLE>
	<TR>
		<TD align="center"><b><%= name %> ���� ��й�ȣ�� <font color="blue"><%= pw %></font> �Դϴ�.</b></TD>
	</TR>
</TABLE>
</div>
<%
	}
	else
	{
%>
<div style="margin:10px;">
<img src="/images/common/5.gif">&nbsp;<B>��й�ȣ �˻� ���</B>
</div>
<div class="nomal_radius searchIdPwDiv">
<TABLE>
	<TR>
		<TD align="center"><b>��ġ�ϴ� ������ �����ϴ�.<b></TD>
	</TR>
</TABLE>
</div>
<%
	}
%>