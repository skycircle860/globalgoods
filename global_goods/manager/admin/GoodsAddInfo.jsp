<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		System.out.println("test sub jsp========");
		ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");
		ArrayList SubSelectList =(ArrayList)outputTable.get("SubSelectList");

			
		Hashtable subTable =new Hashtable();
		Hashtable itemTable = new Hashtable();

		String maincategory = (String)outputTable.get("maincategory");
		
		String middlecategory =(String)outputTable.get("middlecategory");
	
		System.out.println("middlecategory1 ===="+middlecategory);
		String code ="";
		if(ItemSelectList.size() !=0)
		{
			
		    itemTable = (Hashtable)ItemSelectList.get(0);
			maincategory = (String)itemTable.get("MAIN_CATEGORY");

		}

%>
<style type="text/css">
td
  {
	 height:25px;
	 color:white;
  }


 </style>
<SCRIPT language="JavaScript">

//��ǰ ���
	function updateAction()
	{


		alert("action");

		var f = document.itemForm;
		var middlecategory = f.middlecategory.value;
		var subcategory = f.subcategory.value;
		var image1 = f.upFile1.value;
		var image2 = f.upFile2.value;
		var image3 = f.upFile3.value;
		var name = f.name.value;
		var orgPrice = f.orgPrice.value;
		var parPrice = f.parPrice.value;
		var country = f.country.value;
		var company = f.company.value;
		var goodsComment = f.goodsComment.value;
		var quantity = f.quantity.value;
		var goodsAmount = f.goodsAmount.value;
		
		if (middlecategory.length < 3)
		{
			window.alert("�ߺз��� �������ּ���!");
			return false;
		}
		if (subcategory.length < 3)
		{
			window.alert("�Һз��� �������ּ���!");
			return false;
		}
		if (image1 == null && image2 == null && image3 == null)
		{
			window.alert("�̹����� ����ϼ���.");
			return false;
		}
		if (name.length == 0)
		{
			window.alert("��ǰ �̸��� �Է����ּ���");
			return false;
		}
		if (orgPrice*0 != 0)
		{
			window.alert("��ǰ ������ ���ڷ� �Է����ּ���");
		}
		if (orgPrice.length == 0)
		{
			window.alert("��ǰ ������ �Է����ּ���");
			return false;
		}
		if (parPrice*0 != 0)
		{
			window.alert("��ǰ �ǸŰ��� ���ڷ� �Է����ּ���");
		}
		if (parPrice.length == 0)
		{
			window.alert("��ǰ �ǸŰ��� �Է����ּ���");
			return false;
		}
		if (country.length == 0)
		{
			window.alert("��ǰ �������� �Է����ּ���");
			return false;
		}
		if (company.length == 0)
		{
			window.alert("��ǰ �����縦 �Է����ּ���");
			return false;
		}
		if (goodsComment.length == 0)
		{
			f.goodsComment.value = "empty";
		}
		if (quantity.length == 0)
		{
			window.alert("��ǰ ���뷮�� �Է����ּ���");
			return false;
		}
		if (goodsAmount*0 != 0)
		{
			window.alert("��ǰ ������ ���ڷ� �Է����ּ���");
			return false;
		}
		if (goodsAmount.length >3)
		{
			window.alert("��ǰ ������ 3�ڸ������� �Է����ּ���");
			return false;
		}

		
		f.submit();
		
	}
	function listAction()
	{
		document.location.href="/superManagerServlet.mo?func=superMan_001";
	}



	// ��з� ����
	function selectApply(code)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_003&maincategory="+code;
	}

	//�ߺз�����
	function selectApply2()
	{
		var f = document.itemForm;
		var test = f.middlecategory.value;
		//alert(test);
		 document.location.href="/managerOrderServlet.mo?func=managerOrder_003&middlecategory="+test+"&maincategory=<%=maincategory%>";
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
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="550">
		<TR>
			<TD align="center" bgcolor="#74c900" width="300" colspan="6">
				<FONT color="white" size="3"><B>��ǰ���</B>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>


<FORM name="itemForm" action="/managerOrderServlet.mo"   enctype="multipart/form-data" method="post"><!-- post-->
<INPUT type="hidden" name="func" value="managerOrder_004">
<INPUT type="hidden" name="getFileYn" value="Y">
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#a0c0cb" width="550">
		<TR bgcolor="#74c900" align="center">
			<TD width="100" height="30"><B>��з�����</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><font color="black">��ǰ<INPUT type="radio" value = "F" name="maincategory"  onclick="selectApply('F');" <%if(maincategory.equals("F")){%>checked<%}%>><font color="black">��ȭ<INPUT type="radio" name="maincategory" onclick="selectApply('E');" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100" height="30"><B>�ߺз�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">
			<SELECT name ="middlecategory" onchange="selectApply2();" >
			<OPTION value="">---ī�װ�---</OPTION>
<%		
				
					System.out.println("middlecategory3 ===="+middlecategory);
					for (int i = 0; i<ItemSelectList.size(); i++)
				   {
					
					itemTable = (Hashtable)ItemSelectList.get(i);	
					String middlename = (String)itemTable.get("NAME");
					
					 code = (String)itemTable.get("CODE");
					System.out.println("code==="+code);
				
					
							/////code = �ߺз��� ��ȣ. middlecategory = subcategory�� middlecategory ��ȣ.
%>						
					<OPTION value="<%=code%>" <%if(code.equals(middlecategory)){%>selected<%}%>><%=middlename%></OPTION>
				
<%
					}
%>
			</SELECT>
			
			</TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100" ><B>�Һз�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">
			<SELECT name ="subcategory" >
			<OPTION value="">---ī�װ�---</OPTION>
<%		
		
					for (int i = 0; i<SubSelectList.size(); i++)
					{
					 subTable = (Hashtable)SubSelectList.get(i);	
					String subname = (String)subTable.get("NAME");  ////   middle select �� �з����� int �� �Ǿ��ֱ� ������ �ӽ÷� name���� ��ü�Ͽ���.
					String subcode = (String)subTable.get("CODE");
%>
					<OPTION value="<%=subcode%>" ><%=subname%></OPTION>
				
<%
					}
%>
			</SELECT>
		
		
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>�̹������</B></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="3">
				<INPUT type="file" name="upFile1" size="40">
				<INPUT type="file" name="upFile2" size="40">
				<INPUT type="file" name="upFile3" size="40">
			</TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>��ǰ�̸�</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="name"></TD>
		</TR>
		
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>��ǰ����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="orgPrice"></TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>��ǰ �ǸŰ�</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="parPrice"></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>������</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="country"></TD>
		</TR>
	
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>������</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="company"></TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>��ǰ �ΰ�����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="goodsComment"></TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>��ǰ ���뷮</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="quantity"></TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>��ǰ ����</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="goodsAmount"></TD>
		</TR>



	</TABLE>
</FORM>
	
	
	<TABLE cellspacing="1" cellpadding="3" width="750" >
		<TR><TD height="5"></TD></TR>
		<TR>
			<TD align="center">
				<IMG src="/images/button/Update.png" border="0" onclick="updateAction();" style="cursor:hand" align="absmiddle">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<IMG src="/images/button/List.png" border="0" onclick="listAction();" style="cursor:hand" align="absmiddle">
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