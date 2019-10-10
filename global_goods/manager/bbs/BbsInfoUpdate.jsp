<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />


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

	String from = (String)inputTable.get("from");
%>

<SCRIPT language="JavaScript">
	// �Խ��� ��� ������ ����
	function goList()
	{
		document.location.href="/managerBbsServlet.mo?func=managerBbs_001";
	}

	// ��� ��ư
	function cancelAction()
	{
<%
	if(from.equals("list"))
	{
%>
		document.location.href="/managerBbsServlet.mo?func=managerBbs_001";
<%
	}
	else if(from.equals("info"))
	{
%>
		document.location.href="/managerBbsServlet.mo?func=managerBbs_002&code=<%= code%>";
<%
	}
%>
	}

	// �Խ��� ���� ����
	function updateAction()
	{
		var f = document.updateForm;
		if(trim(f.name.value)=="")
		{
			window.alert("�Խ����� �̸��� �Է��ϼ���.");
			f.name.select();
			return false;
		}
		f.name.value = trim(f.name.value);

		f.submit();
	}
</SCRIPT>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="250">
		<TR>
			<TD align="center" bgcolor="#CFDDFA" width="250">
				<FONT color="blue" size="3"><B>�Խ��� ���� ����</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="600">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="600">
		<TR>
			<TD align="right">
				<IMG src="/images/button/button_all_list.gif" border="0" onclick="goList();" style="cursor:hand" align="absmiddle" onClick="goList();">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#7682EB" width="700">
		<FORM name="updateForm" action="/managerBbsServlet.mo" method="post" onSubmit="return false;">
			<INPUT type="hidden" name="func" value="managerBbs_006">
			<INPUT type="hidden" name="from" value="<%= from%>">
			<INPUT type="hidden" name="code" value="<%= code%>">
			<TR>
				<TD width="150" bgcolor="#CFDDFA" align="center"><B>�Խ��� �̸�</B></TD>
				<TD width="550" bgcolor="#FFFFFF" colspan="3">
					<INPUT type="text" name="name" size="78" value="<%= bbsInfoTable.get("NAME")%>">
				</TD>
			</TR>
			<TR>
				<TD width="150" bgcolor="#CFDDFA" align="center"><B>CODE</B></TD>
				<TD width="120" bgcolor="#FFFFFF"><FONT color="#A2A2A2"><%= code%></FONT></TD>
				<TD width="130" bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
				<TD width="300" bgcolor="#FFFFFF">
					<INPUT type="radio" name="useYn" value="Y"<%if(useYn.equals("Y")){%> checked<%}%>>���&nbsp;&nbsp;
					<INPUT type="radio" name="useYn" value="N"<%if(useYn.equals("N")){%> checked<%}%>>�̻��
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
				<TD bgcolor="#FFFFFF">
					<SELECT name="perPage">
						<OPTION value="5"<%if(perPage.equals("5")){%> selected<%}%>>5</OPTION>
						<OPTION value="10"<%if(perPage.equals("10")){%> selected<%}%>>10</OPTION>
						<OPTION value="15"<%if(perPage.equals("15")){%> selected<%}%>>15</OPTION>
						<OPTION value="20"<%if(perPage.equals("20")){%> selected<%}%>>20</OPTION>
						<OPTION value="25"<%if(perPage.equals("25")){%> selected<%}%>>25</OPTION>
						<OPTION value="30"<%if(perPage.equals("30")){%> selected<%}%>>30</OPTION>
						<OPTION value="50"<%if(perPage.equals("50")){%> selected<%}%>>50</OPTION>
						<OPTION value="75"<%if(perPage.equals("75")){%> selected<%}%>>75</OPTION>
						<OPTION value="100"<%if(perPage.equals("100")){%> selected<%}%>>100</OPTION>
					</SELECT> ���� ���
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>���� ����</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="updateYn" value="Y"<%if(updateYn.equals("Y")){%> checked<%}%>>�� �ۼ� �� ���� ����&nbsp;&nbsp;
					<INPUT type="radio" name="updateYn" value="N"<%if(updateYn.equals("N")){%> checked<%}%>>�� ���⸸ ����
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>�˻� ���</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="searchYn" value="Y"<%if(searchYn.equals("Y")){%> checked<%}%>>���&nbsp;&nbsp;
					<INPUT type="radio" name="searchYn" value="N"<%if(searchYn.equals("N")){%> checked<%}%>>�̻��
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>Page Number Type</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="numberType" value="T"<%if(numberType.equals("T")){%> checked<%}%>>10������ ����ǥ��&nbsp;&nbsp;
					<INPUT type="radio" name="numberType" value="C"<%if(numberType.equals("C")){%> checked<%}%>>���� ������ ��� ǥ��
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ���</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="replyYn" value="Y"<%if(replyYn.equals("Y")){%> checked<%}%>>���&nbsp;&nbsp;
					<INPUT type="radio" name="replyYn" value="N"<%if(replyYn.equals("N")){%> checked<%}%>>�̻��
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="replySort" value="DEPTH"<%if(replySort.equals("DEPTH")){%> checked<%}%>>�ֱٱ� �켱 ����&nbsp;&nbsp;
					<INPUT type="radio" name="replySort" value="STEP"<%if(replySort.equals("STEP")){%> checked<%}%>>�ۼ� ������ ����
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ���</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="addYn" value="Y"<%if(addYn.equals("Y")){%> checked<%}%>>���&nbsp;&nbsp;
					<INPUT type="radio" name="addYn" value="N"<%if(addYn.equals("N")){%> checked<%}%>>�̻��
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="addSort" value="DESC"<%if(addSort.equals("ASC")){%> checked<%}%>>�ֱٱ� �켱 ����&nbsp;&nbsp;
					<INPUT type="radio" name="addSort" value="ASC"<%if(addSort.equals("DESC")){%> checked<%}%>>�ۼ� ������ ����
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>÷�� ���� ���</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="fileYn" value="Y"<%if(fileYn.equals("Y")){%> checked<%}%>>���&nbsp;&nbsp;
					<INPUT type="radio" name="fileYn" value="N"<%if(fileYn.equals("N")){%> checked<%}%>>�̻��
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B></B></TD>
				<TD bgcolor="#FFFFFF">
				</TD>
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
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="10"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_update.gif" border="0" align="absmiddle" alt="����" style="cursor:hand" onClick="updateAction();">
				&nbsp;&nbsp;
				<IMG src="/images/button/but_cancel1.gif" border="0" align="absmiddle" alt="���" style="cursor:hand" onClick="cancelAction();">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>