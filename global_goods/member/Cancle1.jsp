<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
			System.out.println("Cancle1.jsp ����. =====");
		
		String code = (String)outputTable.get("code");

		System.out.println("Cancle1.jsp =====");
			

%>
<SCRIPT language="JavaScript">


	


	function myInfopageGo()
	{
		
		document.location.href="/memberServlet.mo?func=member_014";
	}

	function cancleUpdateAction()
	{
		
		alert("�ֹ��� ��ҵǾ����ϴ�.");
	
		var f = document.cancleForm;
		f.submit();
	}

function Limit(obj)
	{
		var maxLength = parseInt(obj.getAttribute("maxlength"));
		
		if(obj.value.length > maxLength)
		{
		
			alert("������ 25�ڸ� �ʰ��� �� �����ϴ�. �ʰ��� ������ �����˴ϴ�.");
			
			obj.value = obj.value.substring(0,maxLength);
			
			return;
		}	
	}

</SCRIPT>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
<FORM name="cancleForm" action ="/memberServlet.mo" >
<INPUT type="hidden" name="code" value="<%=code%>">
<INPUT type="hidden" name="from" value="cancle1">
<INPUT type="hidden" name="func" value="member_016">
	
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#FFFFFF" width="700">

		<TR>
			<TD align="Left"   width="700" colspan="6" >
				<IMG src="/images/button/Cancle1.png">
			</TD>
		</TR>

	</TABLE>
	<TABLE>
	<TR><TD height="50"></TD></TR>
	</TABLE>


	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="700">
		<TR bgcolor="#74c900" align="center">
			<TD width="200" height="30"><B><FONT color="white">��� ������ �����ּ��� (25�� �̳���)</B>
			</TD>
		</TR>
			
			<TR ><TD > 
			<textarea name="comment"   cols="80" rows="5" maxlength="25" onblur="Limit(this)"></textarea></TD></TR>
			
	
		

			<!--	 -->
		
		<TR>
			<TD><IMG src="/images/button/ok.png" onclick="cancleUpdateAction()" style="cursor:hand">&nbsp;&nbsp;<IMG src="/images/button/cancle.png" onclick="" style="cursor:hand"></TD>
		</TR>

		 
	</TABLE>
</FORM>	 

</CENTER>
