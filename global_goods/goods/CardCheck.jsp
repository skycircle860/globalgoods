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
			<%= "1^�ش� ī��� ���� �����մϴ�."%>
<%
	}
	else
	{
%>
			<%= "2^������ ��ġ���� �ʽ��ϴ�."%>
<%
	}
%>