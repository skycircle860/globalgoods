<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	System.out.println("Cancle2.jsp 진입. =====");
		ArrayList bankList = (ArrayList)outputTable.get("bankList");

		System.out.println("Cancle2.jsp 진입. =====");
		
		String code = (String)outputTable.get("code");
		String state = (String)outputTable.get("state");
		String depositYn =(String)outputTable.get("depositYn");

		System.out.println("Cancle2.jsp =====");
			

%>
<SCRIPT language="JavaScript">


	


	function myInfopageGo()
	{
		
		document.location.href="/memberServlet.mo?func=member_014";
	}

	function cancleUpdateAction()
	{
		var f = document.cancleForm;
		var test = f.bank.value;
		alert(test);
		alert("주문이 취소되었습니다.");
	
	
		f.submit();
	}


function Limit(obj)
	{
		var maxLength = parseInt(obj.getAttribute("maxlength"));
		
		if(obj.value.length > maxLength)
		{
		
			alert("내용은 25자를 초과할 수 없습니다. 초과된 내용은 삭제됩니다.");
			
			obj.value = obj.value.substring(0,maxLength);
			
			return;
		}	
	}

</SCRIPT>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
<FORM name="cancleForm" action="/memberServlet.mo">
<INPUT type="hidden" name="code" value="<%=code%>">
<INPUT type="hidden" name="state" value="<%=state%>">
<INPUT type="hidden" name="depositYn" value="<%=depositYn%>">
<INPUT type="hidden" name="from" value="cancle2">
<INPUT type="hidden" name="func" value="member_016">


	<TABLE cellspacing="1" cellpadding="5" bgcolor="#FFFFFF" width="700">

		<TR>
			<TD align="Left"   width="700" colspan="6" >
				<IMG src="/images/button/Cancle2.png">
			</TD>
		</TR>

	</TABLE>
	<TABLE>
	<TR><TD height="50"></TD></TR>
	</TABLE>
		
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="700">
	<TR>
	<TD>
	
	<FONT color="white"><B>환불받을 계좌번호<B></FONT>
	<SELECT name="bank">
	<OPTION value="">--은행목록--</OPTION>
	<%
		System.out.println("은행목록 테스트");
		for(int i=0; i<bankList.size(); i++)
		{
			Hashtable banktable = (Hashtable)bankList.get(i);
			String bankcode = (String)banktable.get("CODE");
			String bankname = (String)banktable.get("NAME");


		
	%>
			<OPTION value="<%=bankcode%>" ><%=bankname%></OPTION>
<%
		}
%>
	<INPUT type="text" name = "account" ></TD>
	</TD>


		<TR bgcolor="#74c900" align="center">
			<TD width="300" height="30" align="left"><B><FONT color="white">반품 사유를 적어주세요(25자 이내로)</B></TD>
			</TR>
	 
			
			<TR>
				<TD>
				<textarea name="comment"   cols="80" rows="5" maxlength="25" onblur="Limit(this)"></textarea></TD></TR>
				</TD>
			</TR>
				

			<!--	 -->
		</TR>
		<TR>
			<TD><IMG src="images/button/ok.png" onclick="cancleUpdateAction()" style="cursor:hand">&nbsp;&nbsp;<IMG src="images/button/cancle.png" onclick="" style="cursor:hand"></TD>
		</TR>

		 
	</TABLE>
	 </FORM>

</CENTER>
