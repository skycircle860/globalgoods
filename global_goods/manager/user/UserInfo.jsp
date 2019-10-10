<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList interestList = (ArrayList)outputTable.get("interestList");

	ArrayList userInfoList = (ArrayList)outputTable.get("userInfoList");
	Hashtable userInfoTable = (Hashtable)userInfoList.get(0);
	String id = (String)userInfoTable.get("ID");
	String pass = (String)userInfoTable.get("PASS");
	String name = (String)userInfoTable.get("NAME");
	String passQ_code = (String)userInfoTable.get("PASS_Q");
	String passA = (String)userInfoTable.get("PASS_A");
	String jumin1 = (String)userInfoTable.get("JUMIN1");
	String home1 = (String)userInfoTable.get("HOME1");
	String home2 = (String)userInfoTable.get("HOME2");
	String home3 = (String)userInfoTable.get("HOME3");
	String office1 = (String)userInfoTable.get("OFFICE1");
	String office2 = (String)userInfoTable.get("OFFICE2");
	String office3 = (String)userInfoTable.get("OFFICE3");
	String mobile1 = (String)userInfoTable.get("MOBILE1");
	String mobile2 = (String)userInfoTable.get("MOBILE2");
	String mobile3 = (String)userInfoTable.get("MOBILE3");
	String zipCode1 = (String)userInfoTable.get("ZIPCODE1");
	String zipCode2 = (String)userInfoTable.get("ZIPCODE2");
	String addr1 = (String)userInfoTable.get("ADDR1");
	String addr2 = (String)userInfoTable.get("ADDR2");
	String email = (String)userInfoTable.get("EMAIL");
	String interest = (String)userInfoTable.get("INTEREST");
	String useYn = (String)userInfoTable.get("USEYN");
	String adminYn = (String)userInfoTable.get("ADMINYN");
	String regId = (String)userInfoTable.get("REG_ID");
	String regDate = (String)userInfoTable.get("REG_DATE");
	String regIp = (String)userInfoTable.get("REG_IP");
	String updId = (String)userInfoTable.get("UPD_ID");
	String updDate = (String)userInfoTable.get("UPD_DATE");
	String updIp = (String)userInfoTable.get("UPD_IP");
	/*
	if (passQ.equals("001"))
	{
		passQ = "��￡ ���� �߾��� ��Ҵ�?";
	}
	else if (passQ.equals("002"))
	{
		passQ = "�ڽ��� �λ� �¿����?";
	}
	else if (passQ.equals("003"))
	{
		passQ = "�ڽ��� ���� �� 1ȣ��?";
	}
	else if (passQ.equals("004"))
	{
		passQ = "���� ��￡ ���� ������ ������?";
	}
	else if (passQ.equals("005"))
	{
		passQ = "Ÿ���� �𸣴� �ڽŸ��� ��ü ����� �ִٸ�?";
	}
	else if (passQ.equals("006"))
	{
		passQ = "�߾��ϰ� ���� ��¥�� �ִٸ�?";
	}
	else if (passQ.equals("007"))
	{
		passQ = "�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?";
	}
	else if (passQ.equals("008"))
	{
		passQ = "���� ģ�� ģ���� �̸���?";
	}
	else if (passQ.equals("009"))
	{
		passQ = "�λ� ��� ���� å �̸���?";
	}
	else if (passQ.equals("010"))
	{
		passQ = "���� å �߿��� �����ϴ� ������ �ִٸ�?";
	}
	else if (passQ.equals("011"))
	{
		passQ = "�ڽ��� �ι�°�� �����ϴ� �ι���?";
	}
	else if (passQ.equals("012"))
	{
		passQ = "ģ���鿡�� �������� ���� � �� ������ �ִٸ�?";
	}
	else if (passQ.equals("013"))
	{
		passQ = "�ʵ��б� �� ��￡ ���� ¦�� �̸���?";
	}
	else if (passQ.equals("014"))
	{
		passQ = "�ٽ� �¾�� �ǰ� ���� ����?";
	}
	else if (passQ.equals("015"))
	{
		passQ = "���� �����ϴ� ĳ���ʹ�?";
	}
*/


	String userType = "�Ϲ�ȸ��";
	String adminLink = "<A href='/managerUserServlet.mo?func=managerUser_006&id="+id+"&yn=Y'>�����ڷ� ����</A>";
	if(adminYn.equals("Y"))
	{
		userType = "������";
		adminLink = "<A href='/managerUserServlet.mo?func=managerUser_006&id="+id+"&yn=N'>�Ϲ�ȸ������ ����</A>";
	}

	String useState = "�����";
	if(useYn.equals("N"))
	{
		useState = "�̻��";
	}
%>

<SCRIPT language="JavaScript">
	// ��������� ����
	function goList()
	{
		document.location.href="/managerUserServlet.mo?func=managerUser_001";
	}

	// ����� Ż�� YN
	function goUseYn(yn)
	{
		document.location.href='/managerUserServlet.mo?func=managerUser_005&from=info&id=<%= id%>&yn='+yn;
	}

	// �������� ������ ����
	function goUpdate()
	{
		document.location.href='/managerUserServlet.mo?func=managerUser_003&id=<%= id%>&from=info';
	}
