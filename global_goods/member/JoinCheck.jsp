<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" />

<%
	ArrayList checkIdList = (ArrayList)outputTable.get("checkIdList");
	if(checkIdList.size()==0)
	{
%>
		<%= "1회원 가입이 가능합니다"%>
<%
	}
	else
	{
%>
		<%= "2이미 회원으로 가입되어 있습니다"%>
<%
	}
%>