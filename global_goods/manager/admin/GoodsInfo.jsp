<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		
		ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");
		Hashtable itemTable = (Hashtable)ItemSelectList.get(0);
		String maincategory = (String)itemTable.get("MAIN_CATEGORY");
			

		System.out.println(maincategory);
		//Hashtable itemTable = (Hashtable)ItemSelectList.get(i);

		
%>
<SCRIPT language="JavaScript">

//��ǰ ���
	function updateAction()
	{
		alert("action");
		var f = document.itemForm;
		

		f.submit();
		
	}
/*
	// ����Ȯ��
	function checkAction()
	{
		document.location.href="/commonServlet.mo";
	}


	// ��� ��� or ���� �ϱ�
	function goUseYn(code, yn)
	{
		var alertStr = "�����Ͻ� ��̸� ������� ���ϰ� �Ͻðڽ��ϱ�?";
		if(yn=='Y')
		{
			alertStr = "�����Ͻ� ��̸� ��� �Ͻðڽ��ϱ�?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerHobbyServlet.mo?func=managerHobby_003&yn="+yn+"&code="+code;
		}
	}

	// ��� �߰�
	function goAdd()
	{
		window.open("/common/Progress.jsp", "addHobby", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
		window.name = "listWin";
		document.addForm.submit();
	}
*/
	// ���ù�� ����
	function selectApply(code)
	{
		
		alert(code);
		
		document.location.href="/managerItemServlet.mo?func=managerItem_001&maincategory="+code;
		
	}
	

	
	// ������ ������ ����
	function goDetailInfo(seq)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_002&seq="+seq;
	}
</SCRIPT>


<div><!-- ����Ʈ ȭ�� ��� �� -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">���� ������ : <A href="/goodsServlet.mo?func=goods_001">Ȩ</A>>������������</font>


<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="550">
		<TR>
			<TD align="center" bgcolor="#FFFFFF" width="300" colspan="6">
				<FONT color="blue" size="3"><B>��ǰ���</B></FONT>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
<%
			String test = "testggggggf";
			String test2 = "dfsfadf";
%>

<FORM name="itemForm" action="/managerOrderServlet.mo">
<INPUT type="hidden" name="func" value="managerOrder_004">
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#7682EB" width="550">
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>��з�����</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3">��ǰ<INPUT type="radio" value = "F" name="maincategory"  onclick="selectApply('F');" <%if(maincategory.equals("F")){%>checked<%}%>>��ȭ<INPUT type="radio" name="maincategory" onclick="selectApply('E');" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>�ߺз�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">
			<SELECT name ="middlecategory" >
<%		
		
					for (int i = 0; i<ItemSelectList.size(); i++)
					{
					itemTable = (Hashtable)ItemSelectList.get(i);	
					String middlecategory = (String)itemTable.get("NAME");  ////   middle select �� �з����� int �� �Ǿ��ֱ� ������ �ӽ÷� name���� ��ü�Ͽ���.

%>
					<OPTION value="<%=middlecategory%>" ><%=middlecategory%></OPTION>
				
<%
					}
%>
			</SELECT>
			
			</TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>�Һз�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="subcategory"><IMG src="/images/button/button_add.gif" style="cursor:hand" ></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>�̹������</B></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="3"><INPUT type="file" name="upFile" size="40"></TD>
		</TR>

		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>�̸����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="itemtext"></TD>
		</TR>
		
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>���ݵ��</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="price"></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>���������</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="country"></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>��������</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="size"></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>�ΰ�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="comment"></TD>
		</TR>

	</FORM>

	</TABLE>
	
	
	<TABLE cellspacing="1" cellpadding="3" width="750" >
		<TR><TD height="5"></TD></TR>
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_ok.gif" border="0" onclick="updateAction();" style="cursor:hand" align="absmiddle">
			</TD>
			<TD align="center">
				<IMG src="/images/button/but_ok.gif" border="0" onclick="checkAction();" style="cursor:hand" align="absmiddle">
			</TD>
			<TD align="center">
				<IMG src="/images/button/but_ok.gif" border="0" onclick="checkAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>
<FORM name="addForm" method="post" action="/managerHobbyServlet.mo" target="addHobby">
	<INPUT type="hidden" name="func" value="managerHobby_006">
</FORM>