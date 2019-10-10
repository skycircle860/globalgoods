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

	int pageNum = ((Integer)inputTable.get("pageNum")).intValue();									//사용자가 선택한 페이지 번호
	int pageTotalNum = ((Integer)inputTable.get("pageTotalNum")).intValue();				// 전체 페이지 번호
	int pageStartNum = ((Integer)inputTable.get("pageStartNum")).intValue();				// 시작페이지 번호
	int pageEndNum = ((Integer)inputTable.get("pageEndNum")).intValue();					// 끝페이지 번호

	int articleTotalNum = ((Integer)inputTable.get("articleTotalNum")).intValue();				// 전체 글 수
	int articleStartNum = ((Integer)inputTable.get("articleStartNum")).intValue();				// 시작 글 번호
	int articleEndNum = ((Integer)inputTable.get("articleEndNum")).intValue();				// 끝 글 번호

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
			<A href="javascript:goPage('1')"><FONT color="#7C0722"><B>처음페이지</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">처음페이지</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		if(pageStartNum > 1)
		{
%>
			<A href="javascript:goPage('<%= pageStartNum-1%>')"><FONT color="#F32957"><B>이전</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">이전</FONT>&nbsp;&nbsp;
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
			<A href="javascript:goPage('<%= pageEndNum+1%>')"><FONT color="#29BA43"><B>다음</B></FONT></A>&nbsp;&nbsp;
<%
		}
		else
		{
%>
			<FONT color="gray">다음</FONT>&nbsp;&nbsp;
<%
		}
%>

<%
		if(pageNum < pageTotalNum)
		{
%>
			<A href="javascript:goPage('<%= pageTotalNum%>')"><FONT color="#3C6F4A"><B>끝페이지</B></FONT></A>
<%
		}
		else
		{
%>
			<FONT color="gray">끝페이지</FONT>
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