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
	String useKor = "사용중";
	if(useYn.equals("N"))
	{
		useKor = "미사용";
	}
%>

<SCRIPT language="JavaScript">
	// 직업 목록 페이지 가기
	function goList()
	{
		document.location.href="/managerJobServlet.mo?func=managerJob_001";
	}

	// 직업 수정 취소 버튼
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
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="250">
		<TR>
			<TD align="center" bgcolor="#E4F2FC" width="250">
				<FONT color="blue" size="3"><B>직업 수정</B></FONT>
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
				<TD bgcolor="#CFDDFA" align="center"><B>사용 여부</B></TD>
				<TD bgcolor="#FFFFFF">
					<SELECT name="yn">
						<OPTION value="Y" <%if(useYn.equals("Y")){%>selected<%}%>>사용</OPTION>
						<OPTION value="N" <%if(useYn.equals("N")){%>selected<%}%>>미사용</OPTION>
					</SELECT>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>작성자 (IP)</B></TD>
				<TD bgcolor="#FFFFFF"><%= jobInfoTable.get("REG_ID")%> (<%= jobInfoTable.get("REG_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>작성일</B></TD>
				<TD bgcolor="#FFFFFF"><%= jobInfoTable.get("REG_DATE")%></TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>최종 수정자 (IP)</B></TD>
				<TD bgcolor="#FFFFFF"><%= jobInfoTable.get("UPD_ID")%> (<%= jobInfoTable.get("UPD_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>최종 수정일</B></TD>
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