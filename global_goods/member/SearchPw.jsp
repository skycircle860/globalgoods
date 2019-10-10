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
<img src="/images/common/5.gif">&nbsp;<B>비밀번호 검색 결과</B>
</div>
<div class="nomal_radius searchIdPwDiv">
<TABLE>
	<TR>
		<TD align="center"><b><%= name %> 님의 비밀번호는 <font color="blue"><%= pw %></font> 입니다.</b></TD>
	</TR>
</TABLE>
</div>
<%
	}
	else
	{
%>
<div style="margin:10px;">
<img src="/images/common/5.gif">&nbsp;<B>비밀번호 검색 결과</B>
</div>
<div class="nomal_radius searchIdPwDiv">
<TABLE>
	<TR>
		<TD align="center"><b>일치하는 정보가 없습니다.<b></TD>
	</TR>
</TABLE>
</div>
<%
	}
%>