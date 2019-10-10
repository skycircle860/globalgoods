<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" />

<%
	ArrayList cardList = (ArrayList)outputTable.get("cardList");

	if(cardList.size()==1)
	{
%>
			<%= "1^해당 카드로 구매 가능합니다."%>
<%
	}
	else
	{
%>
			<%= "2^정보가 일치하지 않습니다."%>
<%
	}
%>