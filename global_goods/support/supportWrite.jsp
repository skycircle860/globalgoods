<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java"%>
<%@ page import="support.*" %>

<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />


<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String code = (String)inputTable.get("code");
	
	SupportInfomation si = new SupportInfomation(code);
	String bbsName = si.getName();

	String pageNum = (String)inputTable.get("pageNum");
	String section = (String)inputTable.get("section");
	String word = (String)inputTable.get("word");

%>

<SCRIPT language="JavaScript">
	function writeAction()
	{
		var f = document.writeForm;
		if(trim(f.title.value)=="")
		{
			window.alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if(trim(f.content.value)=="")
		{
			window.alert("본문을 입력하세요");
			f.content.focus();
			return false;
		}
		f.func.value="support_004";

		f.submit();
	}

	function cancelAction()
	{
		window.alert("글쓰기가 취소되었습니다.");
		var f = document.writeForm;
		f.func.value="support_002";

		f.submit();
	}
</SCRIPT>


<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/support/t_support.png">
</div>
<span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>고객센터










	<!-- 게시판 제목 -->
<table border="0" cellspacing="0" cellpadding="0">
	<tr><td colspan="2" height="8"></td></tr>
	<tr> 
		<td width="10"><img src="/images/common/bul_02_01.gif"></td>
		<td class="font16_title"><font color="#666666"><B><%= bbsName%></B></font></td>
	</tr>
</table>
<hr color="#eeeeee" noshade>

<TABLE cellspacing="0" cellpadding="0">
	<TR><TD height="15"></TD></TR>
</TABLE>
<!-- 게시판 목록 출력 -->


<CENTER>
<TABLE cellspacing="1" cellpadding="5" width="700" bgcolor="#dddddd">
		<FORM name="writeForm" action="/supportServlet.mo" method="post" enctype="multipart/form-data">
		<INPUT type="hidden" name="func" value="support_004">
		<INPUT type="hidden" name="code" value="<%= code%>">

			<TR>
				<TD width="100" align="center" bgcolor="#74c900"><p class="tableTag">작성자</p></TD>
				<TD width="600" bgcolor="#FFFFFF"><B><%= name%></B>(<%= id%>)</TD>
			</TR>
			<TR>
				<TD align="center" bgcolor="#74c900"><p class="tableTag">제 목</p></TD>
				<TD bgcolor="#FFFFFF"><INPUT type="text" name="title" size="84" maxlength="200"></TD>
			</TR>
			<TR>
				<TD align="center" bgcolor="#74c900"><p class="tableTag">내 용</p></TD>
				<TD bgcolor="#FFFFFF"><TEXTAREA name="content" cols="83" rows="15"></TEXTAREA></TD>
			</TR>

<%
	System.out.println(si.getFileYn());

	if(si.getFileYn()) //파일 입출력을 사용 할 경우 파일 업로드패널 활성화
	{
%>
			<TR>
				<TD align="center" bgcolor="#74c900"><B>첨부 파일</B></TD>
				<TD bgcolor="#FFFFFF">
					** 최대 3개까지 가능합니다.<BR>
					&nbsp;<INPUT type="file" name="upFile[0]" size="40"><BR>
					&nbsp;<INPUT type="file" name="upFile[1]" size="40"><BR>
					&nbsp;<INPUT type="file" name="upFile[2]" size="40">
				</TD>
			</TR>
<%
	}
%>
		</FORM>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="5"></TD></TR>
	</TABLE>
			</FORM>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0" width="780">
		<TR>
			<TD width="700" align="center">
				<IMG src="/images/button/but_reg.gif" border="0" onclick="writeAction();" style="cursor:hand" align="absmiddle">
				<IMG src="/images/button/but_cancel1.gif" border="0" onclick="cancelAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
</CENTER>