<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	if(outputTable.get("idSearchList")!= null && ((ArrayList)outputTable.get("idSearchList")).size() >0)
	{
	ArrayList idSearchList = (ArrayList)outputTable.get("idSearchList");
	Hashtable idTable = (Hashtable)idSearchList.get(0);
	String id = (String)idTable.get("ID");
	String name = (String)idTable.get("NAME");

%>

<div style="margin:10px;">
<img src="/images/common/5.gif">&nbsp;<B>���̵� �˻� ���</B>
</div>
<div class="nomal_radius searchIdPwDiv">
<TABLE>
	<TR>
		<TD align="center"><b><%= name %> ���� ���̵��<font color="blue"> <%= id %></font> �Դϴ�.</b></TD>
	</TR>
</TABLE>
<div>

<%
	}
	else
	{
%>

<div style="margin:10px;">
<img src="/images/common/5.gif">&nbsp;<B>���̵� �˻� ���</B>
</div>
<div class="nomal_radius searchIdPwDiv">
<TABLE>
	<TR>
		<TD align="center"><b>ã���ô� ���̵� �����ϴ�.</b></TD>
	</TR>
</TABLE>
<div>
<%
	}
%>