<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java"%>
<%@ page import="java.util.*" %>

<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	if(request.getAttribute("message")!=null && ((String)request.getAttribute("message")).length()>0)
	{
		String message = (String)request.getAttribute("message");
%>
<SCRIPT language="JavaScript">window.alert("<%= message%>");</SCRIPT>
<%
	}

	String stepUrl = "/commonServlet.mo";
	if(request.getAttribute("stepUrl") != null && ((String)request.getAttribute("stepUrl")).length() > 0)
	{
		stepUrl = (String)request.getAttribute("stepUrl");
	}
%>

<HTML>
	<BODY>
		<FORM name="stepForm" method="post">
<%
	if(inputTable!=null && inputTable.size()>0)
	{
		Enumeration inKeys = inputTable.keys();
		while(inKeys.hasMoreElements())
		{
		String key = (String)inKeys.nextElement();
		String value = (String)inputTable.get(key);
%>
			<INPUT type="hidden" name="<%= key%>" value="<%= value%>">
<%
		}
	}
%>
		</FORM>

		<SCRIPT language="JavaScript">
			document.stepForm.action="<%= stepUrl%>";
			document.stepForm.submit();
		</SCRIPT>
	</BODY>
</HTML>