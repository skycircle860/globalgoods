<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		System.out.println("test sub jsp========");
		ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");
		ArrayList SubSelectList =(ArrayList)outputTable.get("SubSelectList");
		
		System.out.println("test sub jsp========");
		String maincategory = (String)outputTable.get("maincategory");
	
		Hashtable itemTable = new Hashtable();
		Hashtable subTable =new Hashtable();

		String test = "";
		int t = SubSelectList.size();
		System.out.println("testsfadf"+t);
		
		if(ItemSelectList.size() !=0)
		{
			
		    itemTable = (Hashtable)ItemSelectList.get(0);
			maincategory = (String)itemTable.get("MAIN_CATEGORY");

		}
		
		System.out.println("CODE  ������= ===");

		if(SubSelectList.size() !=0)
		{
			subTable = (Hashtable)SubSelectList.get(0);
			test = (String)subTable.get("MIDDLE_CATEGORY");
			String codee = (String)subTable.get("CODE");
			
			System.out.println("CODE ������1 = ==="+test);
			System.out.println("CODE ������2= ==="+codee);
		}

		
		

		System.out.println("test sub jsp========");
		
		//Hashtable itemTable = (Hashtable)ItemSelectList.get(i);

		
%>
<SCRIPT language="JavaScript">




	
	function goUseYn(code, yn)
	{
		var alertStr = "�����Ͻ� ī�װ��� ������� ���ϰ� �Ͻðڽ��ϱ�?";
		if(yn=='Y')
		{
			alertStr = "�����Ͻ� ī�װ��� ��� �Ͻðڽ��ϱ�?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerOrderServlet.mo?func=managerOrder_007&yn="+yn+"&code="+code;
		}
	}


	function addSubCategoryAction()
	{
		alert("addcategory");
		var f= document.itemForm;
		var middlecategory = f.middlecategory.value;
		
		alert(middlecategory);
		
		var subcategory = f.subcategory.value;
		
		document.location.href="/managerOrderServlet.mo?func=managerOrder_011&subcategory="+subcategory +"&middlecategory="+middlecategory+"&maincategory=<%=maincategory%>";
	}




	// ��з� ����
	function selectApply(code)
	{
		
		
		document.location.href="/managerOrderServlet.mo?func=managerOrder_008&maincategory="+code;
		
	}

	//�ߺз�����

	function selectApply2()
	{
		alert("apply2");

		var f = document.itemForm;
		var test = f.middlecategory.value;
		alert(test);
		f.submit();


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
				<FONT color="blue" size="3"><B>ī�װ� �߰�/����</B></FONT>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>


<FORM name="itemForm" action="/managerOrderServlet.mo">
<INPUT type="hidden" name="func" value="managerOrder_008">

	<TABLE cellspacing="1" cellpadding="4" bgcolor="#7682EB" width="550">
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>��з�����</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="4">��ǰ<INPUT type="radio" value = "F" name="maincategory"  onclick="selectApply('F');" <%if(maincategory.equals("F")){%>checked<%}%>>��ȭ<INPUT type="radio" name="maincategory" onclick="selectApply('E');" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>�ߺз�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">
		
<%
			

			if(SubSelectList.size()==0)
			{

%>
			<SELECT name ="middlecategory">
<%		
				System.out.println("�ߺ�"+test);
					for (int i = 0; i<ItemSelectList.size(); i++)
				   {
					
					itemTable = (Hashtable)ItemSelectList.get(i);	
					String middlecategory = (String)itemTable.get("NAME");
					
					String code = (String)itemTable.get("CODE");
					System.out.println("code==="+code);
				
					

%>
					<OPTION value="<%=code%>"><%=middlecategory%></OPTION>
				
<%
					}
%>
			</SELECT>
<%
			
			}

			
			if(SubSelectList.size()!=0)
			{

%>
			<SELECT name ="middlecategory" onchange="selectApply2();" >
<%		
					System.out.println("�ߺ�"+test);
					
					for (int i = 0; i<ItemSelectList.size(); i++)
				   {
					
					itemTable = (Hashtable)ItemSelectList.get(i);	
					String middlecategory = (String)itemTable.get("NAME");
					
					String code = (String)itemTable.get("CODE");
					System.out.println("code==="+code);
				
					

%>
					<OPTION value="<%=code%>" <%if(code.equals(test)){%>selected<%}%>><%=middlecategory%></OPTION>
				
<%
					}
%>
			</SELECT>
<%
			
			}
%>			
			</TD>
		</TR>
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>�Һз��߰�</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="4">
			<INPUT type="text" name="subcategory" >
			<IMG src="/images/button/button_add.gif" onclick="addSubCategoryAction();" align="absmiddle">
			</TD>
			
		</TR>
	</TABLE>
	
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#7682EB" width="550">
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>CODE</B></TD>
			<TD width="100"><B>NAME</B></TD>
			<TD width="100"><B>��뿩��</B></TD>
			<TD width="100"><B>���</B></TD>
		</TR>
<%
	if(SubSelectList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><B>������ ���� ������ �����ϴ�.</B></TD></TR>
<%
	}

	System.out.println("jsp ifȮ��");

	if(SubSelectList.size() !=0)
	{
		for(int i=0; i<SubSelectList.size(); i++)
		{

			
			subTable = (Hashtable)SubSelectList.get(i);
			String code = (String)subTable.get("CODE");
			String name = (String)subTable.get("NAME");
			String useYn = (String)subTable.get("USEYN");
			System.out.println("code ======="+code);	
				
			String bgcolor = "#FFFFFF";
			if(useYn.equals("N"))
			{
				bgcolor = "#E0E0E0";
			}

			String useKor = "�����";
			if(useYn.equals("N"))
			{
				useKor = "�̻��";
			}
	%>
			<TR bgcolor="<%= bgcolor%>" align="center">
				<TD><A href="javascript:goDetailInfo('<%= code%>')"><%= code%></A></TD>
				<TD><A href="javascript:goDetailInfo('<%= code%>')"><%= name%></A></TD>
				<TD><B><%= useKor%></B></TD>
				<TD>
					<IMG src="/images/button/sbut_update.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUpdate('<%= code%>')">
	<%
			if(useYn.equals("Y"))
			{
	%>
					<IMG src="/images/button/sbut_delete.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= code%>', 'N');">
	<%
			}
			else
			{
	%>
					<IMG src="/images/button/sbut_use.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= code%>', 'Y');">
	<%
			}
	%>
				</TD>
			</TR>
	<%
		}
	}

%>
	</TABLE>
	</FORM>


	


	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>
<FORM name="addForm" method="post" action="/managerHobbyServlet.mo" target="addHobby">
	<INPUT type="hidden" name="func" value="managerHobby_006">
</FORM>