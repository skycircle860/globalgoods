<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>


<SCRIPT language="JavaScript">
/*
	// ����Ȯ��
	function checkAction()
	{
		document.location.href="/commonServlet.mo";
	}


	// ��� ���� ������ ����
	function goUpdate(code)
	{
		document.location.href='/managerHobbyServlet.mo?func=managerHobby_004&from=list&code='+code;
	}

	// ��� ��� or ���� �ϱ�
	function goUseYn(code, yn)
	{
		var alertStr = "�����Ͻ� ��̸� ������� ���ϰ� �Ͻðڽ��ϱ�?";
		if(yn=='Y')
		{
			alertStr = "�����Ͻ� ��̸� ��� �Ͻðڽ��ϱ�?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerHobbyServlet.mo?func=managerHobby_003&yn="+yn+"&code="+code;
		}
	}

	// ��� �߰�
	function goAdd()
	{
		window.open("/common/Progress.jsp", "addHobby", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
		window.name = "listWin";
		document.addForm.submit();
	}

	// ���ù�� ����
	function selectApply()
	{
		document.selectForm.submit();
	}
	*/

	

</SCRIPT>
<div><!-- ����Ʈ ȭ�� ��� �� -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">���� ������ : <A href="/goodsServlet.mo?func=goods_001">Ȩ</A>>������������</font>
	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR><TD height="5"></TD></TR>
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_ok.gif" border="0" onclick="checkAction();" style="cursor:hand" align="absmiddle">
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