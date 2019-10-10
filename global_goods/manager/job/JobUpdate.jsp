<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList jobInfoList = (ArrayList)outputTable.get("jobInfoList");
	Hashtable jobInfoTable = (Hashtable)jobInfoList.get(0);

	String from = (String)inputTable.get("from");

	String code = (String)jobInfoTable.get("CODE");
	String useYn = (String)jobInfoTable.get("USEYN");
	String useKor = "�����";
	if(useYn.equals("N"))
	{
		useKor = "�̻��";
	}
%>

<SCRIPT language="JavaScript">
	// ���� ��� ������ ����
	function goList()
	{
		document.location.href="/managerJobServlet.mo?func=managerJob_001";
	}

	// ���� ���� ��� ��ư
	function cancelAction()
	{
<%
	if(from.equals("list"))
	{
%>
		document.location.href="/managerJobServlet.mo?func=managerJob_001";
<%
	}
	else if(from.equals("info"))
	{
%>
		document.location.href="/managerJobServlet.mo?func=managerJob_002&code=<%= code%>";
<%
	}
%>
	}

	// ���� ����
	function updateAction()
	{
		var f = document.updateForm;
		if(trim(f.name.value)=="")
		{
			window.alert("������ �̸��� �Է��ϼ���.");
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
			<TD align="center" bgcolor="#E4F2FC" width="250">
				<FONT color="blue" size="3"><B>���� ����</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="600">
		<TR>
			<TD align="right">
				<IMG src="/images/button/button_all_list.gif" border="0" onclick="goList();" style="cursor:hand" align="absmiddle" onClick="goList();">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#7682EB" width="600">
		<FORM name="updateForm" method="post" action="/managerJobServlet.mo" onSubmit="updateAction(); return false;">
			<INPUT type="hidden" name="func" value="managerJob_005">
			<INPUT type="hidden" name="code" value="<%= code%>">
			<INPUT type="hidden" name="from" value="<%= from%>">
			<TR>
				<TD width="150" bgcolor="#CFDDFA" align="center"><B>CODE</B></TD>
				<TD bgcolor="#FFFFFF"><%= code%></TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>NAME</B></TD>
				<TD bgcolor="#FFFFFF"><INPUT type="text" name="name" value="<%= jobInfoTable.get("NAME")%>"></TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
				<TD bgcolor="#FFFFFF">
					<SELECT name="yn">
						<OPTION value="Y" <%if(useYn.equals("Y")){%>selected<%}%>>���</OPTION>
						<OPTION value="N" <%if(useYn.equals("N")){%>selected<%}%>>�̻��</OPTION>
					</SELECT>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>�ۼ��� (IP)</B></TD>
				<TD bgcolor="#FFFFFF"><%= jobInfoTable.get("REG_ID")%> (<%= jobInfoTable.get("REG_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>�ۼ���</B></TD>
				<TD bgcolor="#FFFFFF"><%= jobInfoTable.get("REG_DATE")%></TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>���� ������ (IP)</B></TD>
				<TD bgcolor="#FFFFFF"><%= jobInfoTable.get("UPD_ID")%> (<%= jobInfoTable.get("UPD_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>���� ������</B></TD>
				<TD bgcolor="#FFFFFF"><%= jobInfoTable.get("UPD_DATE")%></TD>
			</TR>
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="5"></TD></TR>
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