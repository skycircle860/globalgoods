<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList interestList = (ArrayList)outputTable.get("interestList");

%>

<SCRIPT language="JavaScript">
	// 정보확인
	function checkAction()
	{
		document.location.href="/commonServlet.mo";
	}

	// 상세정보 페이지 가기
	function goDetailInfo(code)
	{
		document.location.href="/managerInterestServlet.mo?func=managerInterest_002&code="+code;
	}

	// 관심사 수정 페이지 가기
	function goUpdate(code)
	{
		document.location.href='/managerInterestServlet.mo?func=managerInterest_004&from=list&code='+code;
	}

	// 관심사 사용 or 삭제 하기
	function goUseYn(code, yn)
	{
		var alertStr = "선택하신 관심사를 사용하지 못하게 하시겠습니까?";
		if(yn=='Y')
		{
			alertStr = "선택하신 관심사를 사용 하시겠습니까?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerInterestServlet.mo?func=managerInterest_003&yn="+yn+"&code="+code;
		}
	}

	// 관심사 추가
	function goAdd()
	{
		window.open("/common/Progress.jsp", "addInterest", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
		window.name = "listWin";
		document.addForm.submit();
	}

</SCRIPT>
<STYLE>
td
{
	height:30px;
}

</STYLE>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="750">
		<TR>
			<TD align="center" bgcolor="#74c900" width="750">
				<FONT color="white" size="3"><B>관심사 목록</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR>
			<TD align="right">
				<IMG src="/images/button/button_add.gif" border="0" onclick="goAdd();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="750">
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><FONT color="white"><B>CODE</B></FONT></TD>
			<TD><FONT color="white"><B>NAME</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>작 성 자</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>최종수정자</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>사용 여부</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>기 능</B></FONT></TD>
				 
		</TR>
<%
	for(int i=0; i<interestList.size(); i++)
	{
		Hashtable interestTable = (Hashtable)interestList.get(i);
		String code = (String)interestTable.get("CODE");
		String name = (String)interestTable.get("NAME");
		String regId = (String)interestTable.get("REG_ID");
		String updId = (String)interestTable.get("UPD_ID");
		String useYn = (String)interestTable.get("USEYN");

		String bgcolor = "#FFFFFF";
		if(useYn.equals("N"))
		{
			bgcolor = "#E0E0E0";
		}

		String useKor = "사용중";
		if(useYn.equals("N"))
		{
			useKor = "미사용";
		}
%>
		<TR bgcolor="<%= bgcolor%>" align="center">
			<TD><A href="javascript:goDetailInfo('<%= code%>')"><%= code%></A></TD>
			<TD><A href="javascript:goDetailInfo('<%= code%>')"><%= name%></A></TD>
			<TD><%= regId%></TD>
			<TD><%= updId%></TD>
			<TD><B><%= useKor%></B></TD>
			<TD>
				<IMG src="/images/button/sbut_update.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUpdate('<%= code%>')">
<%
		if(useYn.equals("Y"))
		{
%>
				<IMG src="/images/button/sbut_delete.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= code%>', 'N');">
<%
		}
		else
		{
%>
				<IMG src="/images/button/sbut_use.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= code%>', 'Y');">
<%
		}
%>
			</TD>
		</TR>
<%
	}

	if(interestList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><B>설정된 관심사 정보가 없습니다.</B></TD></TR>
<%
	}
%>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR><TD height="5"></TD></TR>
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_ok.gif" border="0" onclick="checkAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>
<FORM name="addForm" method="post" action="/managerInterestServlet.mo" target="addInterest">
	<INPUT type="hidden" name="func" value="managerInterest_006">
</FORM>