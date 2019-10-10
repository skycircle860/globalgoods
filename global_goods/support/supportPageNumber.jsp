<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="support.*" %>
<%@ page import="java.util.*"%>

<jsp:useBean id="inputTable" class="java.util.Hashtable" scope="request" />

<%
	String code = (String)inputTable.get("code");
	System.out.println("inputTable1 : "+inputTable);
	
	SupportInfomation si = new SupportInfomation(code);
	System.out.println("inputTable2 : "+inputTable);

	int pageNum = ((Integer)inputTable.get("pageNum")).intValue();									//����ڰ� ������ ������ ��ȣ
	int pageTotalNum = ((Integer)inputTable.get("pageTotalNum")).intValue();				// ��ü ������ ��ȣ
	int pageStartNum = ((Integer)inputTable.get("pageStartNum")).intValue();				// ���������� ��ȣ
	int pageEndNum = ((Integer)inputTable.get("pageEndNum")).intValue();					// �������� ��ȣ

	int articleTotalNum = ((Integer)inputTable.get("articleTotalNum")).intValue();				// ��ü �� ��
	int articleStartNum = ((Integer)inputTable.get("articleStartNum")).intValue();				// ���� �� ��ȣ
	int articleEndNum = ((Integer)inputTable.get("articleEndNum")).intValue();				// �� �� ��ȣ

	String pageType = (String)inputTable.get("pageType");
	String sort = (String)inputTable.get("sort");

	String section = "TC";
	if(inputTable.containsKey("section"))
	{
		section = (String)inputTable.get("section");
	}

	String word = "";
	if(inputTable.containsKey("word"))
	{
		word = (String)inputTable.get("word");
	}
%>
<SCRIPT>
	function goPage(pgNum)
	{
		var f = document.goPageForm;
		f.pageNum.value=pgNum;
		f.submit();
	}
</SCRIPT>

<TABLE width="750" cellspacing="0" cellpadding="0" border="0">
	<TR valign="top">
		<TD align="center" width="750">
<%
	if(articleTotalNum>0)
	{
		if(pageNum > 1)
		{
%>
			<A href="javascript:goPage('1')"><FONT color="#7C0722"><B>ó��������</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">ó��������</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		if(pageStartNum > 1)
		{
%>
			<A href="javascript:goPage('<%= pageStartNum-1%>')"><FONT color="#F32957"><B>����</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">����</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		for(int i=pageStartNum; i<=pageEndNum; i++)
		{
			if(i==pageNum)
			{
%>
			<B><FONT color="blue"><%= i%></FONT></B>&nbsp;&nbsp;
<%
			}
			else
			{
%>
			<A href="javascript:goPage('<%= i%>')"><%= i%></A>&nbsp;&nbsp;
<%
			}
		}
%>

<%
		if(pageTotalNum > pageEndNum)
		{
%>
			<A href="javascript:goPage('<%= pageEndNum+1%>')"><FONT color="#29BA43"><B>����</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">����</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		if(pageNum < pageTotalNum)
		{
%>
			<A href="javascript:goPage('<%= pageTotalNum%>')"><FONT color="#3C6F4A"><B>��������</B></FONT></A>
<%
		}
		else
		{
%>
			<FONT color="gray">��������</FONT>
<%
		}
	}
%>
		</TD>
	</TR>
</TABLE>
<FORM name="goPageForm" method="post" action="/supportServlet.mo">
	<INPUT type="hidden" name="func" value="support_002">
	<INPUT type="hidden" name="pageNum">
	<INPUT type="hidden" name="code" value="<%= code%>">
	<INPUT type="hidden" name="section" value="<%= section%>">
	<INPUT type="hidden" name="word" value="<%= word%>">
</FORM>