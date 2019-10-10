<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList jobList = (ArrayList)outputTable.get("jobList");

	ArrayList selectList = (ArrayList)outputTable.get("selectList");
	Hashtable selectTable = (Hashtable)selectList.get(0);
	String item = (String)selectTable.get("ITEM");
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
		document.location.href="/managerJobServlet.mo?func=managerJob_002&code="+code;
	}

	// ���� ���� ������ ����
	function goUpdate(code)
	{
		document.location.href='/managerJobServlet.mo?func=managerJob_004&from=list&code='+code;
	}

	// ���� ��� or ���� �ϱ�
	function goUseYn(code, yn)
	{
		var alertStr = "�����Ͻ� ������ ������� ���ϰ� �Ͻðڽ��ϱ�?";
		if(yn=='Y')
		{
			alertStr = "�����Ͻ� ������ ��� �Ͻðڽ��ϱ�?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerJobServlet.mo?func=managerJob_003&yn="+yn+"&code="+code;
		}
	}

	// ���� �߰�
	function goAdd()
	{
		window.open("/common/Progress.jsp", "addJob", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
		window.name = "listWin";
		document.addForm.submit();
	}

	// ���ù�� ����
	function selectApply()
	{
		document.selectForm.submit();
	}
</SCRIPT>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="250">
		<TR>
			<TD align="center" bgcolor="#E4F2FC" width="250">
				<FONT color="blue" size="3"><B>���� ���� ����</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR><TD height="10"></TD></TR>
		<TR><TD> ** ������ �����ϴ� ����� ���� ���� �� �� �ֽ��ϴ�.</TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="750">
		<FORM name="selectForm" action="/managerJobServlet.mo" method="post" onSubmit="return false;">
			<INPUT type="hidden" name="func" value="managerJob_008">
			<TR>
				<TD bgcolor="#CFDDFA" width="150" align="center"><B>����</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="select" value="S" <%if(item.equals("S")){%>checked<%}%>> ���� ����
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<INPUT type="radio" name="select" value="M" <%if(item.equals("M")){%>checked<%}%>> ���� ���� ����
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<IMG src="/images/button/update_apply.gif" border="0" onclick="selectApply();" style="cursor:hand" align="absmiddle">
				</TD>
			</TR>
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="250">
		<TR>
			<TD align="center" bgcolor="#E4F2FC" width="250">
				<FONT color="blue" size="3"><B>���� ���</B></FONT>
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
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#7682EB" width="750">
		<TR bgcolor="#CFDDFA" align="center">
			<TD width="100"><B>CODE</B></TD>
			<TD bgcolor="#CFDDFA" align="center"><B>NAME</B></TD>
			<TD width="100"><B>�� �� ��</B></TD>
			<TD width="100"><B>����������</B></TD>
			<TD width="100"><B>��� ����</B></TD>
			<TD width="100"><B>�� ��</B></TD>
		</TR>
<%
	for(int i=0; i<jobList.size(); i++)
	{
		Hashtable jobTable = (Hashtable)jobList.get(i);
		String code = (String)jobTable.get("CODE");
		String name = (String)jobTable.get("NAME");
		String regId = (String)jobTable.get("REG_ID");
		String updId = (String)jobTable.get("UPD_ID");
		String useYn = (String)jobTable.get("USEYN");

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

	if(jobList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><B>������ ���� ������ �����ϴ�.</B></TD></TR>
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
<FORM name="addForm" method="post" action="/managerJobServlet.mo" target="addJob">
	<INPUT type="hidden" name="func" value="managerJob_006">
</FORM>