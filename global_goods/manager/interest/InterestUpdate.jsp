<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList interestInfoList = (ArrayList)outputTable.get("interestInfoList");
	Hashtable interestInfoTable = (Hashtable)interestInfoList.get(0);

	String from = (String)inputTable.get("from");

	String code = (String)interestInfoTable.get("CODE");
	String useYn = (String)interestInfoTable.get("USEYN");
	String useKor = "사용중";
	if(useYn.equals("N"))
	{
		useKor = "미사용";
	}
%>
<style>
td{
	height:25px;
}

</style>

<SCRIPT language="JavaScript">
	// 직업 목록 페이지 가기
	function goList()
	{
		document.location.href="/managerInterestServlet.mo?func=managerInterest_001";
	}

	// 직업 수정 취소 버튼
	function cancelAction()
	{
<%
	if(from.equals("list"))
	{
%>
		document.location.href="/managerInterestServlet.mo?func=managerInterest_001";
<%
	}
	else if(from.equals("info"))
	{
%>
		document.location.href="/managerInterestServlet.mo?func=managerInterest_002&code=<%= code%>";
<%
	}
%>
	}

	// 직업 수정
	function updateAction()
	{
		var f = document.updateForm;
		if(trim(f.name.value)=="")
		{
			window.alert("직업의 이름을 입력하세요.");
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
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="750">
		<TR>
			<TD align="center" bgcolor="#74c900" width="750">
				<FONT color="white" size="3"><B>관심사 수정</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR>
			<TD align="right">
				<IMG src="/images/button/button_all_list.gif" border="0" onclick="goList();" style="cursor:hand" align="absmiddle" onClick="goList();">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="750">
		<FORM name="updateForm" method="post" action="/managerInterestServlet.mo" onSubmit="updateAction(); return false;">
			<INPUT type="hidden" name="func" value="managerInterest_005">
			<INPUT type="hidden" name="code" value="<%= code%>">
			<INPUT type="hidden" name="from" value="<%= from%>">
			<TR>
				<TD width="150" bgcolor="#74c900" align="center"><font color="white"><B>CODE</B></font></TD>
				<TD bgcolor="#FFFFFF"><%= code%></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>NAME</B></font></TD>
				<TD bgcolor="#FFFFFF"><INPUT type="text" name="name" value="<%= interestInfoTable.get("NAME")%>"></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>사용 여부</B></font></TD>
				<TD bgcolor="#FFFFFF">
					<SELECT name="yn">
						<OPTION value="Y" <%if(useYn.equals("Y")){%>selected<%}%>>사용</OPTION>
						<OPTION value="N" <%if(useYn.equals("N")){%>selected<%}%>>미사용</OPTION>
					</SELECT>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>작성자 (IP)</B></TD>
				<TD bgcolor="#FFFFFF"><%= interestInfoTable.get("REG_ID")%> (<%= interestInfoTable.get("REG_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>작성일</B></font></TD>
				<TD bgcolor="#FFFFFF"><%= interestInfoTable.get("REG_DATE")%></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>최종 수정자 (IP)</B></font></TD>
				<TD bgcolor="#FFFFFF"><%= interestInfoTable.get("UPD_ID")%> (<%= interestInfoTable.get("UPD_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><font color="white"><B>최종 수정일</B></font></TD>
				<TD bgcolor="#FFFFFF"><%= interestInfoTable.get("UPD_DATE")%></TD>
			</TR>
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="5"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_update.gif" border="0" align="absmiddle" alt="수정" style="cursor:hand" onClick="updateAction();">
				&nbsp;&nbsp;
				<IMG src="/images/button/but_cancel1.gif" border="0" align="absmiddle" alt="취소" style="cursor:hand" onClick="cancelAction();">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>