<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="order.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	    String goodsCode = (String)outputTable.get("code");
		System.out.println("test GoodsUpdateInfo jsp========");

		ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");
		ArrayList SubSelectList =(ArrayList)outputTable.get("SubSelectList");
		ArrayList GoodsInfoList = (ArrayList)outputTable.get("GoodsInfoList");

			
		ArrayList FileList = (ArrayList)outputTable.get("fileList");
	   
		String returnmaincategory = (String)outputTable.get("maincategory");
		String returnmiddlecategory = (String)outputTable.get("middlecategory");

		System.out.println("goods Update maincategory"+returnmaincategory);
		Hashtable subTable =new Hashtable();
		Hashtable itemTable = new Hashtable();
			
			
	String saveName="";
	String path="";

%>

<SCRIPT language="JavaScript">

//��ǰ ������Ʈ
	function updateAction()
	{

		alert("updateAction");


		var f = document.itemForm;
		


		f.func.value="managerOrder_023";

		f.submit();
		
	}


	// ��з� ����
	function selectApply()
	{
		var f = document.itemForm;
		
		f.submit();
	}

		//�ߺз�����

	function selectApply2()
	{
	 
		

		var f = document.itemForm;
		
		f.submit();

	}

	function fileDownloadAction(svPath, svName, ogName)
	{
		var f = document.fileDownloadForm;
		f.savePath.value = svPath;
		f.saveName.value = svName;
		f.orgName.value = ogName;
		f.submit();
	}
	
	function test(code)
	{
		alert(code);
	}

	function deleteAction(code)
	{
		alert(code);
		document.location.href="/managerOrderServlet.mo?func=managerOrder_025&code="+code;
	}

	function listAction()
	{
	}

</SCRIPT>




<style type = "text/css">
td
  {
	 height:25px;
	 color:white;
  }

 </style>

<div><!-- ����Ʈ ȭ�� ��� �� -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">���� ������ : <A href="/goodsServlet.mo?func=goods_001">Ȩ</A>>������������</font>




<FORM name="fileDownloadForm" action="/common/FileDownload.jsp" method="post">
	<INPUT type="hidden" name="savePath">
	<INPUT type="hidden" name="saveName">
	<INPUT type="hidden" name="orgName">
</FORM>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="650">
		<TR>
			<TD align="center" bgcolor="#74c900" width="300" colspan="6">
				<FONT color="white" size="3"><B>��ǰ ���� ����</B></FONT>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>

	<%
	
		Hashtable goodsTable = (Hashtable)GoodsInfoList.get(0);
		
		String code = (String)goodsTable.get("CODE");
		System.out.println("code"+code);
		String mcode =(String)goodsTable.get("MCODE");
		String scode = (String)goodsTable.get("SCODE");
		String maincategory = (String)goodsTable.get("MAIN_CATEGORY");
		String middlecategory = (String)goodsTable.get("MIDDLE_CATEGORY");
		String subcategory = (String)goodsTable.get("SUB_CATEGORY");
		String middlename = (String)goodsTable.get("MNAME");
		String subname = (String)goodsTable.get("SNAME");
		String orgPrice = (String)goodsTable.get("ORG_PRICE");
		String parPrice = (String)goodsTable.get("PAR_PRICE");
		String country = (String)goodsTable.get("COUNTRY");
		String company = (String)goodsTable.get("COMPANY");
		String goodsComment = (String)goodsTable.get("GOODS_COMMENT");
		String quantity = (String)goodsTable.get("QUANTITY");
		String goodsAmount = (String)goodsTable.get("GOODS_AMOUNT");
		String name = (String)goodsTable.get("NAME");

		
%>


<FORM name="itemForm" action="/managerOrderServlet.mo"   enctype="multipart/form-data" method="post"><!-- post-->
<INPUT type="hidden" name="func" value="managerOrder_019">
<INPUT type="hidden" name="getFileYn" value="Y">
<INPUT type="hidden" name="code" value='<%=code%>'>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#ccffcc" width="700">
		<TR bgcolor="#74c900" align="center" >
			<TD align="left" width="300"><B>&nbsp;&nbsp;��з�����</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><FONT color="black">&nbsp;��ǰ<INPUT type="radio" value = "F" name="maincategory"  onclick="selectApply();" <%System.out.println("��з� if main"+maincategory+ "return" + returnmaincategory);
			if(returnmaincategory.equals("A"))
			{
				if(maincategory.equals("F"))
				{%>checked<%}
			}
			else if(returnmaincategory.equals("F"))
				{%>checked<%}
			
			
			
			%>>��ȭ</FONT><INPUT type="radio" name="maincategory" onclick="selectApply();" value="E" 
			<% System.out.println("��з� if main"+maincategory);
			if(returnmaincategory.equals("A"))
			{
				if(maincategory.equals("E"))
				{%>checked<%}}
			else if(returnmaincategory.equals("E"))
				{%>checked<%}
			%>></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD align="left" width="100"><B>&nbsp;&nbsp;�ߺз�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">
			&nbsp;<SELECT name ="middlecategory" onchange="selectApply2();" >
			<OPTION value="blank">---ī�װ�---</OPTION>
