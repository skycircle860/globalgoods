<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList interestList = (ArrayList)outputTable.get("interestList");

%>

<SCRIPT language="JavaScript">
	// ����Ȯ��
	function checkAction()
	{
		document.location.href="/commonServlet.mo";
	}

	// ������ ������ ����
	function goDetailInfo(code)
	{
		document.location.href="/managerInterestServlet.mo?func=managerInterest_002&code="+code;
	}

	// ���ɻ� ���� ������ ����
	function goUpdate(code)
	{
		document.location.href='/managerInterestServlet.mo?func=managerInterest_004&from=list&code='+code;
	}

	// ���ɻ� ��� or ���� �ϱ�
	function goUseYn(code, yn)
	{
		var alertStr = "�����Ͻ� ���ɻ縦 ������� ���ϰ� �Ͻðڽ��ϱ�?";
		if(yn=='Y')
		{
			alertStr = "�����Ͻ� ���ɻ縦 ��� �Ͻðڽ��ϱ�?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerInterestServlet.mo?func=managerInterest_003&yn="+yn+"&code="+code;
		}
	}

	// ���ɻ� �߰�
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
				<FONT color="white" size="3"><B>���ɻ� ���</B></FONT>
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
			<TD width="100"><FONT color="white"><B>�� �� ��</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>����������</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>��� ����</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>�� ��</B></FONT></TD>
				 
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

		String useKor = "�����";
		if(useYn.equals("N"))
		{
			useKor = "�̻��";
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
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><B>������ ���ɻ� ������ �����ϴ�.</B></TD></TR>
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