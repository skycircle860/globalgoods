<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList interestInfoList = (ArrayList)outputTable.get("interestInfoList");
	Hashtable interestInfoTable = (Hashtable)interestInfoList.get(0);

	String code = (String)interestInfoTable.get("CODE");

	String useYn = (String)interestInfoTable.get("USEYN");
	String useKor = "�����";
	if(useYn.equals("N"))
	{
		useKor = "�̻��";
	}
%>

<SCRIPT language="JavaScript">
	// ��� ��� ������ ����
	function goList()
	{
		document.location.href="/managerInterestServlet.mo?func=managerInterest_001";
	}

	// ��� ���� ������ ����
	function goUpdate()
	{
		document.location.href='/managerInterestServlet.mo?func=managerInterest_004&from=info&code=<%= code%>';
	}
</SCRIPT>
<style>
td{
	height:25px;
}

</style>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="750">
		<TR>
			<TD align="center" bgcolor="#74c900" width="750">
				<FONT color="white" size="3"><B>���ɻ� �� ����</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR><TD height="10"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="750">
		<TR>
			<TD width="150" bgcolor="#74c900" align="center"><FONT color="white"><B>CODE</B></TD></font>
			<TD bgcolor="#FFFFFF"><%= code%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><FONT color="white"><B>NAME</B></TD></font>
			<TD bgcolor="#FFFFFF"><%= interestInfoTable.get("NAME")%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><FONT color="white"><B>��� ����</B></TD></font>
			<TD bgcolor="#FFFFFF"><%= useKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><FONT color="white"><B>�ۼ��� (IP)</B></TD></font>
			<TD bgcolor="#FFFFFF"><%= interestInfoTable.get("REG_ID")%> (<%= interestInfoTable.get("REG_IP")%>)</TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><FONT color="white"><B>�ۼ���</B></TD></font>
			<TD bgcolor="#FFFFFF"><%= interestInfoTable.get("REG_DATE")%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><FONT color="white"><B>���� ������ (IP)</B></TD></font>
			<TD bgcolor="#FFFFFF"><%= interestInfoTable.get("UPD_ID")%> (<%= interestInfoTable.get("UPD_IP")%>)</TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><FONT color="white"><B>���� ������</B></TD></font>
			<TD bgcolor="#FFFFFF"><%= interestInfoTable.get("UPD_DATE")%></TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="5"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_update.gif" border="0" align="absmiddle" alt="����" style="cursor:hand" onClick="goUpdate();">
				&nbsp;&nbsp;
				<IMG src="/images/button/but_ok.gif" border="0" align="absmiddle" alt="���" style="cursor:hand" onClick="goList();">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>