<%		
				
					System.out.println("middlecategory3 ===="+middlecategory);
					for (int i = 0; i<ItemSelectList.size(); i++)
				   {
					
					itemTable = (Hashtable)ItemSelectList.get(i);	
					middlename = (String)itemTable.get("NAME");
					
					code = (String)itemTable.get("CODE");
					System.out.println("code==="+code);
				
					
							/////code = �ߺз��� ��ȣ. middlecategory = subcategory�� middlecategory ��ȣ.
%>						
					<OPTION value="<%=code%>" 
			<%System.out.println("�ߺз� if main"+middlecategory+ "return" + returnmiddlecategory);
			if(returnmiddlecategory.equals("A"))
			{
				if(middlecategory.equals(code))
				{%>selected<%}
			}
			else if(returnmiddlecategory.equals(code))
				{%>selected<%}
			
			
			
			%>><%=middlename%></OPTION>
				
<%
					}
%>
			</SELECT>
			
			</TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD align="left" width="100"><B>&nbsp;&nbsp;�Һз�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">
			&nbsp;<SELECT name ="subcategory" >
			<OPTION value="blank">---ī�װ�---</OPTION>
<%		
		
					for (int i = 0; i<SubSelectList.size(); i++)
					{
					 subTable = (Hashtable)SubSelectList.get(i);	
					subname = (String)subTable.get("NAME");  
					String subcode = (String)subTable.get("CODE");
%>
					<OPTION value="<%=subcode%>" <%if(subcode.equals(subcategory)){%>selected<%}%>><%=subname%></OPTION>
<%
					}
%>
			</SELECT>
		
		
		</TR>
	
		<TR bgcolor="#74c900" align="center">
			<TD align="left" width="300"><B>&nbsp;&nbsp;��ǰ�̸�</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">&nbsp;<INPUT type="text" name="name" value="<%=name%>"></TD>
		</TR>
		
		
		<TR bgcolor="#74c900" align="center">
			<TD align="left" width="300"><B>&nbsp;&nbsp;��ǰ����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">&nbsp;<INPUT type="text" name="orgPrice" value="<%=orgPrice%>"></TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD align="left"><B>&nbsp;&nbsp;��ǰ �ǸŰ�</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">&nbsp;<INPUT type="text" name="parPrice" value="<%=parPrice%>"></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD align="left"><B>&nbsp;&nbsp;������</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">&nbsp;<INPUT type="text" name="country" value="<%=country%>"></TD>
		</TR>
	
		
		<TR bgcolor="#74c900" align="center">
			<TD align="left"><B>&nbsp;&nbsp;������</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">&nbsp;<INPUT type="text" name="company" value="<%=company%>"></TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD align="left"><B>&nbsp;&nbsp;��ǰ �ΰ�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">&nbsp;<INPUT type="text" name="goodsComment" value="<%=goodsComment%>"></TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD align="left"><B>&nbsp;&nbsp;��ǰ ���뷮</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">&nbsp;<INPUT type="text" name="quantity" value="<%=quantity%>"></TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD align="left"><B>&nbsp;&nbsp;��ǰ ����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">&nbsp;<INPUT type="text" name="goodsAmount" value="<%=goodsAmount%>"></TD>
		</TR>

<!--		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>�̹������</B></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="3"><INPUT type="file" name="upFile" size="40"></TD>
		</TR>
-->
<TR >
				<TD bgcolor="#74c900" align="left"><B>&nbsp;&nbsp;÷������</B></TD>
				<TD bgcolor="#FFFFFF" colspan="3" valign="top">
<%
		if(FileList.size()>0)
		{
%>
				<FONT color="black">	---------- ������ ÷�� ���Ͽ� üũ�ϼ���. ----------
					<TABLE cellspacing="0" cellpadding="0" width="600">
<%
			int i =0;
			for(i=0; i<FileList.size(); i++)
			{
				Hashtable fileTable = (Hashtable)FileList.get(i);
				String fileSeq = (String)fileTable.get("SEQ");
				path = (String)fileTable.get("PATH");
				String orgName = (String)fileTable.get("ORG_NAME");
				 saveName = (String)fileTable.get("SAVE_NAME");
			

				
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
				}
%>
						<TR>
					
							<TD valign="bottom" width="300">
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

		if(FileList.size()<5)
		{
%>
					---------- ���Ӱ� ÷���� ������ �����ϼ���. ----------</FONT>
					<TABLE cellspacing="0" cellpadding="0" width="500">
<%
			for(int i=0; i<5-FileList.size(); i++)
			{
%>
						<TR>
							<TD valign="top" width="300">
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

	</TABLE>
</FORM>

	
	
	<TABLE cellspacing="1" cellpadding="3" width="750" >
		<TR><TD height="5"></TD></TR>
		<TR>
			<TD align="center">
			
				<IMG src="/images/button/Update.png" border="0" onclick="updateAction();" style="cursor:hand" align="absmiddle">
			</TD>
			<TD align="center">
				<IMG src="/images/button/List.png" border="0" onclick="listAction();" style="cursor:hand" align="absmiddle">
			</TD>
			<TD align="center">
				<IMG src="/images/button/Delete.png" border="0" onclick="deleteAction('<%=goodsCode%>');" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>
