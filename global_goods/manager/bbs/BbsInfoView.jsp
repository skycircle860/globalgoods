<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList bbsInfoViewList = (ArrayList)outputTable.get("bbsInfoViewList");
	Hashtable bbsInfoTable = (Hashtable)bbsInfoViewList.get(0);

	String code = (String)bbsInfoTable.get("CODE");
	String useYn = (String)bbsInfoTable.get("USE_YN");
	String perPage = (String)bbsInfoTable.get("PER_PAGE");
	String searchYn = (String)bbsInfoTable.get("SEARCH_YN");
	String replyYn = (String)bbsInfoTable.get("REPLY_YN");
	String replySort = (String)bbsInfoTable.get("REPLY_SORT");
	String addYn = (String)bbsInfoTable.get("ADD_YN");
	String addSort = (String)bbsInfoTable.get("ADD_SORT");
	String updateYn = (String)bbsInfoTable.get("UPDATE_YN");
	String numberType = (String)bbsInfoTable.get("NUMBER_TYPE");
	String fileYn = (String)bbsInfoTable.get("FILE_YN");
	String regId = (String)bbsInfoTable.get("REG_ID");
	String regDate = (String)bbsInfoTable.get("REG_DATE");
	String regIp = (String)bbsInfoTable.get("REG_IP");
	String updId = (String)bbsInfoTable.get("UPD_ID");
	String updDate = (String)bbsInfoTable.get("UPD_DATE");
	String updIp = (String)bbsInfoTable.get("UPD_IP");

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
		document.location.href="/managerBbsServlet.mo?func=managerBbs_001";
	}

	// ��� ���� ������ ����
	function goUpdate()
	{
		document.location.href='/managerBbsServlet.mo?func=managerBbs_005&from=info&code=<%= code%>';
	}
</SCRIPT>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="250">
		<TR>
			<TD align="center" bgcolor="#CFDDFA" width="250">
				<FONT color="blue" size="3"><B>�Խ��� �� ����</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="600">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#7682EB" width="700">
		<TR>
			<TD width="150" bgcolor="#CFDDFA" align="center"><B>�Խ��� �̸�</B></TD>
			<TD width="550" bgcolor="#FFFFFF" colspan="3"><%= bbsInfoTable.get("NAME")%></TD>
		</TR>
		<TR>
			<TD width="150" bgcolor="#CFDDFA" align="center"><B>CODE</B></TD>
			<TD width="200" bgcolor="#FFFFFF"><%= code%></TD>
			<TD width="150" bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
			<TD width="200" bgcolor="#FFFFFF"><%= useKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
			<TD bgcolor="#FFFFFF"><B><%= perPage%></B> ���� ���</TD>
			<TD bgcolor="#CFDDFA" align="center"><B>���� ����</B></TD>
			<TD bgcolor="#FFFFFF"><%= updateKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>�˻� ���</B></TD>
			<TD bgcolor="#FFFFFF"><%= searchKor%></TD>
			<TD bgcolor="#CFDDFA" align="center"><B>Page Number Type</B></TD>
			<TD bgcolor="#FFFFFF"><%= numberKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>��� ���</B></TD>
			<TD bgcolor="#FFFFFF"><%= replyKor%></TD>
			<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
			<TD bgcolor="#FFFFFF"><%= replySortKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>��� ���</B></TD>
			<TD bgcolor="#FFFFFF"><%= addKor%></TD>
			<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
			<TD bgcolor="#FFFFFF"><%= addSortKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>÷�� ���� ���</B></TD>
			<TD bgcolor="#FFFFFF"><%= fileKor%></TD>
			<TD bgcolor="#CFDDFA" align="center"><B></B></TD>
			<TD bgcolor="#FFFFFF"></TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>�ۼ��� (IP)</B></TD>
			<TD bgcolor="#FFFFFF"><%= regId%> (<%= regIp%>)</TD>
			<TD bgcolor="#CFDDFA" align="center"><B>�ۼ��Ͻ�</B></TD>
			<TD bgcolor="#FFFFFF"><%= regDate%></TD>
		</TR>
		<TR>
			<TD bgcolor="#CFDDFA" align="center"><B>���� ������ (IP)</B></TD>
			<TD bgcolor="#FFFFFF"><%= updId%> (<%= updIp%>)</TD>
			<TD bgcolor="#CFDDFA" align="center"><B>���� �����Ͻ�</B></TD>
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