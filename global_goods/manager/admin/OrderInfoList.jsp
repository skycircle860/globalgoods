<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		ArrayList orderInfoList = (ArrayList)outputTable.get("orderInfoList");

		

	    String check= (String)outputTable.get("state");
		
		
		System.out.println("�ֻ��check==========" +check);

%>

<style type="text/css">
  td
  {
	 height:25px;
  }

 </style>
<SCRIPT language="JavaScript">
 //������ ������Ʈ
	function updateAction()
	{
		var f = document.infoForm;
		
		
	
		f.submit();

	}

	function listAction()
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_001";
		
	}

	function deleteAction()
	{
		var f = document.infoForm;
		
		f.func.value="managerOrder_022";
		
		if(confirm("�����Ͻðڽ��ϱ�?"))
		{
			f.submit();
		}

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
				<FONT color="white" size="3"><B>�ֹ� ���� ����</B></FONT>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>


	<%
	
		Hashtable orderTable = (Hashtable)orderInfoList.get(0);
		
		String code = (String)orderTable.get("CODE");
		String orderId = (String)orderTable.get("MEMBER_ID");
		String orderDate = (String)orderTable.get("ORDER_DATE");
		String name = (String)orderTable.get("NAME");
		String price = (String)orderTable.get("PAR_PRICE");
		String state = (String)orderTable.get("ORDER_STATE");
		String addr1 = (String)orderTable.get("ADDR1");
		String addr2 = (String)orderTable.get("ADDR2");
		String zipcode1 = (String)orderTable.get("ZIPCODE1");
		String zipcode2 = (String)orderTable.get("ZIPCODE2");
		String home1 = (String)orderTable.get("HOME1");
		String home2 = (String)orderTable.get("HOME2");
		String home3 = (String)orderTable.get("HOME3");
		String office1 = (String)orderTable.get("OFFICE1");
		String office2 = (String)orderTable.get("OFFICE2");
		String office3 = (String)orderTable.get("OFFICE3");
		String mobile1 = (String)orderTable.get("MOBILE1");
		String mobile2 = (String)orderTable.get("MOBILE2");
		String mobile3 = (String)orderTable.get("MOBILE3");
		String comment= (String)orderTable.get("ORDER_COMMENT");
		String midname = (String)orderTable.get("MIDNAME");
		String subname = (String)orderTable.get("SUBNAME");
		String cancleDate = (String)orderTable.get("CANCLE_DATE");
		String depositDate = (String)orderTable.get("DEPOSIT_DATE");
		String sendDate = (String)orderTable.get("RECEIVE_DATE");
		String receiveDate = (String)orderTable.get("SEND_DATE");
		
		String cancleyn = (String)orderTable.get("CANCLEYN");
		String account = (String)orderTable.get("ACCOUNT_NUM");
		String goodsGroup = (String)orderTable.get("GOODS_GROUP");

		String depositYn = (String)orderTable.get("DEPOSITYN");		
		
		String useState ="";
		String usecancleState ="";
	

		if(state.equals("D"))
		{
			useState="�Ա�Ȯ��";
		}
		 if(state.equals("S"))
		{
			useState="�����";
		}
		 if(state.equals("R"))
		{
			useState="��ۿϷ�";
		}
		if(cancleyn.equals("Y"))
		{
			usecancleState="��ҿ�û";
		}
		if(cancleyn.equals("R"))
		{
			usecancleState="ȯ�ҿϷ�";	
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
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="550">
	<INPUT type="hidden" name ="code" value="<%=code%>">
	<INPUT type="hidden" name="cancleyn" value="<%= cancleyn%>">
	<INPUT type="hidden" name="depositYn" value="<%= depositYn%>">
	<INPUT type="hidden" name="from" value="OrderInfo">
	<INPUT type="hidden" name ="func" value="managerOrder_010">
	
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�ֹ��� ID</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="7"><%= orderId%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�ֹ���¥</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7"><%= orderDate%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>��ǰ �̸�</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7"><%= name%>&nbsp;(<%=maincategory%> - <%=midname%> - <%=subname%>)</TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>��ǰ ����</B></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="7"><%=price%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�ֹ��� �ּ�</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7">(<%=zipcode1%>-<%=zipcode2%>) &nbsp;<%=addr1%>-<%=addr2%></TD>
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
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7" ><%=account%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>��ۿ���</B></TD>
			<TD bgcolor="#FFFFFF" align="left" colspan="7">
			�Ա�Ȯ��
			<INPUT value="D" type="radio"  name="state" 
			
			<%if(state.equals("D")){%>checked<%}%>>
			�����
			<INPUT value="S" type="radio"  name="state" 
			
			<%if(state.equals("S")){%>checked<%}%>> 
			��ۿϷ� 
			<INPUT value="R" type="radio" name="state" 
			<%if(state.equals("R")){%>checked<%}%>>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			��ҿ�û 
			<INPUT value="Y" type="checkbox" name="cancleYn" align="right"
			<%if(cancleyn.equals("Y")){%>checked<%}%>>
			ȯ�ҿϷ�
			<INPUT value="R" type="checkbox" name="cancleYn" align="right"
			<%if(cancleyn.equals("R")){%>checked<%}%>>
			
			</TD>
		</TR>

		
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�ΰ���û</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="7"><%=comment%></TD>
		</TR>
		<TR bgcolor="#74c900" align="center" >
			<TD width="100"><font color="white"><B>�ֹ�����</B></TD>

			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=useState%></TD>
			<TD width="100"><font color="white"><B>��� ����</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=comment%></TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>�ֹ���ҳ�¥</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=cancleDate%></TD>
			<TD width="100"><font color="white"><B>�Աݳ�¥</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=depositDate%></TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>��ǰ�߼۳�¥</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=sendDate%></TD>
			<TD width="100"><font color="white"><B>��ǰ���ɳ�¥</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=receiveDate%></TD>
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
				<IMG src="/images/button/Delete.png" border="0" onclick="deleteAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	
	</FORM>
</CENTER>
