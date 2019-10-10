<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page session="false"%>

<SCRIPT language="JavaScript">
	function agreeAction()
	{
		var f1 = document.agreeForm;
		var f2 = document.joinCheckForm;
		if(f1.agreeYn[0].checked)
		{
			if(f2.joinCheckYn.value=="N")
			{
				window.alert("���Կ��� Ȯ���� �� �Ͻñ� �ٶ��ϴ�.");
				f2.name.select();
				return false;
			}
			if(f2.jumin1.value!=f2.checkJumin1.value || f2.jumin2.value!=f2.checkJumin2.value)
			{
				window.alert("�ֹε�Ϲ�ȣ�� �ٲټ̽��ϴ�. �ٽ� ���Կ��� Ȯ���� �ٶ��ϴ�.");
				f2.jumin1.select();
				return false;
			}

			f1.submit();
		}
		else
		{
			window.alert("����� �����ؾ� ȸ�������� �� �ֽ��ϴ�.");
			return false;
		}
	}

	function joinCheckAction()
	{
		var f = document.joinCheckForm;

		// �̸� üũ
		if(trim(f.name.value)=="")
		{
			window.alert("�̸��� �Է��ϼ���.");
			f.name.select();
			return false;
		}
		f.name.value = trim(f.name.value);

		// �ֹι�ȣ üũ
		if(f.jumin1.value=="")
		{
			window.alert("�ֹε�Ϲ�ȣ ���ڸ��� �Է��ϼ���.");
			f.jumin1.select();
			return false;
		}
		if(f.jumin2.value=="")
		{
			window.alert("�ֹε�Ϲ�ȣ ���ڸ��� �Է��ϼ���.");
			f.jumin2.select();
			return false;
		}
		if(f.jumin1.value.length!=6)
		{
			window.alert("�ֹε�Ϲ�ȣ ���ڸ��� ���̸� Ȯ���ϼ���.");
			f.jumin1.select();
			return false;
		}
		if(f.jumin2.value.length!=7)
		{
			window.alert("�ֹε�Ϲ�ȣ ���ڸ��� ���̸� Ȯ���ϼ���.");
			f.jumin2.select();
			return false;
		}
		if(!isNum(f.jumin1.value))
		{
			window.alert("�ֹε�Ϲ�ȣ�� ���ڸ� �Է� �����մϴ�.");
			f.jumin1.select();
			return false;
		}
		if(!isNum(f.jumin2.value))
		{
			window.alert("�ֹε�Ϲ�ȣ�� ���ڸ� �Է� �����մϴ�.");
			f.jumin2.select();
			return false;
		}
		f.jumin1.value = trim(f.jumin1.value);
		f.jumin2.value = trim(f.jumin2.value);

		ajaxJoinCheck();
	}

	// ���Կ���Ȯ�� Ajaxó��
	function ajaxJoinCheck()
	{
		$.ajax({
			type: "POST", 
			url: "/memberServlet.mo",
			dataType: "text",
			data: "func=member_007&jumin1=" + $('#jumin1').val() + "&jumin2=" + $('#jumin2').val(), 
			success: function(text){
				text = trim(text);
				var resultCode = text.substring(0, 1);
				if(resultCode == "1")
				{
					$('#joinCheckYn').attr("value", "Y");

					$('#agreeJumin1').attr("value", trim($('#jumin1').val()));
					$('#agreeJumin2').attr("value", trim($('#jumin2').val()));
					$('#agreeName').attr("value", trim($('#name').val()));

					$('#checkJumin1').attr("value", trim($('#jumin1').val()));
					$('#checkJumin2').attr("value", trim($('#jumin2').val()));
				}
				else
				{
					$('#joinCheckYn').attr("value", "N");
				}
				$('#joinCheckMessage').text(text.substring(1));
			}
		});
	}

	// �ֹι�ȣ ����
	function jumin1LengthCheck()
	{
		var f = document.joinCheckForm;
		if(f.jumin1.value.length==6)
		{
			f.jumin2.select();
		}
	}

	function cancelAction()
	{
		document.location.href="/memberServlet.mo?func=member_004";
	}
</SCRIPT>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD align="center" bgcolor="#FFFFFF" height="20"></TD></TR>
	</TABLE>

	<TABLE cellspacing="1" cellpadding="0" bgcolor="#7682EB">
		<TR>
			<TD align="center" bgcolor="#E4F0FC" width="300" height="30">
				<FONT size="3" color="#000000"><B>��� ����</B></FONT>
			</TD>
		</TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD align="center" bgcolor="#FFFFFF" height="10"></TD></TR>
	</TABLE>

	<TABLE cellspacing="1" cellpadding="0" bgcolor="#7682EB" width="700" height="400">
		<TR>
			<TD align="center" bgcolor="#FFFFFF" width="700" height="400">
				<IFRAME src="/member/Rule.jsp" frameborder="0" width="700" height="400" marginwidth="10" marginheight="10" scrolling="auto"></IFRAME>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<FORM name="agreeForm" method="post" action="/memberServlet.mo">
			<INPUT type="hidden" name="func" value="member_005">
			<INPUT type="hidden" name="name" id="agreeName" value="">
			<INPUT type="hidden" name="jumin1" id="agreeJumin1" value="">
			<INPUT type="hidden" name="jumin2" id="agreeJumin2" value="">
			<TR><TD height="15"></TD></TR>
			<TR>
				<TD align="center">
					<INPUT type="radio" name="agreeYn" checked> �����մϴ�.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<INPUT type="radio" name="agreeYn"> �������� �ʽ��ϴ�.
				</TD>
			</TR>
		</FORM>
		<TR><TD height="10"></TD></TR>
		<TR>
			<TD align="center">
				<TABLE cellspacing="1" cellpadding="10" width="400" bgcolor="#7682EB">
					<TR>
						<TD bgcolor="#FFFFFF">
							<TABLE cellspacing="0" cellpadding="5" width="350">
								<FORM name="joinCheckForm" method="post" action="/memberServlet.mo">
									<INPUT type="hidden" name="joinCheckYn" id="joinCheckYn" value="N">
									<INPUT type="hidden" name="func" value="member_007">
									<INPUT type="hidden" name="checkJumin1" id="checkJumin1" value="">
									<INPUT type="hidden" name="checkJumin2" id="checkJumin2" value="">
									<TR>
										<TD width="100" align="right">�� ��</TD>
										<TD><INPUT type="text" name="name" id="name"></TD>
									</TR>
									<TR>
										<TD width="100" align="right">�ֹε�Ϲ�ȣ</TD>
										<TD>
											<INPUT type="text" name="jumin1" size="9" maxlength="6" onKeyUp="jumin1LengthCheck();" id="jumin1">
											- <INPUT type="password" name="jumin2" size="13" maxlength="7" id="jumin2">
										</TD>
									</TR>
									<TR>
										<TD align="right">
											<IMG src="/images/button/joincheck.gif" border="0" onclick="joinCheckAction()" style="cursor:hand" align="absmiddle">
										</TD>
										<TD>
											&nbsp;&nbsp;&nbsp;<B><SPAN id="joinCheckMessage"></SPAN></B>
										</TD>
									</TR>
								</FORM>
							</TABLE>
						</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
		<TR><TD height="20"></TD></TR>
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_join.gif" border="0" onclick="agreeAction();" style="cursor:hand" align="absmiddle">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<IMG src="/images/button/but_cancel1.gif" border="0" onclick="cancelAction();" style="cursor:hand" align="absmiddle">
			</TD>
		</TR>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD align="center" bgcolor="#FFFFFF" height="20"></TD></TR>
	</TABLE>
</CENTER>