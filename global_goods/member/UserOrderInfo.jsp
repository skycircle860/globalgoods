<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
			System.out.println("userOrderInfo ����. =====");
		ArrayList userOrderList = (ArrayList)outputTable.get("userOrderList");
		System.out.println("userOrderInfo =====");
			

%>
<SCRIPT language="JavaScript">

//��ǰ ���
	function updateAction()
	{
		alert("action");
		var f = document.itemForm;
		

		f.submit();
		
	}
 
	// ���ù�� ����
	function selectApply(code)
	{
		
		alert(code);
		
		document.location.href="/managerItemServlet.mo?func=managerItem_001&maincategory="+code;
		
	}
	

	
	// ������ ������ ����
	function goDetailInfo(code)
	{
		document.location.href="/goodsServlet.mo?func=goods_002&code="+code;
	}

	function myInfopageGo()
	{
		document.location.href="/memberServlet.mo?func=member_014";
	}

	function cancleAction(code,state,depositYn)
	{
		document.location.href="/memberServlet.mo?func=member_015&code="+code+"&state="+state+"&depositYn="+depositYn;
	}



</SCRIPT>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>

	<TABLE cellspacing="1" cellpadding="5"  width="700">
		<TR>
			<TD align="Left"   width="700" colspan="6" >
				<IMG src="/images/button/OrderListMenu3.png">
			</TD>
		
		</TR>
		<TR>
		<TD align="right">
			<IMG src="/images/button/userInfo.png" onclick="myInfopageGo()">
		</TD>		
	</TABLE>


	<TABLE cellspacing="1" cellpadding="4"  width="700">
		<TR  align="center">
			<TD background="/images/button/UserOrderList2.png" width="200" height="30"><B><FONT color="gray">�ֹ���¥</B></TD>
		
			<TD background="/images/button/UserOrderList2.png" width="200" height="30"><B><FONT color="gray">��ǰ��</B></TD>
			<TD background="/images/button/UserOrderList2.png" width="100" height="30"><B><FONT color="gray">�����ݾ�</B></TD>
			<TD background="/images/button/UserOrderList2.png" width="100" height="30"><B><FONT color="gray">�ֹ�����</B></TD>
			<TD background="/images/button/UserOrderList2.png" width="100" height="30"><B><FONT color="gray">ó������</B></TD>
			

			<!--	 -->
		</TR>
<%
	System.out.println("userOrderInfo for =====");
	for(int i=0; i<userOrderList.size(); i++)
	{
		Hashtable UserOrderTable = (Hashtable)userOrderList.get(i);
		String code = (String)UserOrderTable.get("CODE");
		String orderDate = (String)UserOrderTable.get("ORDER_DATE");
		String name = (String)UserOrderTable.get("NAME");
		String amount = (String)UserOrderTable.get("GOODS_AMOUNT");
		String price = (String)UserOrderTable.get("PRICE");
		String state = (String)UserOrderTable.get("ORDER_STATE");
		String goodsCode = (String)UserOrderTable.get("GOODS_CODE");
	
		String depositYn = (String)UserOrderTable.get("DEPOSITYN");
		String cancleyn = (String)UserOrderTable.get("CANCLEYN");
		
	

		String bgcolor = "#FFFFFF";

		String useDeposit = "";

	
		String useState ="";
		String usecancleState ="";
	
			System.out.println("userOrderInfo 3=====");
		if(depositYn.equals("N"))
		{
			state = "O";
			useState="�Աݴ��";
		}

		if(depositYn.equals("Y") &&  state.equals("O"))
		{
			state="D";
		}

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
			useState="��ҿ�û";
		}

		if (state.equals("B"))
		{
			useState="��ǰ�Ϸ�";
		}

		if(state.equals("E"))
		{
			useState="ȯ�ҿϷ�";
		}

	
		

	System.out.println("userOrderInfo4 =====");
%>
		<TR bgcolor="<%= bgcolor%>" align="left">

			
			<TD align="center" height="30"><A href="javascript:goDetailInfo('<%= goodsCode%>')"><%= orderDate%></A></TD>
			
			<TD align="center"><%= name%></TD>
			<TD align="center"><%= price%>(<%=amount%>)��</TD>
			<TD align="center"><%=useState%></TD>

			<TD align="center"><IMG src="images/button/OrderCancle.png" style="cursor:hand" onclick="cancleAction('<%= code%>', '<%= state%>', '<%= depositYn%>')"></TD>
			</TR>
<%

	}
	System.out.println("userOrderInfo5 =====");
	if(userOrderList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><B><FONT color="#183265">�ֹ� ������ �����ϴ�.</B></TD></TR>
<%
	}
%>
	</TABLE>
	 

</CENTER>
