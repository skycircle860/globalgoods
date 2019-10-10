<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<SCRIPT language="JavaScript">
	// 취미 추가
	function addAction()
	{
		var f = document.addForm;
		if(trim(f.name.value)=="")
		{
			window.alert("게시판의 이름을 입력하세요.");
			f.name.select();
			return false;
		}
		f.name.value = trim(f.name.value);

		f.submit();
	}

	// 취미 목록 페이지 가기
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
				<FONT color="blue" size="3"><B>게시판 등록</B></FONT>
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
				<TD width="100" bgcolor="#CFDDFA" align="center"><B>게시판 이름</B></TD>
				<TD width="550" bgcolor="#FFFFFF" colspan="3">
					<INPUT type="text" name="name" size="80">
				</TD>
			</TR>
			<TR>
				<TD width="100" bgcolor="#CFDDFA" align="center"><B>CODE</B></TD>
				<TD width="150" bgcolor="#FFFFFF"><FONT color="#A2A2A2">* 입력할 필요 없습니다.</FONT></TD>
				<TD width="150" bgcolor="#CFDDFA" align="center"><B>사용 여부</B></TD>
				<TD width="300" bgcolor="#FFFFFF">
					<INPUT type="radio" name="useYn" value="Y" checked>사용&nbsp;&nbsp;
					<INPUT type="radio" name="useYn" value="N">미사용
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>출력 개수</B></TD>
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
					</SELECT> 개씩 출력
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>쓰기 권한</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="updateYn" value="Y" checked>글 작성 및 수정 가능&nbsp;&nbsp;
					<INPUT type="radio" name="updateYn" value="N">글 보기만 가능
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>검색 기능</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="searchYn" value="Y" checked>사용&nbsp;&nbsp;
					<INPUT type="radio" name="searchYn" value="N">미사용
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>Page Number Type</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="numberType" value="T" checked>10페이지 단위표시&nbsp;&nbsp;
					<INPUT type="radio" name="numberType" value="C">현재 페이지 가운데 표시
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>답글 기능</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="replyYn" value="Y" checked>사용&nbsp;&nbsp;
					<INPUT type="radio" name="replyYn" value="N">미사용
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>답글 정렬</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="replySort" value="DEPTH" checked>최근글 우선 정렬&nbsp;&nbsp;
					<INPUT type="radio" name="replySort" value="STEP">작성 순서로 정렬
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>댓글 기능</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="addYn" value="Y" checked>사용&nbsp;&nbsp;
					<INPUT type="radio" name="addYn" value="N">미사용
				</TD>
				<TD bgcolor="#CFDDFA" align="center"><B>댓글 정렬</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="addSort" value="DESC" checked>최근글 우선 정렬&nbsp;&nbsp;
					<INPUT type="radio" name="addSort" value="ASC">작성 순서로 정렬
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#CFDDFA" align="center"><B>첨부 파일 기능</B></TD>
				<TD bgcolor="#FFFFFF">
					<INPUT type="radio" name="fileYn" value="Y" checked>사용&nbsp;&nbsp;
					<INPUT type="radio" name="fileYn" value="N">미사용
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
				<IMG src="/images/button/but_reg.gif" border="0" align="absmiddle" alt="등록" style="cursor:hand" onClick="addAction();">
				&nbsp;&nbsp;
				<IMG src="/images/button/but_cancel1.gif" border="0" align="absmiddle" alt="취소" style="cursor:hand" onClick="goList();">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="10"></TD></TR>
	</TABLE>
</CENTER>