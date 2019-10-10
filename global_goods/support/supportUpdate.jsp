<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="support.*" %>


<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />


<%
	ArrayList supportViewList = (ArrayList)outputTable.get("supportViewList");

	Hashtable supportTable = (Hashtable)supportViewList.get(0);

	String seq = (String)supportTable.get("SEQ");
	String title = (String)supportTable.get("TITLE");
	String hitCnt = (String)supportTable.get("HIT_CNT");
	String regDate = (String)supportTable.get("REG_DATE");
	String updDate = (String)supportTable.get("UPD_DATE");
	String regId = (String)supportTable.get("REG_ID");
	String regName = (String)supportTable.get("NAME");
	String content = (String)supportTable.get("CONTENT");
	
	boolean loginYn = false;
	boolean writerYn = false;
	boolean adminYn = false;
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		loginYn = true;
	}
	if(loginYn && regId.equals((String)session.getAttribute("id")))
	{
		writerYn = true;
	}
	if(loginYn && ((String)session.getAttribute("adminYn")).equals("Y"))
	{
		adminYn = true;
	}

	String code = (String)inputTable.get("code");
	SupportInfomation si = new SupportInfomation(code);
	String bbsName = si.getName();

	String pageNum = (String)inputTable.get("pageNum");
	String section = (String)inputTable.get("section");
	String word = (String)inputTable.get("word");

	ArrayList supportFileList = new ArrayList();
	if(si.getFileYn())
	{
		supportFileList = (ArrayList)supportTable.get("FILE_LIST");
	}

	ArrayList supportAddList = new ArrayList();
	if(si.getAddYn())
	{
		supportAddList = (ArrayList)outputTable.get("supportAddList");
	}

	%>

	<SCRIPT language="JavaScript">
	function updateAction()
	{
		var f = document.updateForm;
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
		f.submit();
	}
	
	function listAction()
	{
		document.bbsForm.func.value="support_002";
		document.bbsForm.submit();
	}

	function cancelAction()
	{
		document.location.href="/supportServlet.mo?func=support_005&code=<%=code%>&seq="+<%= seq%>;
	}

	function fileDownloadAction(svPath, svName, ogName)
	{
		var f = document.fileDownloadForm;
		f.savePath.value = svPath;
		f.saveName.value = svName;
		f.orgName.value = ogName;
		f.submit();
	}

</script>

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


<FORM name="bbsForm" action="/supportServlet.mo" method="post">
	<INPUT type="hidden" name="func">
	<INPUT type="hidden" name="seq" value="<%= seq%>">
	<INPUT type="hidden" name="hit" value="N">
	<INPUT type="hidden" name="code" value="<%= code%>">
	<INPUT type="hidden" name="pageNum" value="<%= pageNum%>">
	<INPUT type="hidden" name="section" value="<%= section%>">
	<INPUT type="hidden" name="word" value="<%= word%>">
</FORM>	

<FORM name="fileDownloadForm" action="/common/FileDownload.jsp" method="post">
	<INPUT type="hidden" name="savePath">
	<INPUT type="hidden" name="saveName">
	<INPUT type="hidden" name="orgName">
</FORM>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="15"></TD></TR>
	</TABLE>

	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="250">
		<TR>
			<TD align="center" bgcolor="#74c900" width="250">
				<FONT color="blue" size="3"><B><%= bbsName%></B></FONT>
			</TD>
		</TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="10"></TD></TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR>
			<TD width="700">
				<IMG src="/images/button/button_all_list.gif" border="0" onclick="listAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="2"></TD></TR>
	</TABLE>

	<TABLE cellspacing="1" cellpadding="5" width="700" bgcolor="#7682EB">
		<FORM name="updateForm" action="/supportServlet.mo" method="post" enctype="multipart/form-data">
			<INPUT type="hidden" name="func" value="support_007">
			<INPUT type="hidden" name="seq" value="<%= seq%>">
			<INPUT type="hidden" name="code" value="<%= code%>">
			<INPUT type="hidden" name="pageNum" value="<%= pageNum%>">
			<INPUT type="hidden" name="section" value="<%= section%>">
			<INPUT type="hidden" name="word" value="<%= word%>">

			<TR>
				<TD width="100" align="center" bgcolor="#74c900"><B>작성자</B></TD>
				<TD width="250" bgcolor="#FFFFFF"><B><%= regName%></B>(<%= regId%>)</TD>
				<TD width="100" align="center" bgcolor="#74c900"><B>조회수</B></TD>
				<TD width="250" bgcolor="#FFFFFF"><%= hitCnt%></TD>
			</TR>
			<TR>
				<TD align="center" bgcolor="#74c900"><B>제 목</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3"><INPUT type="text" name="title" value="<%= title%>" size="84" maxlength="200"></TD>
			</TR>
			<TR>
				<TD align="center" bgcolor="#74c900" height="200"><B>내 용</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3" valign="top"><TEXTAREA name="content" cols="83" rows="15"><%= content%></TEXTAREA></TD>
			</TR>

