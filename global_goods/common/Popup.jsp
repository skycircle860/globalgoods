<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java"%>

<%
	String mainUrl = "/common/Progress.jsp";
	if(request.getAttribute("mainUrl") != null && ((String)request.getAttribute("mainUrl")).length() > 0)
	{
		System.out.println("popup���Ѿ�� mainUrl �� : "+mainUrl);
		mainUrl = (String)request.getAttribute("mainUrl");
	}

	String message = "";
	if(request.getAttribute("message")!=null && ((String)request.getAttribute("message")).length()>0)
	{
		message = (String)request.getAttribute("message");
	}
	if(session.getAttribute("message")!=null && ((String)session.getAttribute("message")).length()>0)
	{
		message = (String)session.getAttribute("message");
		session.setAttribute("message", null);
	}

	if(message.length()>0)
	{
%>
<SCRIPT language="JavaScript">window.alert("<%= message%>");</SCRIPT>
<%
	}
%>

<HTML>
	<HEAD>
		<TITLE>����Ͻʴϱ�?</TITLE>
		<Link href="/css/common.css" rel="stylesheet" type="text/css"/>
		<SCRIPT language="JavaScript" type="text/JavaScript" src="/js/common.js"></SCRIPT>
	</HEAD>

	<BODY bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<TABLE width="100%" cellspacing="0" cellpadding="0" border="0">
			<TR>
				<TD width="100%" valign="middle">
					<!-- Main ȭ�� ���� ���� ------------------->
					<jsp:include page="<%= mainUrl%>" flush="true"/>
					<!-- Main ȭ�� ���� �� --------------------->
				</TD>
			</TR>
		</TABLE>
	</BODY>
</HTML>