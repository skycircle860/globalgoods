<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList supportInfoViewList = (ArrayList)outputTable.get("supportInfoViewList");
	Hashtable supportInfoTable = (Hashtable)supportInfoViewList.get(0);

	String code = (String)supportInfoTable.get("CODE");
	String useYn = (String)supportInfoTable.get("USE_YN");
	String perPage = (String)supportInfoTable.get("PER_PAGE");
	String searchYn = (String)supportInfoTable.get("SEARCH_YN");
	String replyYn = (String)supportInfoTable.get("REPLY_YN");
	String replySort = (String)supportInfoTable.get("REPLY_SORT");
	String addYn = (String)supportInfoTable.get("ADD_YN");
	String addSort = (String)supportInfoTable.get("ADD_SORT");
	String updateYn = (String)supportInfoTable.get("UPDATE_YN");
	String numberType = (String)supportInfoTable.get("NUMBER_TYPE");
	String fileYn = (String)supportInfoTable.get("FILE_YN");
	String regId = (String)supportInfoTable.get("REG_ID");
	String regDate = (String)supportInfoTable.get("REG_DATE");
	String regIp = (String)supportInfoTable.get("REG_IP");
	String updId = (String)supportInfoTable.get("UPD_ID");
	String updDate = (String)supportInfoTable.get("UPD_DATE");
	String updIp = (String)supportInfoTable.get("UPD_IP");

	String useKor = "�����";
	if(useYn.equals("N"))
	{
		useKor = "�̻��";
	}

	String searchKor = "�����";
	if(searchYn.equals("N"))
	{
		searchKor = "�̻��";
	}

	String replyKor = "�����";
	if(replyYn.equals("N"))
	{
		replyKor = "�̻��";
	}

	String addKor = "�����";
	if(addYn.equals("N"))
	{
		addKor = "�̻��";
	}

	String updateKor = "�ۼ� �� ���� ����";
	if(updateYn.equals("N"))
	{
		updateKor = "�� ���⸸ ����";
	}

	String numberKor = "10������ ������ ǥ��";
	if(numberType.equals("C"))
	{
		numberKor = "���� �������� �׻� ��� ǥ��";
	}

	String replySortKor = "�ֱ� ��� �켱 ����";
	if(replySort.equals("STEP"))
	{
		replySortKor = "�ۼ� ������ ����";
	}

	String addSortKor = "�ۼ� ������ ����";
	if(addSort.equals("DESC"))
	{
		addSortKor = "�ֱ� ��� �켱 ����";
	}

	String fileKor = "�����";
	if(fileYn.equals("N"))
	{
		fileKor = "�̻��";
	}
%>

<SCRIPT language="JavaScript">
	// ��� ��� ������ ����
	function goList()
	{
		document.location.href="/managerSupportServlet.mo?func=managerSupport_001";
	}

	// ��� ���� ������ ����
	function goUpdate()
	{
		document.location.href='/managerSupportServlet.mo?func=managerSupport_005&from=info&code=<%= code%>';
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
				<FONT color="white" size="3"><B>�Խ��� �� ����</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="750">
		<TR>
			<TD width="150" bgcolor="#74c900" align="center"><font color="white"><B>�Խ��� �̸�</B></font></TD>
			<TD width="550" bgcolor="#FFFFFF" colspan="3"><%= supportInfoTable.get("NAME")%></TD>
		</TR>
		<TR>
			<TD width="150" bgcolor="#74c900" align="center"><font color="white"><B>CODE</B></font></TD>
			<TD width="200" bgcolor="#FFFFFF"><%= code%></TD>
			<TD width="150" bgcolor="#74c900" align="center"><font color="white"><B>��� ����</B></font></TD>
			<TD width="200" bgcolor="#FFFFFF"><%= useKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>��� ����</B></font></TD>
			<TD bgcolor="#FFFFFF"><B><%= perPage%></B> ���� ���</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>���� ����</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= updateKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�˻� ���</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= searchKor%></TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>Page Number Type</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= numberKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>��� ���</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= replyKor%></TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>��� ����</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= replySortKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>��� ���</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= addKor%></TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>��� ����</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= addSortKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>÷�� ���� ���</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= fileKor%></TD>
			<TD bgcolor="#74c900" align="center"><B></B></TD>
			<TD bgcolor="#FFFFFF"></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�ۼ��� (IP)</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= regId%> (<%= regIp%>)</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�ۼ��Ͻ�</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= regDate%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>���� ������ (IP)</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= updId%> (<%= updIp%>)</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>���� �����Ͻ�</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= updDate%></TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="10"></TD></TR>
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