<%
	if(si.getFileYn())
	{
%>
			<TR>
				<TD align="center" bgcolor="#74c900"><B>첨부파일</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3" valign="top">
<%
		if(supportFileList.size()>0)
		{
%>
					---------- 삭제할 첨부 파일에 체크하세요. ----------
					<TABLE cellspacing="0" cellpadding="0" width="600">
<%
			for(int i=0; i<supportFileList.size(); i++)
			{
				Hashtable fileTable = (Hashtable)supportFileList.get(i);
				String fileSeq = (String)fileTable.get("SEQ");	//글과 공유하는 시퀀스이기에 그냥 시퀀스를 넣으면 됨..
				String path = (String)fileTable.get("PATH");	//나머지는 뷰와 동일.
				String orgName = (String)fileTable.get("ORG_NAME");
				String saveName = (String)fileTable.get("SAVE_NAME");

				double fileSize = Double.parseDouble((String)fileTable.get("FILE_SIZE"));
				String sizeStr = fileSize + " Byte";
				if(fileSize>1024*1000)
				{
					fileSize =Math.round(fileSize/(1024*1000)*10)/10.0;
					sizeStr = fileSize + " MB";
				}
				else if(fileSize>1024)
				{
					fileSize = Math.round(fileSize/1024*10)/10.0;
					sizeStr = fileSize + " KB";
				}

				String imgName = "etc";
				if(orgName.lastIndexOf(".") != -1)
				{
					imgName = (orgName.substring(orgName.lastIndexOf(".")+1)).toLowerCase();
					if(!imgName.equals("bmp") && !imgName.equals("doc") && !imgName.equals("gif") && !imgName.equals("html") && !imgName.equals("hwp") && !imgName.equals("jpg") && !imgName.equals("pdf") && !imgName.equals("ppt") && !imgName.equals("txt") && !imgName.equals("xls") && !imgName.equals("zip"))
					{
						imgName = "etc";
					}
				}	//뷰 랑 비슷하긴한데. 인풋 의 이름이 deleteFile 이고 값이 시퀀스값이다. ... 수정화면에서도 다운로드가 됨ㅋ
%>
						<TR>
							<TD valign="bottom">
								<INPUT type="checkbox" name="deleteFile" value="<%= fileSeq%>">
								<A href="javascript:fileDownloadAction('<%= path%>', '<%= saveName%>', '<%= orgName%>');"><IMG src="/images/file/<%= imgName%>.gif" alt="<%= orgName%>" border="0" align="absmiddle">&nbsp;&nbsp;<%= orgName%></A>
								(<FONT color="#000099"><%= sizeStr%></FONT>)
							</TD>
						</TR>
<%
			}
%>
					</TABLE>
					<BR>
<%
		}

		if(supportFileList.size()<3)	//아직 지우지 않은 파일 이 있을때 나머지 업로드 가능 파일 수를 여기서 정해줌.
		{
%>
					---------- 새롭게 첨부할 파일을 선택하세요. ----------
					<TABLE cellspacing="0" cellpadding="0" width="100%">
<%
			for(int i=0; i<3-supportFileList.size(); i++)
			{
%>
						<TR>
							<TD valign="top">
								&nbsp;<INPUT type="file" name="upFile[<%= i%>]" size="40"><BR>
							</TD>
						</TR>
<%
			}
%>
					</TABLE>
<%
		}
%>
				</TD>
			</TR>
<%
	}
%>
			<TR>
				<TD align="center" bgcolor="#74c900"><B>등록일</B></TD>
				<TD bgcolor="#FFFFFF"><%= regDate%></TD>
				<TD align="center" bgcolor="#74c900"><B>최종수정일</B></TD>
				<TD bgcolor="#FFFFFF"><%= updDate%></TD>
			</TR>
		</FORM>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="5"></TD></TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR>
			<TD width="700" align="center">
<%
	if(writerYn || adminYn)
	{
%>
				<IMG src="/images/button/but_ok.gif" border="0" onclick="updateAction();" style="cursor:hand" align="absmiddle">
<%
	}
%>
				<IMG src="/images/button/but_cancel1.gif" border="0" onclick="cancelAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="10"></TD></TR>
	</TABLE>

<%
	if(si.getAddYn())
	{
		for(int i=0; i<supportAddList.size(); i++)
		{
			Hashtable supportAddTable = (Hashtable)supportAddList.get(i);
			String addSeq = (String)supportAddTable.get("SEQ");
			String addName = (String)supportAddTable.get("NAME");
			String addRegId = (String)supportAddTable.get("REG_ID");
			String addRegDate = (String)supportAddTable.get("REG_DATE");
			String addContent = (String)supportAddTable.get("CONTENT");
			addContent = addContent.replaceAll("\n", "<BR>");
%>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="5"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="3" width="700" bgcolor="#893C07">
		<TR>
			<TD width="700" bgcolor="#FCD7BE">
				<FONT size="2" color="#9A9A9A"><%= addName%>(<%= addRegId%>) : <%= addRegDate%></FONT><BR>
				<%= addContent%>
			</TD>
		</TR>
	</TABLE>
<%
		}
	}
%>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
</CENTER>