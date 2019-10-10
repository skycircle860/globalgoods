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
<img src="/images/common/5.gif">&nbsp;<B>아이디 검색 결과</B>
</div>
<div class="nomal_radius searchIdPwDiv">
<TABLE>
	<TR>
		<TD align="center"><b><%= name %> 님의 아이디는<font color="blue"> <%= id %></font> 입니다.</b></TD>
	</TR>
</TABLE>
<div>

<%
	}
	else
	{
%>

<div style="margin:10px;">
<img src="/images/common/5.gif">&nbsp;<B>아이디 검색 결과</B>
</div>
<div class="nomal_radius searchIdPwDiv">
<TABLE>
	<TR>
		<TD align="center"><b>찾으시는 아이디가 없습니다.</b></TD>
	</TR>
</TABLE>
<div>
<%
	}
%>