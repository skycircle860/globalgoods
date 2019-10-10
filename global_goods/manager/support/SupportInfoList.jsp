<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="common.conf.*" %>
<%@ page import="java.util.*" %>

<%
	ReadConf rc = ReadConf.getReadConf();	//스테틱 함수로부터 객체 리턴
	Hashtable confTable = rc.getConfTable();	//테이블 얻어옴
	ArrayList supportInfoList = (ArrayList)confTable.get("bbsInfoList");	//메인 서블릿의 init에서 호출된 setReadDBData() 함수를 통해 등록된 DB리스트를 얻어옴
%>

<SCRIPT language="JavaScript">
	// 상세정보 페이지 가기
	function goDetailInfo(code)
	{
		document.location.href="/managerSupportServlet.mo?func=managerSupport_002&code="+code;
	}

	// 게시판 수정 페이지 가기
	function goUpdate(code)
	{
		document.location.href='/managerSupportServlet.mo?func=managerSupport_005&from=list&code='+code;
	}

	// 게시판 사용 or 삭제 하기
	function useYnAction(code, yn)
	{
		var alertStr = "선택하신 게시판을 사용하지 못하게 하시겠습니까?";
		if(yn=='Y')
		{
			alertStr = "선택하신 게시판을 사용 하시겠습니까?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerSupportServlet.mo?func=managerSupport_007&yn="+yn+"&code="+code;
		}
	}

	// 게시판 추가
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
				<FONT color="white" size="3"><B>게시판 목록</B></FONT>
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
			<TD width="100"><FONT color="white"><B>출력개수</B></FONT></TD>
			<TD width="40"><FONT color="white"><B>검색</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>작성자</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>사용여부</B></FONT></TD>
			<TD width="100"><FONT color="white"><B>기 능</B></FONT></TD>
		</TR>
<%
	for(int i=0; i<supportInfoList.size(); i++)
	{
		Hashtable supportInfoTable = (Hashtable)supportInfoList.get(i);
		String code = (String)supportInfoTable.get("CODE");	//날짜기준으로 생성되는 BBS_코드14자리
		String name = (String)supportInfoTable.get("NAME");	//게시판 이름
		String perPage = (String)supportInfoTable.get("PER_PAGE");	//페이지당 아티클 갯수
		String searchYn = (String)supportInfoTable.get("SEARCH_YN");	//검색 허용 비허용
		String regId = (String)supportInfoTable.get("REG_ID");	//게시판 등록 아이디.
		String useYn = (String)supportInfoTable.get("USE_YN");	//게시판 사용 여부

		String bgcolor = "#FFFFFF";
		if(useYn.equals("N"))
		{
			bgcolor = "#E0E0E0";
		}

		String useKor = "사용중";
		if(useYn.equals("N"))
		{
			useKor = "미사용";
		}
%>
		<TR bgcolor="<%= bgcolor%>">
			<TD align="center"><A href="javascript:goDetailInfo('<%= code%>')"><B><%= code%></B></A></TD>
			<TD><A href="javascript:goDetailInfo('<%= code%>')"><%= name%></A></TD> <!-- 게시판 코드넘버나 이름을 누르면 상세정보 출력 -->
			<TD align="center"><%= perPage%></TD>
			<TD align="center"><%= searchYn%></TD>
			<TD align="center"><%= regId%></TD>
			<TD align="center"><B><%= useKor%></B></TD>
			<TD align="center">
				<IMG src="/images/button/sbut_update.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUpdate('<%= code%>')"><!-- 게시판 정보 수정 -->
<%
		if(useYn.equals("Y"))//게시판 사용 비사용 토글
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

	if(supportInfoList.size()==0)	//게시판이 한개도 없을 때.
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="7"><B>설치된 게시판 정보가 없습니다.</B></TD></TR>
<%
	}
%>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>