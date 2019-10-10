<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<SCRIPT language="JavaScript">
	// 관심사 추가
	function addAction()
	{
		var f = document.addForm;
		if(trim(f.name.value)=="")
		{
			window.alert("관심사의 이름을 입력하세요.");
			f.name.select();
			return false;
		}
		f.name.value = trim(f.name.value);
		f.target = "listWin";
		f.submit();
		window.close();
	}
</SCRIPT>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="15"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="3" bgcolor="#74c900">
		<TR>
			<TD align="center" bgcolor="#74c900" width="350">
				<FONT color="white" size="3"><B>관심사 추가</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="15" width="350"></TD></TR>
		<TR><TD> ** 추가할 관심사의 이름을 입력하세요.</TD></TR>
		<TR><TD height="5"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="350">
		<FORM name="addForm" method="post" action="/managerInterestServlet.mo" onSubmit="addAction(); return false;">
			<INPUT type="hidden" name="func" value="managerInterest_007">
			<TR><TD bgcolor="#74c900" align="center"><font color="white"><B>관 심 사 이 름</B></TD></TR>
			<TR>
				<TD bgcolor="#FFFFFF" align="center"><INPUT type="text" name="name" size="46"></TD>
			</TR>
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="5"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_reg.gif" border="0" align="absmiddle" alt="등록" style="cursor:hand" onClick="addAction();">
				&nbsp;&nbsp;
				<IMG src="/images/button/but_cancel1.gif" border="0" align="absmiddle" alt="취소" style="cursor:hand" onClick="window.close();">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="10"></TD></TR>
	</TABLE>
</CENTER>