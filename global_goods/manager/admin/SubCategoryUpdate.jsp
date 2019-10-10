<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList SubInfoList = (ArrayList)outputTable.get("SubInfoList");
	Hashtable categoryTable = (Hashtable)SubInfoList.get(0);

	//String from = (String)inputTable.get("from");

	String code = (String)categoryTable.get("CODE");
	String useYn = (String)categoryTable.get("USEYN");
	String maincategory = (String)categoryTable.get("MAIN_CATEGORY");
	String middleCategory_name = (String)categoryTable.get("MIDDLE_CATEGORY_NAME");
	String middleCategory_code = (String)categoryTable.get("MIDDLE_CATEGORY");
	String useMainText = "";

	System.out.println("����� ��ī�װ� ���� code : "+code);

	if(maincategory.equals("F"))
	{
		useMainText ="��ǰ";
	}
	else
	{
		useMainText="��ȭ";
	}

	
	
	String useKor = "�����";
	if(useYn.equals("N"))
	{
		useKor = "�̻��";
	}
%>

<style type="text/css">
  td
  {
	 height:25px;
  }

 </style>

<SCRIPT language="JavaScript">
	// ���� ��� ������ ����
	function goList()
	{
		document.location.href="/managerHobbyServlet.mo?func=managerHobby_001";
	}

	// ���� ���� ��� ��ư
	function cancelAction()
	{
		alert("<%=code%>");
		document.location.href="/managerOrderServlet.mo?func=managerOrder_017&code=<%=code%>";
	}

	// ���� ����
	function updateAction()
	{
		var f = document.updateForm;
		if(trim(f.name.value)=="")
		{
			window.alert("������ �̸��� �Է��ϼ���.");
			f.name.select();
			return false;
		}

		alert("submit ��");
		f.name.value = trim(f.name.value);
		f.submit();
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
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="250">
		<TR>
			<TD align="center" bgcolor="#74c900" width="250">
				<FONT color="white" size="3"><B>ī�װ� ����</B></FONT></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="600">
		<TR>
			<TD align="right">
				<IMG src="/images/button/button_all_list.gif" border="0" onclick="goList();" style="cursor:hand" align="absmiddle" onClick="goList();">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="600">
		<FORM name="updateForm" method="post" action="/managerOrderServlet.mo" onSubmit="updateAction(); return false;">
			<INPUT type="hidden" name="func" value="managerOrder_016">
			<INPUT type="hidden" name="code" value="<%= code%>">
			
			<TR>
				<TD width="150" bgcolor="#74c900" align="center"><FONT color="white"><B>CODE</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= code%></TD>
			</TR>
			
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>��ǰ �з�</B></FONT></TD>
				<TD bgcolor="#FFFFFF" width="100" align="left">��ǰ<INPUT type="radio" value = "F" name="maincategory" <%if(maincategory.equals("F")){%>checked<%}%>>��ȭ<INPUT type="radio" name="maincategory" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
			</TR>

			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>��ǰ �ߺз�</B></FONT></TD>
				<TD bgcolor="#FFFFFF" width="100" align="left">
				<SELECT name ="middlecategory">
					<OPTION value="blank">---ī�װ�---</OPTION>
<%
					ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");

					for (int i = 0; i<ItemSelectList.size(); i++)
					{
					
						Hashtable itemTable = (Hashtable)ItemSelectList.get(i);	
						String middlename = (String)itemTable.get("NAME");
						
						String middle_code = (String)itemTable.get("CODE");
						System.out.println("middle_code==="+middle_code+"\n"+middleCategory_code);
				
					
						////code = �ߺз��� ��ȣ. middlecategory = subcategory�� middlecategory ��ȣ.
%>						
						<OPTION value="<%=middle_code%>" <%if(middle_code.equals(middleCategory_code) ){%>selected<%}%>><%=middlename%></OPTION>
				
<%
					}
%>
				</SELECT>
			</TR>
		
			<TR>

				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>NAME</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><INPUT type="text" name="name" value="<%= categoryTable.get("NAME")%>"></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>��� ����</B></FONT></TD>
				<TD bgcolor="#FFFFFF">
					<SELECT name="yn">
						<OPTION value="Y" <%if(useYn.equals("Y")){%>selected<%}%>>���</OPTION>
						<OPTION value="N" <%if(useYn.equals("N")){%>selected<%}%>>�̻��</OPTION>
					</SELECT>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>�ۼ��� (IP)</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= categoryTable.get("REG_ID")%> (<%= categoryTable.get("REG_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>�ۼ���</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= categoryTable.get("REG_DATE")%></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>���� ������ (IP)</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= categoryTable.get("UPD_ID")%> (<%= categoryTable.get("UPD_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>���� ������</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= categoryTable.get("UPD_DATE")%></TD>
			</TR>
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="5"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_update.gif" border="0" align="absmiddle" alt="����" style="cursor:hand" onClick="updateAction();">
				&nbsp;&nbsp;
				<IMG src="/images/button/but_cancel1.gif" border="0" align="absmiddle" alt="���" style="cursor:hand" onClick="cancelAction();">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>