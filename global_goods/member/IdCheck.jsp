<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" />

<%
	ArrayList checkIdList = (ArrayList)outputTable.get("checkIdList");
	String id = (String)inputTable.get("id");

	if(checkIdList.size()==0)
	{
%>
			<%= "1^"+id+"^회원 가입이 가능합니다."%>
<%
	}
	else
	{
%>
			<%= "2^"+id+"^이미 회원으로 가입되어 있습니다."%>
<%
	}
%>