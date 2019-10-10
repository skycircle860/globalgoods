<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList supportInfoViewList = (ArrayList)outputTable.get("supportInfoViewList");
	Hashtable supportInfoTable = (Hashtable)supportInfoViewList.get(0);

	String code = (String)supportInfoTable.get("CODE");
	String useYn = (String)supportInfoTable.get("USE_YN");
	String perPage = (String)supportInfoTable.get("PER_PAGE");
	String searchYn = (String)supportInfoTable.get("SEARCH_YN");
	String replyYn = (String)supportInfoTable.get("REPLY_YN");
	String replySort = (String)supportInfoTable.get("REPLY_SORT");
	String addYn = (String)supportInfoTable.get("ADD_YN");
	String addSort = (String)supportInfoTable.get("ADD_SORT");
	String updateYn = (String)supportInfoTable.get("UPDATE_YN");
	String numberType = (String)supportInfoTable.get("NUMBER_TYPE");
	String fileYn = (String)supportInfoTable.get("FILE_YN");
	String regId = (String)supportInfoTable.get("REG_ID");
	String regDate = (String)supportInfoTable.get("REG_DATE");
	String regIp = (String)supportInfoTable.get("REG_IP");
	String updId = (String)supportInfoTable.get("UPD_ID");
	String updDate = (String)supportInfoTable.get("UPD_DATE");
	String updIp = (String)supportInfoTable.get("UPD_IP");

	String useKor = "사용중";
	if(useYn.equals("N"))
	{
		useKor = "미사용";
	}

	String searchKor = "사용중";
	if(searchYn.equals("N"))
	{
		searchKor = "미사용";
	}

	String replyKor = "사용중";
	if(replyYn.equals("N"))
	{
		replyKor = "미사용";
	}

	String addKor = "사용중";
	if(addYn.equals("N"))
	{
		addKor = "미사용";
	}

	String updateKor = "작성 및 수정 가능";
	if(updateYn.equals("N"))
	{
		updateKor = "글 보기만 가능";
	}

	String numberKor = "10페이지 단위로 표시";
	if(numberType.equals("C"))
	{
		numberKor = "현재 페이지를 항상 가운데 표시";
	}

	String replySortKor = "최근 답글 우선 정렬";
	if(replySort.equals("STEP"))
	{
		replySortKor = "작성 순서로 정렬";
	}

	String addSortKor = "작성 순서로 정렬";
	if(addSort.equals("DESC"))
	{
		addSortKor = "최근 댓글 우선 정렬";
	}

	String fileKor = "사용중";
	if(fileYn.equals("N"))
	{
		fileKor = "미사용";
	}
%>

<SCRIPT language="JavaScript">
	// 취미 목록 페이지 가기
	function goList()
	{
		document.location.href="/managerSupportServlet.mo?func=managerSupport_001";
	}

	// 취미 수정 페이지 가기
	function goUpdate()
	{
		document.location.href='/managerSupportServlet.mo?func=managerSupport_005&from=info&code=<%= code%>';
	}
</SCRIPT>
<style>
td{
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
				<FONT color="white" size="3"><B>게시판 상세 정보</B></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="750">
		<TR>
			<TD width="150" bgcolor="#74c900" align="center"><font color="white"><B>게시판 이름</B></font></TD>
			<TD width="550" bgcolor="#FFFFFF" colspan="3"><%= supportInfoTable.get("NAME")%></TD>
		</TR>
		<TR>
			<TD width="150" bgcolor="#74c900" align="center"><font color="white"><B>CODE</B></font></TD>
			<TD width="200" bgcolor="#FFFFFF"><%= code%></TD>
			<TD width="150" bgcolor="#74c900" align="center"><font color="white"><B>사용 여부</B></font></TD>
			<TD width="200" bgcolor="#FFFFFF"><%= useKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>출력 개수</B></font></TD>
			<TD bgcolor="#FFFFFF"><B><%= perPage%></B> 개씩 출력</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>쓰기 권한</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= updateKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>검색 기능</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= searchKor%></TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>Page Number Type</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= numberKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>답글 기능</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= replyKor%></TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>답글 정렬</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= replySortKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>댓글 기능</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= addKor%></TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>댓글 정렬</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= addSortKor%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>첨부 파일 기능</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= fileKor%></TD>
			<TD bgcolor="#74c900" align="center"><B></B></TD>
			<TD bgcolor="#FFFFFF"></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>작성자 (IP)</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= regId%> (<%= regIp%>)</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>작성일시</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= regDate%></TD>
		</TR>
		<TR>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>최종 수정자 (IP)</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= updId%> (<%= updIp%>)</TD>
			<TD bgcolor="#74c900" align="center"><font color="white"><B>최종 수정일시</B></font></TD>
			<TD bgcolor="#FFFFFF"><%= updDate%></TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="10"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_update.gif" border="0" align="absmiddle" alt="수정" style="cursor:hand" onClick="goUpdate();">
				&nbsp;&nbsp;
				<IMG src="/images/button/but_ok.gif" border="0" align="absmiddle" alt="취소" style="cursor:hand" onClick="goList();">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>