<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList userList = (ArrayList)outputTable.get("userList");
%>
<style type="text/css">
  td
  {
	 height:25px;
	
  }



 </style>
<SCRIPT language="JavaScript">
	// ����Ȯ��
	function checkAction()
	{
		document.location.href="/commonServlet.mo";
	}

	// ������ ������ ����
	function goDetailInfo(id)
	{
		document.location.href="/managerUserServlet.mo?func=managerUser_002&id="+id;
	}

	// ���� ���� ������ ����
	function goUpdate(id)
	{
		document.location.href='/managerUserServlet.mo?func=managerUser_003&id=' + id + '&from=list';
	}

	// ����� Ż�� YN
	function goUseYn(id, yn)
	{
		document.location.href='/managerUserServlet.mo?func=managerUser_005&from=list&id=' + id + '&yn='+yn;
	}

	// ���� �߰�
	function goAdd()
	{
		document.location.href='/managerUserServlet.mo?func=managerUser_007';
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
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="750">
		<TR>
			<TD align="center" bgcolor="#74c900" width="750" height="100">
				<FONT color="white" size="3"><B>ȸ�� ���</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="5"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR>
			<TD align="right">
				<IMG src="/images/button/button_add.gif" border="0" onclick="goAdd();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="2" bgcolor="#74c900" width="750">
		<TR bgcolor="#74c900" align="center">
			<TD width="40" ><FONT color="white"><B>No.</B></FONT></TD>
			<TD ><B><A href="/managerUserServlet.mo?func=managerUser_001&sort=ID"><FONT color="white">ID</A></B></TD>
			<TD width="85" ><B><FONT color="white">Pass</B></FONT></TD>
			<TD width="100" ><B><A href="/managerUserServlet.mo?func=managerUser_001&sort=JUMIN"><FONT color="white">�ֹι�ȣ</FONT></A></B></TD>
			<TD width="70" ><B><A href="/managerUserServlet.mo?func=managerUser_001&sort=NAME"><FONT color="white">�̸�</FONT></A></B></TD>
			<TD width="80" ><B><A href="/managerUserServlet.mo?func=managerUser_001&sort=REG_DATE"><FONT color="white">������</FONT></A></B></TD>
			<TD width="70" ><B><A href="/managerUserServlet.mo?func=managerUser_001&sort=USEYN"><FONT color="white">��뿩��</FONT></A></B></TD>
			<TD width="75" ><B><A href="/managerUserServlet.mo?func=managerUser_001&sort=ADMINYN"><FONT color="white">ȸ������</FONT></A></B></TD>
			<TD width="100" ><FONT color="white"><B>���</B></FONT></TD>
		</TR>
<%
	for(int i=0; i<userList.size(); i++)
	{
		Hashtable userTable = (Hashtable)userList.get(i);
		String id = (String)userTable.get("ID");
		String pass = (String)userTable.get("PASS");
		String name = (String)userTable.get("NAME");
		String jumin = (String)userTable.get("JUMIN");
		String regDate = (String)userTable.get("REG_DATE");
		String useYn = (String)userTable.get("USEYN");
		String adminYn = (String)userTable.get("ADMINYN");

		String bgcolor = "#FFFFFF";
		String useKor = "�����";
		if(useYn.equals("N"))
		{
			bgcolor = "#E0E0E0";
			useKor = "����";
		}

		String userType = "�Ϲ�ȸ��";
		if(adminYn.equals("Y"))
		{
			bgcolor = "#C9E7F8";
			userType = "������";
		}
%>
		<TR bgcolor="<%= bgcolor%>" align="center">
			<TD><%= i+1%></TD>
			<TD><A href="javascript:goDetailInfo('<%= id%>')"><%= id%></A></TD>
			<TD><%= pass%></TD>
			<TD><%= jumin%></TD>
			<TD><%= name%></TD>
			<TD><%= regDate%></TD>
			<TD><%= useKor%></TD>
			<TD><%= userType%></TD>
			<TD>
				<IMG src="/images/button/sbut_update.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUpdate('<%= id%>')">
<%
		if(useYn.equals("Y"))
		{
%>
				<IMG src="/images/button/sbut_delete.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= id%>', 'N');">
<%
		}
		else
		{
%>
				<IMG src="/images/button/sbut_use.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= id%>', 'Y');">
<%
		}
%>
			</TD>
		</TR>
<%
	}

	if(userList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="8"><B>���Ե� ȸ���� �����ϴ�.</B></TD></TR>
<%
	}
%>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="40"></TD></TR>
	</TABLE>
</CENTER>