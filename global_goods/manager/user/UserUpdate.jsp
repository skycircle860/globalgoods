<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList interestList = (ArrayList)outputTable.get("interestList");

	ArrayList userInfoList = (ArrayList)outputTable.get("userInfoList");
	Hashtable userInfoTable = (Hashtable)userInfoList.get(0);
	String id = (String)userInfoTable.get("ID");
	String pass = (String)userInfoTable.get("PASS");
	String passQ_code = (String)userInfoTable.get("PASS_Q");
	String passA = (String)userInfoTable.get("PASS_A");
	String name = (String)userInfoTable.get("NAME");
	String jumin1 = (String)userInfoTable.get("JUMIN1");
	String jumin2 = (String)userInfoTable.get("JUMIN2");
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
%>

<SCRIPT language="JavaScript">
	// ȸ������ ����
	function updateAction()
	{
		var f = document.joinForm;

		// ��й�ȣ �� üũ
		if(f.pass1.value=="")
		{
			window.alert("��й�ȣ�� �Է��ϼ���.");
			f.pass1.select();
			return false;
		}
		if(f.pass1.value.length<4 || f.pass1.value.length>21)
		{
			window.alert("��й�ȣ�� 4�� �̻� 20�� ���Ϸ� �Է��ϼ���.");
			f.pass1.select();
			return false;
		}
		if(isEngNum(f.pass1.value))
		{
			window.alert("��й�ȣ�� ���� �Ǵ� ���� �ҹ��ڸ� �����մϴ�.");
			f.pass1.select();
			return false;
		}
		if(f.pass1.value != f.pass2.value)
		{
			window.alert("��й�ȣ�� Ȯ���Ͽ� �ֽʽÿ�.");
			f.pass2.select();
			return false;
		}
		f.pass1.value = trim(f.pass1.value);

		// ��ȭ��ȣ üũ
		var telCheck = 3;
		if(f.home1.value=="000" && trim(f.home2.value)=="" && trim(f.home3.value)=="" )
		{
			telCheck--;
		}
		else
		{
			if(f.home1.value=="000")
			{
				window.alert("�� ��ȭ ������ȣ�� �����Ͽ� �ֽʽÿ�.");
				f.home1.focus();
				return false;
			}
			if(trim(f.home2.value)=="")
			{
				window.alert("�� ��ȭ ������ �Է��Ͽ� �ֽʽÿ�.");
				f.home2.select();
				return false;
			}
			if(f.home2.value.length<3)
			{
				window.alert("�� ��ȭ ������ �ٸ��� �Է��Ͽ� �ֽʽÿ�.");
				f.home2.select();
				return false;
			}
			if(!isNum(f.home2.value))
			{
				window.alert("��ȭ ��ȣ�� ���ڷ� �Է¹ٶ��ϴ�.");
				f.home2.select();
				return false;
			}
			if(trim(f.home3.value)=="")
			{
				window.alert("�� ��ȭ ���ڸ� ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
				f.home3.select();
				return false;
			}
			if(f.home3.value.length<4)
			{
				window.alert("�� ��ȭ ���ڸ� ��ȣ�� �ٸ��� �Է��Ͽ� �ֽʽÿ�.");
				f.home3.select();
				return false;
			}
			if(!isNum(f.home3.value))
			{
				window.alert("��ȭ ��ȣ�� ���ڷ� �Է¹ٶ��ϴ�.");
				f.home3.select();
				return false;
			}
		}
		if(f.office1.value=="000" && trim(f.office2.value)=="" && trim(f.office3.value)=="" )
		{
			telCheck--;
		}
		else
		{
			if(f.office1.value=="000")
			{
				window.alert("���� ��ȭ ������ȣ�� �����Ͽ� �ֽʽÿ�.");
				f.office1.focus();
				return false;
			}
			if(trim(f.office2.value)=="")
			{
				window.alert("���� ��ȭ ������ �Է��Ͽ� �ֽʽÿ�.");
				f.office2.select();
				return false;
			}
			if(f.office2.value.length<3)
			{
				window.alert("���� ��ȭ ������ �ٸ��� �Է��Ͽ� �ֽʽÿ�.");
				f.office2.select();
				return false;
			}
			if(!isNum(f.office2.value))
			{
				window.alert("��ȭ ��ȣ�� ���ڷ� �Է¹ٶ��ϴ�.");
				f.office2.select();
				return false;
			}
			if(trim(f.office3.value)=="")
			{
				window.alert("���� ��ȭ ���ڸ� ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
				f.office3.select();
				return false;
			}
			if(f.office3.value.length<4)
			{
				window.alert("���� ��ȭ ���ڸ� ��ȣ�� �ٸ��� �Է��Ͽ� �ֽʽÿ�.");
				f.office3.select();
				return false;
			}
			if(!isNum(f.office3.value))
			{
				window.alert("��ȭ ��ȣ�� ���ڷ� �Է¹ٶ��ϴ�.");
				f.office3.select();
				return false;
			}
		}
		if(f.mobile1.value=="000" && trim(f.mobile2.value)=="" && trim(f.mobile3.value)=="" )
		{
			telCheck--;
		}
		else
		{
			if(f.mobile1.value=="000")
			{
				window.alert("�޴� ��ȭ ù°�ڸ��� �����Ͽ� �ֽʽÿ�.");
				f.mobile1.focus();
				return false;
			}
			if(trim(f.mobile2.value)=="")
			{
				window.alert("�޴� ��ȭ ��°�ڸ��� �Է��Ͽ� �ֽʽÿ�.");
				f.mobile2.select();
				return false;
			}
			if(f.mobile2.value.length<3)
			{
				window.alert("�޴� ��ȭ ��°�ڸ��� �ٸ��� �Է��Ͽ� �ֽʽÿ�.");
				f.mobile2.select();
				return false;
			}
			if(!isNum(f.mobile2.value))
			{
				window.alert("��ȭ ��ȣ�� ���ڷ� �Է¹ٶ��ϴ�.");
				f.mobile2.select();
				return false;
			}
			if(trim(f.mobile3.value)=="")
			{
				window.alert("�޴� ��ȭ ���ڸ� ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
				f.mobile3.select();
				return false;
			}
			if(f.mobile3.value.length<4)
			{
				window.alert("�޴� ��ȭ ���ڸ� ��ȣ�� �ٸ��� �Է��Ͽ� �ֽʽÿ�.");
				f.mobile3.select();
				return false;
			}
			if(!isNum(f.mobile3.value))
			{
				window.alert("��ȭ ��ȣ�� ���ڷ� �Է¹ٶ��ϴ�.");
				f.mobile3.select();
				return false;
			}
		}
		if(telCheck==0)
		{
			window.alert("��, ����, �޴� ��ȭ �� �ּ� �ϳ��̻��� �Է��ؾ� �մϴ�.");
			f.home1.focus();
			return false;
		}

		// �����ȣ üũ
		if(f.zipCode1.value=="")
		{
			window.alert("�����ȣ�� �˻��Ͽ� �Է��ϼ���.");
			return false;
		}

		// �ּ� üũ
		if(trim(f.addr2.value)=="")
		{
			window.alert("���ּҸ� �Է��ϼ���.");
			f.addr2.select();
			return false;
		}
		f.addr2.value = trim(f.addr2.value);

		// �̸��� üũ
		if(trim(f.email.value)!="")
		{
			if(isEmailChar(f.email.value))
			{
				window.alert("�̸��� �ּҿ��� ���� �ҹ��ڿ� ����, '@', '.' ���� �Է°����մϴ�.");
				f.email.select();
				return false;
			}
			if((f.email.value).indexOf("@") == -1 || (f.email.value).indexOf(".") == -1 || (f.email.value).indexOf(".")<(f.email.value).indexOf("@") || isNum((f.email.value).charAt(0)))
			{
				window.alert("�̸��� �ּҸ� Ȯ�� �ϼ���.");
				f.email.select();
				return false;
			}
		}

		f.submit();
	}

	// �������� ���
	function cancelAction()
	{
		document.location.href="/managerUserServlet.mo?func=managerUser_002&id=<%= id%>";
	}

	// �����ȣ �˻�
	function searchZipCodeAction()
	{
		window.open("/commonServlet.mo?func=common_001", "zipSearchOpen", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=420, height=500");
	}




	$(document).ready(function(){
<%
	if(!home1.equals("000"))
	{
%>
	document.joinForm.home1.value = "<%= home1%>";
	document.joinForm.home2.value = "<%= home2%>";
	document.joinForm.home3.value = "<%= home3%>";
<%
	}

	if(!office1.equals("000"))
	{
%>
	document.joinForm.office1.value = "<%= office1%>";
	document.joinForm.office2.value = "<%= office2%>";
	document.joinForm.office3.value = "<%= office3%>";
<%
	}

	if(!mobile1.equals("000"))
	{
%>
	document.joinForm.mobile1.value = "<%= mobile1%>";
	document.joinForm.mobile2.value = "<%= mobile2%>";
	document.joinForm.mobile3.value = "<%= mobile3%>";
<%
	}
%>
	document.joinForm.zipCode1.value = "<%= zipCode1%>";
	document.joinForm.zipCode2.value = "<%= zipCode2%>";
	document.joinForm.addr1.value = "<%= addr1%>";
	document.joinForm.addr2.value = "<%= addr2%>";
<%
	if(!email.equals("empty"))
	{
%>
	document.joinForm.email.value = "<%= email%>";
<%
	}
%>
});
</SCRIPT>
<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="700">
		<TR>
			<TD align="center" bgcolor="#74c900" width="250">
				<FONT color="white" size="3"><B>ȸ�� ���� ����</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<BR>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="700">
		<FORM name="joinForm" action="/managerUserServlet.mo" method="post" onSubmit="return false;">
			<INPUT type="hidden" name="func" value="managerUser_004">

			<INPUT type="hidden" name="id" value="<%= id%>">
			<TR>
				<TD width="100" bgcolor="#74c900" align="center"><font color="white"><B>I D</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3"><%= id%></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>��� ��ȣ</B></TD>
				<TD bgcolor="#FFFFFF" width="200"><INPUT type="password" name="pass1" value="<%=pass%>" maxlength="20"></TD>
				<TD bgcolor="#74c900" align="center" width="110"><font color="white"><B>��й�ȣȮ��</B></TD>
				<TD bgcolor="#FFFFFF"><INPUT type="password" name="pass2" value="<%=pass%>" maxlength="20"></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>��й�ȣ<BR>Ȯ�ν� ����</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3">
					<SELECT name="passQ">
						<OPTION value="000">-----------------��  ��------------------</OPTION>
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
							<OPTION value="<%=code%>" selected><%=passQ%></OPTION>
						<%
								}
								else
								{
						%>
							<OPTION value="<%=code%>"><%=passQ%></OPTION>
						<%
								}
							}
						%>
					</SELECT>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>��й�ȣ<BR>Ȯ�ν� �亯</B></TD>
				<TD bgcolor="#FFFFFF" width="300" colspan="3"><INPUT type="text" name="passA" value="<%=passA%>"maxlength="40" size="48"></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>�� ��</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3"><B><%= name%></B></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>�ֹε�Ϲ�ȣ</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3"><%= jumin1%> - *******</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>�� ��ȭ</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3">
					<SELECT name="home1">
						<OPTION value="000">--����--</OPTION>
						<OPTION value="02">02</OPTION>
						<OPTION value="031">031</OPTION>
						<OPTION value="032">032</OPTION>
						<OPTION value="033">033</OPTION>
						<OPTION value="041">041</OPTION>
						<OPTION value="042">042</OPTION>
						<OPTION value="043">043</OPTION>
						<OPTION value="051">051</OPTION>
						<OPTION value="052">052</OPTION>
						<OPTION value="053">053</OPTION>
						<OPTION value="054">054</OPTION>
						<OPTION value="055">055</OPTION>
						<OPTION value="061">061</OPTION>
						<OPTION value="062">062</OPTION>
						<OPTION value="063">063</OPTION>
						<OPTION value="064">064</OPTION>
					</SELECT>
					- <INPUT type="text" name="home2" maxlength="4" size="5">
					- <INPUT type="text" name="home3" maxlength="4" size="5">
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>���� ��ȭ</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3">
					<SELECT name="office1">
						<OPTION value="000">--����--</OPTION>
						<OPTION value="02">02</OPTION>
						<OPTION value="031">031</OPTION>
						<OPTION value="032">032</OPTION>
						<OPTION value="033">033</OPTION>
						<OPTION value="041">041</OPTION>
						<OPTION value="042">042</OPTION>
						<OPTION value="043">043</OPTION>
						<OPTION value="051">051</OPTION>
						<OPTION value="052">052</OPTION>
						<OPTION value="053">053</OPTION>
						<OPTION value="054">054</OPTION>
						<OPTION value="055">055</OPTION>
						<OPTION value="061">061</OPTION>
						<OPTION value="062">062</OPTION>
						<OPTION value="063">063</OPTION>
						<OPTION value="064">064</OPTION>
					</SELECT>
					- <INPUT type="text" name="office2" maxlength="4" size="5">
					- <INPUT type="text" name="office3" maxlength="4" size="5">
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>�޴� ��ȭ</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3">
					<SELECT name="mobile1">
						<OPTION value="000">--����--</OPTION>
						<OPTION value="010">010</OPTION>
						<OPTION value="011">011</OPTION>
						<OPTION value="016">016</OPTION>
						<OPTION value="017">017</OPTION>
						<OPTION value="018">018</OPTION>
						<OPTION value="019">019</OPTION>
					</SELECT>
					- <INPUT type="text" name="mobile2" maxlength="4" size="5">
					- <INPUT type="text" name="mobile3" maxlength="4" size="5">
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>�� ��</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3">
					<INPUT type="text" name="zipCode1" size="5" onclick="searchZipCodeAction();" readonly>
					- <INPUT type="text" name="zipCode2" size="5" onclick="searchZipCodeAction();" readonly>
					<IMG src="/images/button/postcode_search.gif" border="0" style="cursor:hand" align="absmiddle" onclick="searchZipCodeAction();">
					<BR>
					<INPUT type="text" name="addr1" size="60" onclick="searchZipCodeAction();" readonly> (��������)
					<INPUT type="text" name="addr2" size="60"> (���� �� ���ּ�)
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>�̸���</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3">
					<INPUT type="text" name="email" size="60">
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>���ɻ�ǰ</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3" align="center">
					<TABLE width="580">
<%
	int loopNum2 = interestList.size()/5;
	if(interestList.size()%5 != 0)
	{
		loopNum2 = loopNum2 + 1;
	}

	for(int i=0; i<loopNum2; i++)
	{
%>
						<TR>
<%
		for(int j=0; j<5; j++)
		{
			int getNum = (i * 5) + j;
			if(getNum < interestList.size())
			{
				Hashtable interestTable = (Hashtable)interestList.get(getNum);
				String code = (String)interestTable.get("CODE");
				String interestName = (String)interestTable.get("NAME");
%>
							<TD width="115"><INPUT type="checkbox" name="interest" value="<%= code%>" <%if (interest.indexOf(code) != -1){%>checked<%}%>> <%= interestName%></TD>
<%
			}
			else
			{
%>
							<TD width="115"></TD>
<%
			}
		}
%>
						</TR>
<%
	}
%>
					</TABLE>
				</TD>
			</TR>
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="10"></TD></TR>
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_update.gif" border="0" onclick="updateAction();" style="cursor:hand" align="absmiddle">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<IMG src="/images/button/but_cancel1.gif" border="0" onclick="cancelAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
		<TR>
	</TABLE>
</CENTER>

