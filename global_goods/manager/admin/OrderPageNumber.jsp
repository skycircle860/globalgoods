<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*"%>

<jsp:useBean id="inputTable" class="java.util.Hashtable" scope="request" />

<%
	int pageNum = ((Integer)inputTable.get("pageNum")).intValue();									//사용자가 선택한 페이지 번호
	int pageTotalNum = ((Integer)inputTable.get("pageTotalNum")).intValue();				// 전체 페이지 번호
	int pageStartNum = ((Integer)inputTable.get("pageStartNum")).intValue();				// 시작페이지 번호
	int pageEndNum = ((Integer)inputTable.get("pageEndNum")).intValue();					// 끝페이지 번호

	int articleTotalNum = ((Integer)inputTable.get("articleTotalNum")).intValue();			// 전체 글 수
	int articlePerPage = ((Integer)inputTable.get("articlePerPage")).intValue();				// 한페이지 당 출력되는 글 수.
	int articleStartNum = ((Integer)inputTable.get("articleStartNum")).intValue();			// 시작 글 번호
	int articleEndNum = ((Integer)inputTable.get("articleEndNum")).intValue();				// 끝 글 번호

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
<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>관리자페이지</font>
<TABLE width="750" cellspacing="0" cellpadding="0" border="0">
	<TR valign="top">
		<TD width="200">
			<FORM name="goPageForm" method="post" action="/managerOrderServlet.mo">
				<INPUT type="hidden" name="func" value="managerOrder_001">
				<INPUT type="hidden" name="pageNum">
	

				<SELECT name="pageType" onChange="goPage('<%= pageNum%>')">
					<OPTION value="T"<%if(pageType.equals("T")){%> selected<%}%>>10페이지 단위</OPTION>
					<OPTION value="C"<%if(pageType.equals("C")){%> selected<%}%>>현재페이지 가운데</OPTION>
				</SELECT>
				<SELECT name="articlePerPage" onChange="goPage('1')">
					<OPTION value="5"<%if(articlePerPage==5){%> selected<%}%>>5개</OPTION>
					<OPTION value="10"<%if(articlePerPage==10){%> selected<%}%>>10개</OPTION>
					<OPTION value="15"<%if(articlePerPage==15){%> selected<%}%>>15개</OPTION>
					<OPTION value="20"<%if(articlePerPage==20){%> selected<%}%>>20개</OPTION>
					<OPTION value="30"<%if(articlePerPage==30){%> selected<%}%>>30개</OPTION>
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