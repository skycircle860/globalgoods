<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="common.conf.*" %>
<%@ page import="java.util.*" %>

<%
	ReadConf rc = ReadConf.getReadConf();	//����ƽ �Լ��κ��� ��ü ����
	Hashtable confTable = rc.getConfTable();	//���̺� ����
	ArrayList supportInfoList = (ArrayList)confTable.get("bbsInfoList");	//���� ������ init���� ȣ��� setReadDBData() �Լ��� ���� ��ϵ� DB����Ʈ�� ����
%>

<SCRIPT language="JavaScript">
	// ������ ������ ����
	function goDetailInfo(code)
	{
		document.location.href="/managerSupportServlet.mo?func=managerSupport_002&code="+code;
	}

	// �Խ��� ���� ������ ����
	function goUpdate(code)
	{
		document.location.href='/managerSupportServlet.mo?func=managerSupport_005&from=list&code='+code;
	}

	// �Խ��� ��� or ���� �ϱ�
	function useYnAction(code, yn)
	{
		var alertStr = "�����Ͻ� �Խ����� ������� ���ϰ� �Ͻðڽ��ϱ�?";
		if(yn=='Y')
		{
			alertStr = "�����Ͻ� �Խ����� ��� �Ͻðڽ��ϱ�?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerSupportServlet.mo?func=managerSupport_007&yn="+yn+"&code="+code;
		}
	}

	// �Խ��� �߰�
	function goAdd()
	{
		document.location.href="/managerSupportServlet.mo?func=managerSupport_003";
	}
</SCRIPT>
<style>
td 
{
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
				<FONT color="white" size="3"><B>�Խ��� ���</B></FONT>
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
	<TABLE cellspacing="1" cellpadding="3" bgcolor="#74c900" width="750">
		<TR bgcolor="#74c900" align="center">
		<TD width="150"><FONT color="white"><B>CODE</B></FONT></TD>
			<TD><FONT color="white"><B>NAME</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>��°���</B></FONT></TD>
			<TD width="40"><FONT color="white"><B>�˻�</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>�ۼ���</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>��뿩��</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>�� ��</B></FONT></TD>
		</TR>
<%
	for(int i=0; i<supportInfoList.size(); i++)
	{
		Hashtable supportInfoTable = (Hashtable)supportInfoList.get(i);
		String code = (String)supportInfoTable.get("CODE");	//��¥�������� �����Ǵ� BBS_�ڵ�14�ڸ�
		String name = (String)supportInfoTable.get("NAME");	//�Խ��� �̸�
		String perPage = (String)supportInfoTable.get("PER_PAGE");	//�������� ��ƼŬ ����
		String searchYn = (String)supportInfoTable.get("SEARCH_YN");	//�˻� ��� �����
		String regId = (String)supportInfoTable.get("REG_ID");	//�Խ��� ��� ���̵�.
		String useYn = (String)supportInfoTable.get("USE_YN");	//�Խ��� ��� ����

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
		<TR bgcolor="<%= bgcolor%>">
			<TD align="center"><A href="javascript:goDetailInfo('<%= code%>')"><B><%= code%></B></A></TD>
			<TD><A href="javascript:goDetailInfo('<%= code%>')"><%= name%></A></TD> <!-- �Խ��� �ڵ�ѹ��� �̸��� ������ ������ ��� -->
			<TD align="center"><%= perPage%></TD>
			<TD align="center"><%= searchYn%></TD>
			<TD align="center"><%= regId%></TD>
			<TD align="center"><B><%= useKor%></B></TD>
			<TD align="center">
				<IMG src="/images/button/sbut_update.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUpdate('<%= code%>')"><!-- �Խ��� ���� ���� -->
<%
		if(useYn.equals("Y"))//�Խ��� ��� ���� ���
		{
%>
				<IMG src="/images/button/sbut_delete.gif" align="absmiddle" border="0" style="cursor:hand" onClick="useYnAction('<%= code%>', 'N');">
<%
		}
		else
		{
%>
				<IMG src="/images/button/sbut_use.gif" align="absmiddle" border="0" style="cursor:hand" onClick="useYnAction('<%= code%>', 'Y');">
<%
		}
%>
			</TD>
		</TR>
<%
	}

	if(supportInfoList.size()==0)	//�Խ����� �Ѱ��� ���� ��.
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="7"><B>��ġ�� �Խ��� ������ �����ϴ�.</B></TD></TR>
<%
	}
%>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>