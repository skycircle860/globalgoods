<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		System.out.println("test sub jsp========");
		ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");
		ArrayList SubSelectList =(ArrayList)outputTable.get("SubSelectList");
		
	
		String maincategory = (String)outputTable.get("maincategory");
		
	
		Hashtable itemTable = new Hashtable();
		Hashtable subTable =new Hashtable();

		String middlecategory =(String)outputTable.get("middlecategory");
		String from = "S";

		System.out.println("middlecategory1 ===="+middlecategory);
		
		if(ItemSelectList.size() !=0)
		{
			
		    itemTable = (Hashtable)ItemSelectList.get(0);
			maincategory = (String)itemTable.get("MAIN_CATEGORY");

		}
		
	

		if(SubSelectList.size() !=0)
		{
			subTable = (Hashtable)ItemSelectList.get(0);
			

			System.out.println("middlecategory2 ===="+middlecategory);
		}



		
		

		System.out.println("test sub jsp========");
		
		//Hashtable itemTable = (Hashtable)ItemSelectList.get(i);

		
%>


<style type="text/css">
  td
  {
	 height:25px;
  }

 </style>
<SCRIPT language="JavaScript">




	
	function goUseYn(code, yn)
	{
		var alertStr = "�����Ͻ� ����ī�װ����� ������� ���ϰ� �Ͻðڽ��ϱ�?";
		if(yn=='Y')
		{
			alertStr = "�����Ͻ� ����ī�װ����� ��� �Ͻðڽ��ϱ�?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerOrderServlet.mo?func=managerOrder_015&yn="+yn+"&code="+code;
		}
	}


	function addSubCategoryAction()
	{
		//alert("addcategory");
		var f= document.itemForm;
		var middlecategory = f.middlecategory.value;
		
		//alert(middlecategory);
		
		var subcategory = f.subcategory.value;
		
		if (middlecategory.length < 3)
		{
			alert("�ߺз��� �ݵ�� ������ �ּ���!");
			return false;
		}
		if (subcategory.length == 0)
		{
			alert("�Һз� �̸��� �Է��� �ּ���!");
			return false;
		}

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
		//alert("apply2");
	

		var f = document.itemForm;
		var test = f.middlecategory.value;
		//alert(test);
		f.submit();


	}


	function updateAction(code)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_018&code="+code;


	}


	
	// ������ ������ ����
	function goDetailInfo(code)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_017&code="+code;
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
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="550">
		<TR>
			<TD align="center" bgcolor="#74c900" width="300" colspan="6">
				<FONT color="white" size="3"><B>ī�װ��� �߰�/����</B></FONT>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>


<FORM name="itemForm" action="/managerOrderServlet.mo">
	<INPUT type="hidden" name="func" value="managerOrder_008">
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="550">
		<TR bgcolor="#74c900" align="center" width="100">
			<TD ><font color="white"><B>��з�����</B></font></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="4">��ǰ<INPUT type="radio" value = "F" name="maincategory"  onclick="selectApply('F');" <%if(maincategory.equals("F")){%>checked<%}%>>��ȭ<INPUT type="radio" name="maincategory" onclick="selectApply('E');" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD ><font color="white"><B>�ߺз�����</B></font></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="4">
		
	<!--------------------------------ī�װ���--------------------------------->
	<!--------------------------------ī�װ���--------------------------------->
	<!--------------------------------ī�װ���--------------------------------->
	<!--------------------------------ī�װ���--------------------------------->
	<!--------------------------------ī�װ���--------------------------------->

			<SELECT name ="middlecategory" onchange="selectApply2();" >
			<OPTION value="">---ī�װ���---</OPTION>
<%		
				
					System.out.println("middlecategory3 ===="+middlecategory);
					for (int i = 0; i<ItemSelectList.size(); i++)
				   {
					
					itemTable = (Hashtable)ItemSelectList.get(i);	
					String middlename = (String)itemTable.get("NAME");
					
					String code = (String)itemTable.get("CODE");
					System.out.println("code==="+code);
				
					
							/////code = �ߺз��� ��ȣ. middlecategory = subcategory�� middlecategory ��ȣ.
%>						
					<OPTION value="<%=code%>" <%if(code.equals(middlecategory) ){%>selected<%}%>><%=middlename%></OPTION>
				
<%
					}
%>
			</SELECT>
		
			</TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD ><font color="white"><B>�Һз��߰�</B></font></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="4">
			<INPUT type="text" name="subcategory" >
			<IMG src="/images/button/Add.png" onclick="addSubCategoryAction();" align="absmiddle">
			</TD>
			
		</TR>
	</TABLE>
	
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="600">
		<TR bgcolor="#74c900" align="center">
			<TD ><font color="white"><B>CODE</B></font></TD>
			<TD ><font color="white"><B>NAME</B></font></TD>
			<TD ><font color="white"><B>��뿩��</B></font></TD>
			<TD width="150"><font color="white"><B>���</B></font></TD>
		</TR>
<%
	if(SubSelectList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><B>������ ���� ������ �����ϴ�.</B></TD></TR>
<%
	}

	System.out.println("jsp ifȮ��");
                                                       
	if(SubSelectList.size() !=0)                           ////////////////////        ī�װ��� ����Ʈ ���
	{
		for(int i=0; i<SubSelectList.size(); i++)
		{

			
			subTable = (Hashtable)SubSelectList.get(i);
			String subcode = (String)subTable.get("CODE");
			String name = (String)subTable.get("NAME");
			String useYn = (String)subTable.get("USEYN");
			//System.out.println("subcode ======="+subcode);	
				
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
				<TD><A href="javascript:goDetailInfo('<%= subcode%>')"><%= subcode%></A></TD>
				<TD><A href="javascript:goDetailInfo('<%= subcode%>')"><%= name%></A></TD>
				<TD><B><%= useKor%></B></TD>
				<TD>
					<IMG src="/images/button/Update.png" align="absmiddle" border="0" style="cursor:hand" onClick="updateAction('<%= subcode%>')">
	<%
			if(useYn.equals("Y"))
			{
	%>
					<IMG src="/images/button/Delete.png" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= subcode%>', 'N');">
	<%
			}	
			else
			{
	%>
					<IMG src="/images/button/Use.png" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= subcode%>', 'Y');">
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