</SCRIPT>
<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="700">
		<TR>
			<TD align="center" bgcolor="#74c900" width="700">
				<FONT color="white" size="3"><B>ȸ�� �� ����</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<BR>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="700">
		<TR>
			<TD width="100" bgcolor="#74c900" align="center"><font color="white"><B>I D</B></TD>
			<TD width="250" bgcolor="#FFFFFF"><%= id%></TD>
			<TD width="100" bgcolor="#74c900" align="center"><font color="white"><B>�� ��</B></TD>
			<TD width="250" bgcolor="#FFFFFF"><%= name%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>��й�ȣ<BR>Ȯ�ν� ����</B>
			</TD>
			<TD bgcolor="#FFFFFF" colspan="3">
					<%
						ArrayList passQList = (ArrayList)outputTable.get("passQList");
						for(int i = 0 ; i<passQList.size(); i++)
						{
							Hashtable passQTable = (Hashtable)passQList.get(i);
							String code = (String)passQTable.get("CODE");
							String passQ = (String)passQTable.get("PASS_Q");
							if(code.equals(passQ_code))
							{
								%>
									<%=passQ%>
								<%
							}
						}
					%>
			</TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>��й�ȣ<BR>Ȯ�ν� �亯</B></TD>
			<TD bgcolor="#FFFFFF" width="300" colspan="3"><%=passA%></TD>
		</TR>
		<TR>
			<TD width="100" bgcolor="#74c900" align="center"><font color="white"><B>��뿩��</B></TD>
			<TD width="250" bgcolor="#FFFFFF">
				<%= useState%>&nbsp;&nbsp;&nbsp;
<%
		if(useYn.equals("Y"))
		{
%>
				<IMG src="/images/button/sbut_delete.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('N');">
<%
		}
		else
		{
%>
				<IMG src="/images/button/sbut_use.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('Y');">
<%
		}
%>
			</TD>
			<TD width="100" bgcolor="#74c900" align="center"><font color="white"><B>ȸ������</B></TD>
			<TD width="250" bgcolor="#FFFFFF">
				<%= userType%>&nbsp;&nbsp;<FONT color="blue"><B><%= adminLink%></B></FONT>
			</TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>PASS</B></TD>
			<TD bgcolor="#FFFFFF"><%= pass%></TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�ֹε�Ϲ�ȣ</B></TD>
			<TD bgcolor="#FFFFFF"><%= jumin1%> - *******</TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�޴� ��ȭ</B></TD>
			<TD bgcolor="#FFFFFF">
<%
	if(!mobile1.equals("000"))
	{
%>
					<%= mobile1%> - <%= mobile2%> - <%= mobile3%>
<%
	}
	else
	{
%>
				<FONT color='red'>���Է�</FONT>
<%
	}
%>
			</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�̸���</B></TD>
			<TD bgcolor="#FFFFFF">
<%
	if(!email.equals("empty"))
	{
%>
					<%= email%>
<%
	}
	else
	{
%>
				<FONT color='red'>���Է�</FONT>
<%
	}
%>
			</TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�� ��ȭ</B></TD>
			<TD bgcolor="#FFFFFF">
<%
	if(!home1.equals("000"))
	{
%>
					<%= home1%> - <%= home2%> - <%= home3%>
<%
	}
	else
	{
%>
				<FONT color='red'>���Է�</FONT>
<%
	}
%>
			</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>���� ��ȭ</B></TD>
			<TD bgcolor="#FFFFFF">
<%
	if(!office1.equals("000"))
	{
%>
					<%= office1%> - <%= office2%> - <%= office3%>
<%
	}
	else
	{
%>
				<FONT color='red'>���Է�</FONT>
<%
	}
%>
			</TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�� ��</B></TD>
			<TD bgcolor="#FFFFFF" colspan="3">
				(<%= zipCode1%>-<%= zipCode2%>) <%= addr1%> <%= addr2%>
			</TD>
		</TR>
		<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>���� ��ǰ</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3">
<%
	int interestCount = 0;
	String interestName = "";
	if(!interest.equals("empty"))
	{
		for(int i=0; i<interestList.size(); i++)
		{
			Hashtable interestTable = (Hashtable)interestList.get(i);
			String code = (String)interestTable.get("CODE");
			if(interest.indexOf(code) != -1)
			{
				interestCount++;
				if(interestCount > 1)
				{
					interestName = interestName + ", ";
				}

				interestName = interestName + interestTable.get("NAME");
			}
		}
	}
	else
	{
		interestName = "<FONT color='red'>���Է�</FONT>";
	}
%>
					<%= interestName%>
			</TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>������</B></TD>
			<TD bgcolor="#FFFFFF"><%= regId%>(<%= regIp%>)</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�����Ͻ�</B></TD>
			<TD bgcolor="#FFFFFF"><%= regDate%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>����������</B></TD>
			<TD bgcolor="#FFFFFF"><%= updId%>(<%= updIp%>)</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>�����Ͻ�</B></TD>
			<TD bgcolor="#FFFFFF"><%= updDate%></TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="10"></TD></TR>
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_list.gif" border="0" onclick="goList();" style="cursor:hand" align="absmiddle">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<IMG src="/images/button/but_update.gif" border="0" onclick="goUpdate();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>