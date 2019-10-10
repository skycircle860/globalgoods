<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*"%>

<jsp:useBean id="inputTable" class="java.util.Hashtable" scope="request" />

<%
	int pageNum = ((Integer)inputTable.get("pageNum")).intValue();									//����ڰ� ������ ������ ��ȣ
	int pageTotalNum = ((Integer)inputTable.get("pageTotalNum")).intValue();				// ��ü ������ ��ȣ
	int pageStartNum = ((Integer)inputTable.get("pageStartNum")).intValue();				// ���������� ��ȣ
	int pageEndNum = ((Integer)inputTable.get("pageEndNum")).intValue();					// �������� ��ȣ

	int articleTotalNum = ((Integer)inputTable.get("articleTotalNum")).intValue();			// ��ü �� ��
	int articlePerPage = ((Integer)inputTable.get("articlePerPage")).intValue();				// �������� �� ��µǴ� �� ��.
	int articleStartNum = ((Integer)inputTable.get("articleStartNum")).intValue();			// ���� �� ��ȣ
	int articleEndNum = ((Integer)inputTable.get("articleEndNum")).intValue();				// �� �� ��ȣ

	String pageType = (String)inputTable.get("pageType");

%>
<SCRIPT>
	function goPage(pgNum)
	{
		var f = document.goPageForm;
		f.pageNum.value=pgNum;
		f.submit();
	}
</SCRIPT>
<div><!-- ����Ʈ ȭ�� ��� �� -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">���� ������ : <A href="/goodsServlet.mo?func=goods_001">Ȩ</A>>������������</font>
<TABLE width="750" cellspacing="0" cellpadding="0" border="0">
	<TR valign="top">
		<TD width="200">
			<FORM name="goPageForm" method="post" action="/managerOrderServlet.mo">
				<INPUT type="hidden" name="func" value="managerOrder_001">
				<INPUT type="hidden" name="pageNum">
	

				<SELECT name="pageType" onChange="goPage('<%= pageNum%>')">
					<OPTION value="T"<%if(pageType.equals("T")){%> selected<%}%>>10������ ����</OPTION>
					<OPTION value="C"<%if(pageType.equals("C")){%> selected<%}%>>���������� ���</OPTION>
				</SELECT>
				<SELECT name="articlePerPage" onChange="goPage('1')">
					<OPTION value="5"<%if(articlePerPage==5){%> selected<%}%>>5��</OPTION>
					<OPTION value="10"<%if(articlePerPage==10){%> selected<%}%>>10��</OPTION>
					<OPTION value="15"<%if(articlePerPage==15){%> selected<%}%>>15��</OPTION>
					<OPTION value="20"<%if(articlePerPage==20){%> selected<%}%>>20��</OPTION>
					<OPTION value="30"<%if(articlePerPage==30){%> selected<%}%>>30��</OPTION>
				</SELECT>
			</FORM>
		</TD>
		<TD align="center" width="550">
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