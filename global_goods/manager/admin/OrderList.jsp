<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList orderList = (ArrayList)outputTable.get("orderList");
	

	String pageType = (String)inputTable.get("pageType");
	Integer articlePerPage = (Integer)inputTable.get("articlePerPage");
	Integer pageNum = (Integer)inputTable.get("pageNum");
	
	Integer pageTotalNum = (Integer)inputTable.get("pageTotalNum");
	Integer articleTotalNum = (Integer)inputTable.get("articleTotalNum");
	String startNum = (String)((Hashtable)orderList.get(0)).get("DISP_NUM");
	String endNum = (String)((Hashtable)orderList.get(orderList.size()-1)).get("DISP_NUM");
%>
<style type="text/css">
  .R1{
 
   border-left: 1px solid #cfdee9;
   border-bottom:1px solid #e4e4e4;
  }
 
 .R2{
		border-top:1px solid #e4e4e4;
	
	  }
  .R3{
 

   border-bottom:1px solid #e4e4e4;
  }
   .R4{
 
	
  border-left: 1px solid #cfdee9;
   border-top:1px solid #e4e4e4;
  }

 </style>

<SCRIPT language="JavaScript">


	
	// 상세정보 페이지 가기
	function goDetailInfo(code,state)
	{

		document.location.href="/managerOrderServlet.mo?func=managerOrder_002&code="+code+"&state="+state;
	}

	
	function sortAction(sort)
	{
		alert(sort);
		document.location.href="/managerOrderServlet.mo?func=managerOrder_001&sort="+sort;
	}
	


</SCRIPT>

<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>관리자페이지</font>



<CENTER>


	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="550" height="30">
		<TR>
			<TD align="center" bgcolor="#FFFFFF" width="100" >
				<B>정렬 방식 </B>
			</TD>
			<TD align="center" bgcolor="#74c900" width="100" onclick="sortAction('A')" style="cursor:hand">
				<FONT color="white" size="3"><B> 주문 정보</B></FONT>
			</TD>
		 
				<TD align="center" bgcolor="#74c900" width="150" onclick="sortAction('R')" style="cursor:hand">
				<FONT color="white" size="3"><B> 주문 취소 목록</B></FONT>
			</TD>
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>

<FORM name="orderForm" action="/managerOrderServlet.mo" method="post">
	<INPUT type="hidden" name="func">
	<INPUT type="hidden" name="seq">
	<INPUT type="hidden" name="hit">

	<INPUT type="hidden" name="pageNum" value="<%= pageNum%>">
	<INPUT type="hidden" name="pageType" value="<%= pageType%>">
	<INPUT type="hidden" name="articlePerPage" value="<%= articlePerPage%>">
</FORM>


	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="800">
		<TR bgcolor="#74c900" align="center">
			<TD width="100" height="30" ><B><FONT color="white">글 번호</B></TD>
			<TD width="200" ><B><FONT color="white">주문일자</B></TD>
			<TD width="200" ><B><FONT color="white">상품명</B></TD>
			<TD width="100"><B><FONT color="white">결제금액</B></TD>
			<TD width="100"><B><FONT color="white">주문상태</B></TD>
			<TD width="100"><B><FONT color="white">취소유무</B></TD>
			<!--	 -->
		</TR>
<%
	for(int i=0; i<orderList.size(); i++)
	{
		Hashtable orderTable = (Hashtable)orderList.get(i);
		String dispNum = (String)orderTable.get("DISP_NUM");
		String orderDate = (String)orderTable.get("ORDER_DATE");
		String name = (String)orderTable.get("NAME");
		String price = (String)orderTable.get("PRICE");
		String state = (String)orderTable.get("ORDER_STATE");
		String code = (String)orderTable.get("CODE");
		String depositYn = (String)orderTable.get("DEPOSITYN");
		String cancleyn = (String)orderTable.get("CANCLEYN");
		
	

		String bgcolor = "#FFFFFF";

		String useDeposit = "";

	
		String useState ="";
		String usecancleState ="";
	
		
		if(depositYn.equals("N"))
		{
			state = "O";
			useState="입금대기";
		}

		if(depositYn.equals("Y") &&  state.equals("O"))
		{
			state="D";
		}

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
	
		


%>
		<TR bgcolor="<%= bgcolor%>" align="left">

			<TD align="center"><%= dispNum%></TD>
			<TD align="center"><A href="javascript:goDetailInfo('<%= code%>','<%=state%>','<%=depositYn%>')"><%= orderDate%></A></TD>
			
			<TD align="center"><%= name%></TD>
			<TD align="center"><%= price%></TD>
			<TD align="center"><%=useState%></TD>
			<TD align="center"><%=usecancleState%></TD>
			</TR>
<%

	}

	if(orderList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><B><FONT color="#183265">주문 정보가 없습니다.</B></TD></TR>
<%
	}
%>
	</TABLE>
	 
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR><TD height="10"></TD></TR>
		<TR>
			<TD width="750">
				<jsp:include page="/manager/admin/OrderPageNumber.jsp" flush="true" />
			</TD>
		</TR>
		<TR><TD height="30"></TD></TR>
	</TABLE>

</CENTER>
