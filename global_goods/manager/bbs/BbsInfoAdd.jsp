<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<SCRIPT language="JavaScript">
	// ��� �߰�
	function addAction()
	{
		var f = document.addForm;
		if(trim(f.name.value)=="")
		{
			window.alert("�Խ����� �̸��� �Է��ϼ���.");
			f.name.select();
			return false;
		}
		f.name.value = trim(f.name.value);

		f.submit();
	}

	// ��� ��� ������ ����
	function goList()
	{
		document.location.href="/managerBbsServlet.mo?func=managerBbs_001";
	}
</SCRIPT>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="250">
		<TR>
			<TD align="center" bgcolor="#CFDDFA" width="250">
				<FONT color="blue" size="3"><B>�Խ��� ���</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="600">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#7682EB" width="700">
		<FORM name="addForm" action="/managerBbsServlet.mo" method="post" onSubmit="return false;">
			<INPUT type="hidden" name="func" value="managerBbs_004">
			<TR>
				<TD width="100" bgcolor="#CFDDFA" align="center"><B>�Խ��� �̸�</B></TD>
				<TD width="550" bgcolor="#FFFFFF" colspan="3">
					<INPUT type="text" name="name" size="80">
				</TD>
			</TR>
			<TR>
				<TD width="100" bgcolor="#CFDDFA" align="center"><B>CODE</B></TD>
				<TD width="150" bgcolor="#FFFFFF"><FONT color="#A2A2A2">* �Է��� �ʿ� �����ϴ�.</FONT></TD>
				<TD width="150" bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
				<TD width="300" bgcolor="#FFFFFF">
					<INPUT type="radio" name="useYn" value="Y" checked>���&nbsp;&nbsp;
					<INPUT type="radio" name="useYn" value="N">�̻��
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
				<TD bgcolor="#FFFFFF">
					<SELECT name="perPage">
						<OPTION value="5">5</OPTION>
						<OPTION value="10">10</OPTION>
						<OPTION value="15" selected>15</OPTION>
						<OPTION value="20">20</OPTION>
						<OPTION value="25">25</OPTION>
						<OPTION value="30">30</OPTION>
						<OPTION value="50">50</OPTION>
						<OPTION value="75">75</OPTION>
						<OPTION value="100">100</OPTION>
					</SELECT> ���� ���
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>���� ����</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="updateYn" value="Y" checked>�� �ۼ� �� ���� ����&nbsp;&nbsp;
					<INPUT type="radio" name="updateYn" value="N">�� ���⸸ ����
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>�˻� ���</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="searchYn" value="Y" checked>���&nbsp;&nbsp;
					<INPUT type="radio" name="searchYn" value="N">�̻��
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>Page Number Type</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="numberType" value="T" checked>10������ ����ǥ��&nbsp;&nbsp;
					<INPUT type="radio" name="numberType" value="C">���� ������ ��� ǥ��
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ���</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="replyYn" value="Y" checked>���&nbsp;&nbsp;
					<INPUT type="radio" name="replyYn" value="N">�̻��
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="replySort" value="DEPTH" checked>�ֱٱ� �켱 ����&nbsp;&nbsp;
					<INPUT type="radio" name="replySort" value="STEP">�ۼ� ������ ����
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ���</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="addYn" value="Y" checked>���&nbsp;&nbsp;
					<INPUT type="radio" name="addYn" value="N">�̻��
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>��� ����</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="addSort" value="DESC" checked>�ֱٱ� �켱 ����&nbsp;&nbsp;
					<INPUT type="radio" name="addSort" value="ASC">�ۼ� ������ ����
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>÷�� ���� ���</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="fileYn" value="Y" checked>���&nbsp;&nbsp;
					<INPUT type="radio" name="fileYn" value="N">�̻��
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B></B></TD>
				<TD bgcolor="#FFFFFF">
				</TD>
			</TR>
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="10"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_reg.gif" border="0" align="absmiddle" alt="���" style="cursor:hand" onClick="addAction();">
				&nbsp;&nbsp;
				<IMG src="/images/button/but_cancel1.gif" border="0" align="absmiddle" alt="���" style="cursor:hand" onClick="goList();">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="10"></TD></TR>
	</TABLE>
</CENTER>