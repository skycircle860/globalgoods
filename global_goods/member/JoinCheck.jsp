<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" />

<%
	ArrayList checkIdList = (ArrayList)outputTable.get("checkIdList");
	if(checkIdList.size()==0)
	{
%>
		<%= "1ȸ�� ������ �����մϴ�"%>
<%
	}
	else
	{
%>
		<%= "2�̹� ȸ������ ���ԵǾ� �ֽ��ϴ�"%>
<%
	}
%>