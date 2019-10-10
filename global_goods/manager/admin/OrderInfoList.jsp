<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		ArrayList orderInfoList = (ArrayList)outputTable.get("orderInfoList");

		

	    String check= (String)outputTable.get("state");
		
		
		System.out.println("최상단check==========" +check);

%>

<style type="text/css">
  td
  {
	 height:25px;
  }

 </style>
<SCRIPT language="JavaScript">
 //상세정보 업데이트
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
		
		if(confirm("삭제하시겠습니까?"))
		{
			f.submit();
		}

	}


</SCRIPT>

<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>관리자페이지</font>



<CENTER>
<FORM name="infoForm" method="post" action="/managerOrderServlet.mo">
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="550">
		<TR>
			<TD align="center" bgcolor="#74c900" width="300" colspan="6">
				<FONT color="white" size="3"><B>주문 세부 정보</B></FONT>
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
			useState="입금확인";
		}
		 if(state.equals("S"))
		{
			useState="배송중";
		}
		 if(state.equals("R"))
		{
			useState="배송완료";
		}
		if(cancleyn.equals("Y"))
		{
			usecancleState="취소요청";
		}
		if(cancleyn.equals("R"))
		{
			usecancleState="환불완료";	
		}


		
		String maincategory = "";
		
		if(goodsGroup.startsWith("F"))
		{
			maincategory ="식품";
			System.out.println("maintest=="+maincategory);

		}

		 if(goodsGroup.startsWith("E"))
		{
			maincategory ="잡화";
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
			<TD width="100"><font color="white"><B>주문자 ID</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="7"><%= orderId%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>주문날짜</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7"><%= orderDate%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>상품 이름</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7"><%= name%>&nbsp;(<%=maincategory%> - <%=midname%> - <%=subname%>)</TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>상품 가격</B></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="7"><%=price%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>주문자 주소</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7">(<%=zipcode1%>-<%=zipcode2%>) &nbsp;<%=addr1%>-<%=addr2%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>휴대폰 번호</B></TD>
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
				<FONT color='red'>미입력</FONT>
<%
	}
%>
		</TD>		
		</TR>

				<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>집 전화번호</B></TD>
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
				<FONT color='red'>미입력</FONT>
<%
	}
%>
		</TD>		
		</TR>

				<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>사무실 번호</B></TD>
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
				<FONT color='red'>미입력</FONT>
<%
	}
%>
		</TD>		
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>계좌번호</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="7" ><%=account%></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>배송여부</B></TD>
			<TD bgcolor="#FFFFFF" align="left" colspan="7">
			입금확인
			<INPUT value="D" type="radio"  name="state" 
			
			<%if(state.equals("D")){%>checked<%}%>>
			배송중
			<INPUT value="S" type="radio"  name="state" 
			
			<%if(state.equals("S")){%>checked<%}%>> 
			배송완료 
			<INPUT value="R" type="radio" name="state" 
			<%if(state.equals("R")){%>checked<%}%>>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			취소요청 
			<INPUT value="Y" type="checkbox" name="cancleYn" align="right"
			<%if(cancleyn.equals("Y")){%>checked<%}%>>
			환불완료
			<INPUT value="R" type="checkbox" name="cancleYn" align="right"
			<%if(cancleyn.equals("R")){%>checked<%}%>>
			
			</TD>
		</TR>

		
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>부가요청</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="7"><%=comment%></TD>
		</TR>
		<TR bgcolor="#74c900" align="center" >
			<TD width="100"><font color="white"><B>주문상태</B></TD>

			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=useState%></TD>
			<TD width="100"><font color="white"><B>취소 사유</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=comment%></TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>주문취소날짜</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=cancleDate%></TD>
			<TD width="100"><font color="white"><B>입금날짜</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=depositDate%></TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><font color="white"><B>물품발송날짜</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><%=sendDate%></TD>
			<TD width="100"><font color="white"><B>물품수령날짜</B></TD>
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
