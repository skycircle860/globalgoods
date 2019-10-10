<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList ReturnOrderList = (ArrayList)outputTable.get("ReturnOrderList");
	
	
	String pageType = (String)inputTable.get("pageType");
	Integer articlePerPage = (Integer)inputTable.get("articlePerPage");
	Integer pageNum = (Integer)inputTable.get("pageNum");
	
	Integer pageTotalNum = (Integer)inputTable.get("pageTotalNum");
	Integer articleTotalNum = (Integer)inputTable.get("articleTotalNum");
	
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


 td
  {
	 height:25px;
	 color:white;
  }

 </style>

<SCRIPT language="JavaScript">

	
	// 상세정보 페이지 가기
	function goDetailInfo(code,state)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_020&code="+code+"&state="+state;
	}

</SCRIPT>
<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">현재 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>관리자페이지</font>
<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="850">
		<TR>
			<TD align="center" bgcolor="#74c900" width="400" >
				<FONT color="white" size="3"><B>반품신청 리스트</FONT></B>	
			</TD>
		</TR>
		
	</TABLE>
	<BR>
	<FORM name="ReturnForm" action="/managerOrderServlet.mo" method="post">
	<INPUT type="hidden" name="func">
	<INPUT type="hidden" name="seq">
	<INPUT type="hidden" name="hit">

	<INPUT type="hidden" name="pageNum" value="<%= pageNum%>">
	<INPUT type="hidden" name="pageType" value="<%= pageType%>">
	<INPUT type="hidden" name="articlePerPage" value="<%= articlePerPage%>">
</FORM>

	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="850" >
		<TR bgcolor="#74c900" align="center">
			<TD width="150" height="30"><B>글 번호</B></TD>
			<TD width="150" ><B>주문일자</B></TD>
			<TD width="150"><B>상품명</B></TD>
			<TD width="150"><B>결제금액</B></TD>
			<TD width="150"><B>계좌번호</B></TD>
			<TD width="150"><B>반품상태</B></TD>
			
		</TR>
<%
	if(ReturnOrderList==null || ReturnOrderList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><font color="black"><B>주문 정보가 없습니다.</B></font></TD></TR>
<%
	}
	else
	{
		String startNum = (String)((Hashtable)ReturnOrderList.get(0)).get("DISP_NUM");
		String endNum = (String)((Hashtable)ReturnOrderList.get(ReturnOrderList.size()-1)).get("DISP_NUM");

		for(int i=0; i<ReturnOrderList.size(); i++)
		{
			Hashtable orderTable = (Hashtable)ReturnOrderList.get(i);
			String dispNum = (String)orderTable.get("DISP_NUM");
			String returnDate = (String)orderTable.get("REQUEST_DATE");
			String state = (String)orderTable.get("RETURN_STATE");
			String code = (String)orderTable.get("CODE");
			String name = (String)orderTable.get("NAME");
			String account = (String)orderTable.get("ACCOUNT_NUM");
			String price=(String)orderTable.get("PRICE");
			
			System.out.println("code if문"+code);

			String bgcolor = "#FFFFFF";

			
			String useState = "";
		

	////////////////////////여기서 E는 사용자가 반품신청했을때 등록되는 최초값이다. ///////////////////////
			if(state.equals("E"))
			{
				useState="반품요청";
			}
			else if(state.equals("T"))
			{
				useState="물품확인";
			}

			else if(state.equals("B"))
			{
				useState="반품완료";
			}
			else if(state.equals("F"))
			{
				useState="환불완료";
			}
		


%>
		<TR bgcolor="<%= bgcolor%>" align="center" >
		<TD align="center"  ><FONT color="black"><%= dispNum%></FONT></TD>
			<TD   height="20"><FONT color="black"><A href="javascript:goDetailInfo('<%= code%>','<%=state%>')"><%= returnDate%></A></FONT></TD>
			
			<TD  ><FONT color="black"><%= name%></FONT></TD>
			<TD  ><FONT color="black"><%= price%></FONT></TD>
			<TD  ><FONT color="black"><%= account%></FONT></TD>
			<TD  ><FONT color="black"><%= useState%></FONT></TD>
		
			
		</TR>
<%
		}
	}
%>

	</TABLE>
	
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR><TD height="10"></TD></TR>
		<TR>
			<TD width="750">
				<jsp:include page="/manager/admin/ReturnOrderPageNumber.jsp" flush="true" />
			</TD>
		</TR>
		<TR><TD height="30"></TD></TR>
	</TABLE>
</CENTER>
