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
			<%= "1^"+id+"^ȸ�� ������ �����մϴ�."%>
<%
	}
	else
	{
%>
			<%= "2^"+id+"^�̹� ȸ������ ���ԵǾ� �ֽ��ϴ�."%>
<%
	}
%>