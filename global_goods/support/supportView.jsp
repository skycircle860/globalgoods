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
	String groupNum = (String)supportTable.get("GROUP_NUM");
	String width = (String)supportTable.get("WIDTH");
	String step = (String)supportTable.get("STEP");
	String title = (String)supportTable.get("TITLE");
	String hitCnt = (String)supportTable.get("HIT_CNT");
	String regDate = (String)supportTable.get("REG_DATE");
	String updDate = (String)supportTable.get("UPD_DATE");
	String regId = (String)supportTable.get("REG_ID");
	String regName = (String)supportTable.get("NAME");
	String content = (String)supportTable.get("CONTENT");
	
	String id = "";
	String name = "";

	boolean loginYn = false;
	boolean writerYn = false;
	boolean adminYn = false;
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		loginYn = true;
		id = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
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

	ArrayList supportAddList = new ArrayList();
	if(si.getAddYn())
	{
		supportAddList = (ArrayList)outputTable.get("supportAddList");
	}

	ArrayList supportFileList = new ArrayList();
	if(si.getFileYn())	//파일업로드를 사용하는 게시판일 경우
	{
		supportFileList = (ArrayList)supportTable.get("FILE_LIST");
	}
%>

<script>
	function listAction()
	{
		document.bbsForm.func.value="support_002";
		document.bbsForm.submit();
	}

	function goUpdate()
	{
		document.bbsForm.func.value = "support_006";
		document.bbsForm.submit();
	}
	function deleteAction()
	{
		if(confirm("정말로 글을 삭제 하시겠습니까?"))
		{
			document.bbsForm.func.value = "support_008";
			document.bbsForm.submit();
		}
	}

	function replyWriteDispalyAction()
	{
		if(replyWrite.style.display == "none")
		{
<%
	if(si.getAddYn())
	{
%>
			addWrite.style.display = "none";
<%
	}
%>
			replyWrite.style.display = "";
			document.replyWriteForm.title.focus();
		}
		else
		{
			replyWrite.style.display = "none";
		}
	}

	function replyWriteAction()
	{
		var f = document.replyWriteForm;
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

//댓글 
	function addWriteDispalyAction()
	{
		if(addWrite.style.display == "none")
		{
<%
	if(si.getReplyYn())
	{
%>
			replyWrite.style.display = "none";
<%
	}
%>
			addWrite.style.display = "";
			document.addWriteForm.content.focus();
		}
		else
		{
			addWrite.style.display = "none";
		}
	}

	function addWriteAction()
	{
		var f = document.addWriteForm;
		if(trim(f.content.value)=="")
		{
			window.alert("댓글의 내용을 입력하세요!");
			f.content.select();
			return;
		}

		f.submit();
	}

	function addDeleteAction(addSeq)
	{
		if(confirm("선택하신 댓글이 삭제 됩니다.\n\n계속하시겠습니까?"))
		{
			document.bbsForm.func.value = "support_011";
			document.bbsForm.addSeq.value = addSeq;
			document.bbsForm.submit();
		}
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







<FORM name="bbsForm" action="/supportServlet.mo" method="post">
	<INPUT type="hidden" name="func">
	<INPUT type="hidden" name="seq" value="<%= seq%>">
	<INPUT type="hidden" name="code" value="<%= code%>">
	<INPUT type="hidden" name ="title" value="<%=title%>">
	<INPUT type="hidden" name="content" value="<%=content%>">
	<INPUT type="hidden" name="regId" value="<%= regId%>">
	<INPUT type="hidden" name="regName" value="<%= regName%>">
	<INPUT type="hidden" name="groupNum" value="<%= groupNum%>">
	<INPUT type="hidden" name="width" value="<%=width%>">
	<INPUT type="hidden" name="step" value="<%= step%>">
	<INPUT type="hidden" name="pageNum" value="<%= pageNum%>">
	<INPUT type="hidden" name="section" value="<%= section%>">
	<INPUT type="hidden" name="word" value="<%= word%>">
	<INPUT type="hidden" name="addSeq">
</FORM>

<FORM name="fileDownloadForm" action="/common/FileDownload.jsp" method="post">
	<INPUT type="hidden" name="savePath">
	<INPUT type="hidden" name="saveName">
	<INPUT type="hidden" name="orgName">
</FORM>


	<!-- 게시판 제목 -->
<table border="0" cellspacing="0" cellpadding="0">
	<tr><td colspan="2" height="8"></td></tr>
	<tr> 
		<td width="10" align="left"><img src="/images/common/bul_02_01.gif"></td>
		<td class="font16_title"><font color="#666666"><B><%= bbsName%></B></font></td>
	</tr>
</table>
<hr color="#eeeeee" noshade>

<TABLE cellspacing="0" cellpadding="0">
	<TR><TD height="15"></TD></TR>
</TABLE>
<!-- 게시판 목록 출력 -->
<center>

	


	<TABLE cellspacing="0" cellpadding="0" width="700" style="top:20px;">
		<TR>
			<TD width="700">
				<IMG src="/images/button/button_all_list.gif" border="0" onclick="listAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" width="700" bgcolor="#dddddd" style="margin-top:30px">
		<TR>
			<TD width="100" align="center" bgcolor="#74c900"><p class="tableTag">작성자</p></TD>
			<TD width="250" bgcolor="#FFFFFF"><p><%= regName%>(<%= regId%>)</p></TD>
			<TD width="100" align="center" bgcolor="#74c900"><p class="tableTag">조회수</p></TD>
			<TD width="250" bgcolor="#FFFFFF"><%= hitCnt%></TD>
		</TR>
		<TR>
			<TD width="100" align="center" bgcolor="#74c900"><p class="tableTag">제 목</p></TD>
			<TD width="600" bgcolor="#FFFFFF" colspan="3"><%= title%></TD>
		</TR>
		<TR>
			<TD width="100" align="center" bgcolor="#74c900" height="200"><p class="tableTag">내 용</p></TD>
			<TD width="600" bgcolor="#FFFFFF" colspan="3" valign="top" style="word-break:break-all">
				<PRE><%= content%></PRE>
			</TD>
		</TR>

<%
	if(si.getFileYn())
	{
%>
		<TR>
			<TD width="100" align="center" bgcolor="#74c900"><B>첨부파일</B></TD>
			<TD width="600" bgcolor="#FFFFFF" colspan="3" valign="top">
				<TABLE cellspacing="0" cellpadding="0" width="100%">
<%
		for(int i=0; i<supportFileList.size(); i++)
		{
			Hashtable fileTable = (Hashtable)supportFileList.get(i);	
			String path = (String)fileTable.get("PATH");	//파일 저장 경로
			String orgName = (String)fileTable.get("ORG_NAME");	//원래이름
			String saveName = (String)fileTable.get("SAVE_NAME");	//저장되있는 이름 
			
			System.out.println(i+"img path : " + path);
			System.out.println(i+"img orgName : " + orgName);
			System.out.println(i+"img saveName : " + saveName);

			double fileSize = Double.parseDouble((String)fileTable.get("FILE_SIZE")); //파일 사이즈 리턴(DB에 들어있던 정보)
			String sizeStr = fileSize + " Byte";
			if(fileSize>1024*1000)	//파일 크기가 메가바이트를 넘을 경우
			{
				fileSize =Math.round(fileSize/(1024*1000)*10)/10.0;
				sizeStr = fileSize + " MB";
			}
			else if(fileSize>1024)//파일 크기가 키로바이트 단위일 경우
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
			}
%>
					<TR>
						<TD valign="bottom">
							<A href="javascript:fileDownloadAction('<%= path%>', '<%= saveName%>', '<%= orgName%>');"><IMG src="/images/file/<%= imgName%>.gif" alt="<%= orgName%>" border="0" align="absmiddle">&nbsp;&nbsp;<%= orgName%></A> <!--bbsList에 있는 파일 다운로드와 같은 엑션 -->
							(<FONT color="#000099"><%= sizeStr%></FONT>)
						</TD>
					</TR>
					<tr>
						<td height="200px">
							<%
								String upFilePath = path+"/"+saveName;
								String serverPath = upFilePath.substring(upFilePath.indexOf("upfile")); 
								System.out.println(serverPath);	
							%>
							<img src="<%=serverPath%>" width="200" height="200" alt="" >
						</td>
					</tr>
<%
		}
%>
				</TABLE>
			</TD>
		</TR>
<%
	}
%>
		<TR>
			<TD width="100" align="center" bgcolor="#74c900"><p class="tableTag">등록일시</p></TD>
			<TD width="250" bgcolor="#FFFFFF"><%= regDate%></TD>
			<TD width="100" align="center" bgcolor="#74c900"><p class="tableTag">최종수정일시</p></TD>
			<TD width="250" bgcolor="#FFFFFF"><%= updDate%></TD>
		</TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="5"></TD></TR>
	</TABLE>

<%
	if(si.getUpdateYn() && loginYn)
	{
%>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR>
			<TD width="350" align="left">

<%
		if(writerYn || adminYn)
		{
%>
				<IMG src="/images/button/button_modify.gif" border="0" align="absmiddle" style="cursor:hand" onclick="goUpdate();">
				&nbsp;&nbsp;
<%
			if(supportAddList.size()==0)
			{
%>
				<IMG src="/images/button/button_delete.gif" border="0" align="absmiddle" style="cursor:hand" onclick="deleteAction();">
<%
			}
		}
%>
			</TD>
			<TD width="350" align="right">
<%
		if(si.getReplyYn() && (!writerYn || adminYn))
		{
%>
				<IMG src="/images/button/button_reply.gif" border="0" align="absmiddle" style="cursor:hand" onclick="replyWriteDispalyAction();">
<%
		}

		if(si.getAddYn() && (!writerYn || adminYn))
		{
%>
				&nbsp;&nbsp;
				<IMG src="/images/button/button_reg.gif" border="0" align="absmiddle" style="cursor:hand" onclick="addWriteDispalyAction();">
<%
		}
%>
			</TD>
		</TR>
	</TABLE>
<%
	}
%>
	
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="15"></TD></TR>
	</TABLE>

<%
	if(si.getReplyYn())
	{
%>

	<TABLE cellspacing="0" cellpadding="0" width="700" bgcolor="#FFFFFF" id="replyWrite" style="display:none">
		<TR>
			<TD align="center">
				<TABLE cellspacing="1" cellpadding="3" width="700" bgcolor="#004D00">
					<FORM name="replyWriteForm" method="post" action="/supportServlet.mo" enctype="multipart/form-data">
						<INPUT type="hidden" name="func" value="support_009">
						<INPUT type="hidden" name="seq" value="<%= seq%>">
						<INPUT type="hidden" name="groupNum" value="<%= groupNum%>">
						<INPUT type="hidden" name="width" value="<%= width%>">
						<INPUT type="hidden" name="step" value="<%= step%>">

						<INPUT type="hidden" name="code" value="<%= code%>">
						<INPUT type="hidden" name="pageNum" value="<%= pageNum%>">
						<INPUT type="hidden" name="section" value="<%= section%>">
						<INPUT type="hidden" name="word" value="<%= word%>">
						
						<TR>
							<TD width="115" align="center" bgcolor="#74c900"><B>작성자</B></TD>
							<TD width="585" bgcolor="#FFFFFF"><B><%= name%></B>(<%= id%>)</TD>
						</TR>
						<TR>
							<TD align="center" bgcolor="#74c900"><B>제 목</B></TD>
							<TD bgcolor="#FFFFFF"><INPUT type="text" name="title" size="81" maxlength="200"></TD>
						</TR>
						<TR>
							<TD align="center" bgcolor="#74c900"><B>내 용</B></TD>
							<TD bgcolor="#FFFFFF"><TEXTAREA name="content" cols="80" rows="8"></TEXTAREA></TD>
						</TR>
						<TR>
							<TD width="180" align="center" bgcolor="#74c900"><B>첨부 파일</B></TD>
							<TD width="600" bgcolor="#FFFFFF">
								** 최대 3개까지 가능합니다.<BR>
								&nbsp;<INPUT type="file" name="upFile[0]" size="40"><BR>
								&nbsp;<INPUT type="file" name="upFile[1]" size="40"><BR>
								&nbsp;<INPUT type="file" name="upFile[2]" size="40">
							</TD>
						</TR>
					</FORM>
				</TABLE>

				<TABLE cellspacing="0" cellpadding="0">
					<TR><TD height="5"></TD></TR>
				</TABLE>

				<TABLE cellspacing="0" cellpadding="0" width="700">
					<TR>
						<TD width="700" align="center">
							<IMG src="/images/button/but_ok.gif" border="0" align="absmiddle" style="cursor:hand" onclick="replyWriteAction();">
							&nbsp;&nbsp;&nbsp;
							<IMG src="/images/button/but_cancel1.gif" border="0" align="absmiddle" style="cursor:hand" onclick="replyWriteDisplayAction();">
						</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</TABLE>
<%
	}

	if(si.getAddYn())
	{
%>
	<TABLE cellspacing="1" cellpadding="3" width="700" bgcolor="#893C07" id="addWrite" style="display:none">
		<FORM name="addWriteForm" method="post" action="/supportServlet.mo">
			<INPUT type="hidden" name="func" value="support_010">
			<INPUT type="hidden" name="seq" value="<%= seq%>">

			<INPUT type="hidden" name="code" value="<%= code%>">
			<INPUT type="hidden" name="pageNum" value="<%= pageNum%>">
			<INPUT type="hidden" name="section" value="<%= section%>">
			<INPUT type="hidden" name="word" value="<%= word%>">
			
			<TR>
				<TD width="650" align="center" bgcolor="#74c900">
						<TEXTAREA name="content" cols="88" rows="3"></TEXTAREA></TD>
				<TD width="50" bgcolor="#FFFFFF" align="center">
					<IMG src="/images/button/sbut_reg.gif" border="0" align="absmiddle" style="cursor:hand" onclick="addWriteAction();">
					<BR>
					<IMG src="/images/button/sbut_cancel.gif" border="0" align="absmiddle" style="cursor:hand" onclick="addWriteDisplayAction();">
				</TD>
			</TR>
		</FORM>
	</TABLE>

	<!-- 댓글보기 -->
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="5"></TD></TR>
	</TABLE>

<%	
		for(int i=0; i<supportAddList.size(); i++)
		{
			Hashtable supportAddTable = (Hashtable)supportAddList.get(i);
			String addSeq = (String)supportAddTable.get("SEQ");
			String addName = (String)supportAddTable.get("NAME");
			String addRegId = (String)supportAddTable.get("REG_ID");
			String addRegDate = (String)supportAddTable.get("REG_DATE");
			String addContent = (String)supportAddTable.get("CONTENT");
			String add_disp_yn = (String)supportAddTable.get("DISP_YN");

			if(add_disp_yn.equals("Y"))
			{
%>
			<TABLE cellspacing="0" cellpadding="0">
				<TR><TD height="5"></TD></TR>
			</TABLE>
			<TABLE cellspacing="1" cellpadding="3" width="700" bgcolor="#893C07">
				<TR>
					<TD width="700" bgcolor="#FCD7BE">
						<FONT size="2" color="#9A9A9A"><%= addName%>(<%= addRegId%>) : <%= addRegDate%></FONT>
<%
				if(addRegId.equals(id) || adminYn)
				{
%>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<IMG src="/images/button/sbut_delete.gif" border="0" align="absmiddle" style="cursor:hand" onclick="addDeleteAction('<%= addSeq%>');">
<%
				}
%>
						<BR>
						<PRE><%= addContent%></PRE>
					</TD>
				</TR>
<%
			}
			else
			{
%>
				<TABLE cellspacing="0" cellpadding="0">
					<TR><TD height="5"></TD></TR>
				</TABLE>
				<TABLE cellspacing="1" cellpadding="3" width="700" bgcolor="#893C07">
					<TR>
						<TD width="700" bgcolor="#FCD7BE">
						<FONT size="2" color="#9A9A9A"><%= addName%>(<%= addRegId%>) : <%= addRegDate%></FONT><BR>
							---- 삭제된 댓글입니다. ----
						</TD>
					</TR>
<%
			}
		}
	}
	
%>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>

</CENTER>