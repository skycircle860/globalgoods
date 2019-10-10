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
				window.alert("가입여부 확인을 꼭 하시기 바랍니다.");
				f2.name.select();
				return false;
			}
			if(f2.jumin1.value!=f2.checkJumin1.value || f2.jumin2.value!=f2.checkJumin2.value)
			{
				window.alert("주민등록번호를 바꾸셨습니다. 다시 가입여부 확인을 바랍니다.");
				f2.jumin1.select();
				return false;
			}

			f1.submit();
		}
		else
		{
			window.alert("약관에 동의해야 회원가입할 수 있습니다.");
			return false;
		}
	}

	function joinCheckAction()
	{
		var f = document.joinCheckForm;

		// 이름 체크
		if(trim(f.name.value)=="")
		{
			window.alert("이름을 입력하세요.");
			f.name.select();
			return false;
		}
		f.name.value = trim(f.name.value);

		// 주민번호 체크
		if(f.jumin1.value=="")
		{
			window.alert("주민등록번호 앞자리를 입력하세요.");
			f.jumin1.select();
			return false;
		}
		if(f.jumin2.value=="")
		{
			window.alert("주민등록번호 뒷자리를 입력하세요.");
			f.jumin2.select();
			return false;
		}
		if(f.jumin1.value.length!=6)
		{
			window.alert("주민등록번호 앞자리의 길이를 확인하세요.");
			f.jumin1.select();
			return false;
		}
		if(f.jumin2.value.length!=7)
		{
			window.alert("주민등록번호 뒷자리의 길이를 확인하세요.");
			f.jumin2.select();
			return false;
		}
		if(!isNum(f.jumin1.value))
		{
			window.alert("주민등록번호는 숫자만 입력 가능합니다.");
			f.jumin1.select();
			return false;
		}
		if(!isNum(f.jumin2.value))
		{
			window.alert("주민등록번호는 숫자만 입력 가능합니다.");
			f.jumin2.select();
			return false;
		}
		f.jumin1.value = trim(f.jumin1.value);
		f.jumin2.value = trim(f.jumin2.value);

		ajaxJoinCheck();
	}

	// 가입여부확인 Ajax처리
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

	// 주민번호 길이
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
				<FONT size="3" color="#000000"><B>약관 동의</B></FONT>
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
					<INPUT type="radio" name="agreeYn" checked> 동의합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<INPUT type="radio" name="agreeYn"> 동의하지 않습니다.
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
										<TD width="100" align="right">이 름</TD>
										<TD><INPUT type="text" name="name" id="name"></TD>
									</TR>
									<TR>
										<TD width="100" align="right">주민등록번호</TD>
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