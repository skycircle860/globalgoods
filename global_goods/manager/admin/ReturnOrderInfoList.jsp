<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		ArrayList ReturnOrderInfoList = (ArrayList)outputTable.get("ReturnOrderInfoList");

%>

<SCRIPT language="JavaScript">
 //��ǰ���� ������Ʈ
	function updateAction()
	{
		var f = document.infoForm;

		f.submit();

	}

	function listAction()
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_009";
		
	}


</SCRIPT>
<div><!-- ����Ʈ ȭ�� ��� �� -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">���� ������ : <A href="/goodsServlet.mo?func=goods_001">Ȩ</A>>������������</font>	
<CENTER>
<FORM name="infoForm" method="post" action="/managerOrderServlet.mo">
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="550">
		<TR>
			<TD align="center" bgcolor="#74c900" width="300" colspan="6">
				<FONT color="white" size="3"><B>��ǰ ǰ�� ����</B></FONT>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
<style>
  td
  {
	 height:25px;
  }

 </style>

	<%
	
		Hashtable returnTable = (Hashtable)ReturnOrderInfoList.get(0);
		
		String code = (String)returnTable.get("CODE");
		String orderId = (String)returnTable.get("MEMBER_ID");
		String orderDate = (String)returnTable.get("REQUEST_DATE");
		String name = (String)returnTable.get("NAME");
		String price = (String)returnTable.get("PRICE");
		String state = (String)returnTable.get("RETURN_STATE");
		String returnComment = (String)returnTable.get("RETURN_COMMENT");
		String bankname = (String)returnTable.get("BANKNAME");
		String midname = (String)returnTable.get("MIDNAME");
		String subname = (String)returnTable.get("SUBNAME");
		String addr1 = (String)returnTable.get("ADDR1");
		String addr2 = (String)returnTable.get("ADDR2");
		String zipcode1 = (String)returnTable.get("ZIPCODE1");
		String zipcode2 = (String)returnTable.get("ZIPCODE2");
		String home1 = (String)returnTable.get("HOME1");
		String home2 = (String)returnTable.get("HOME2");
		String home3 = (String)returnTable.get("HOME3");
		String office1 = (String)returnTable.get("OFFICE1");
		String office2 = (String)returnTable.get("OFFICE2");	 
		String office3 = (String)returnTable.get("OFFICE3");
		String mobile1 = (String)returnTable.get("MOBILE1");
		String mobile2 = (String)returnTable.get("MOBILE2");
		String mobile3 = (String)returnTable.get("MOBILE3");
		String returnDate = (String)returnTable.get("RETURN_GOODS_DATE");
		String refundDate = (String)returnTable.get("REFUND_DATE");
		String goodsquantity = (String)returnTable.get("GOODS_AMOUNT");

		String account = (String)returnTable.get("ACCOUNT_NUM");
		String goodsGroup = (String)returnTable.get("GOODS_GROUP");



	
		String useState ="";

		if(state.equals("E"))
		{
			useState="��ǰ��û";
		}
		else if(state.equals("T"))
		{
			useState="��ǰȮ��";
		}
		else if(state.equals("B"))
		{
			useState="��ǰ�Ϸ�";
		}

		else if(state.equals("F"))
		{
			useState="ȯ�ҿϷ�";
		}

		String maincategory = "";
		
		if(goodsGroup.startsWith("F"))
		{
			maincategory ="��ǰ";
			System.out.println("maintest=="+maincategory);

		}

		 if(goodsGroup.startsWith("E"))
		{
			maincategory ="��ȭ";
			System.out.println("maintest=="+maincategory);
		} 


%>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="white" width="550">
	<INPUT type="hidden" name ="code" value="<%=code%>">
	<INPUT type="hidden" name ="func" value="managerOrder_021">
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�ֹ��� ID</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="7"><%= orderId%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>��ǰ��û��¥</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7"><%= orderDate%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>��ǰ �̸�</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7"><%= name%>&nbsp;(<%=maincategory%> - <%=midname%> - <%=subname%>)</TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>��ǰ ����</B></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="7"><%=price%> (<%=goodsquantity%>��)</TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�ֹ��� �ּ�</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7">(<%=zipcode1%>-<%=zipcode2%>) &nbsp;<%=addr1%> - <%=addr2%></TD>
		</TR>
	<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�޴��� ��ȣ</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7">
<%
	if(!mobile1.equals("000"))
	{
%>
					<%= mobile1%> - <%= mobile2%> - <%= mobile3%>
<%
	}
	else
	{
%>
				<FONT color='red'>���Է�</FONT>
<%
	}
%>
		</TD>		
		</TR>

				<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�� ��ȭ��ȣ</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7">
<%
	if(!home1.equals("000"))
	{
%>
					<%= home1%> - <%= home2%> - <%= home3%>
<%
	}
	else
	{
%>
				<FONT color='red'>���Է�</FONT>
<%
	}
%>
		</TD>		
		</TR>

				<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�繫�� ��ȣ</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7">
<%
	if(!office1.equals("000"))
	{
%>
					<%= office1%> - <%= office2%> - <%= office3%>
<%
	}
	else
	{
%>
				<FONT color='red'>���Է�</FONT>
<%
	}
%>
		</TD>		
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>���¹�ȣ</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7">(<%=bankname%>)<%=account%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>ȯ�ҿ���</B></TD>
			<TD bgcolor="#FFFFFF" align="left" colspan="7">
			��ǰȮ��
			<INPUT value="T" type="radio"  name="state" 
			<%if(state.equals("T")){%>checked<%}%>> 

			��ǰ�Ϸ�
			<INPUT value="B" type="radio"  name="state" 
			<%if(state.equals("B")){%>checked<%}%>> 
			
			ȯ�ҿϷ� 
			<INPUT value="F" type="radio" name="state" 
			<%if(state.equals("F")){%>checked<%}%>></TD>

		</TR>
		
		<TR bgcolor="#74c900" align="center" >
			<TD width="100"><font color="white"><B>�ֹ�����</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" ><%=useState%></TD>
			<TD  width="100"><font color="white"><B>��ǰ����</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="7"><%=returnComment%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�ΰ���û</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="7"><%=returnComment%></TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>��ǰ��¥</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=returnDate%></TD>
			<TD width="100"><font color="white"><B>ȯ�ҳ�¥</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=refundDate%></TD>
		</TR>

	</TABLE> 
	
	
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
				<IMG src="/images/button/Delete.png" border="0" onclick="checkAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	</FORM>
</CENTER>
