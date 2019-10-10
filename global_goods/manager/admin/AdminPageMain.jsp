<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>


<SCRIPT language="JavaScript">
/*
	// 정보확인
	function checkAction()
	{
		document.location.href="/commonServlet.mo";
	}


	// 취미 수정 페이지 가기
	function goUpdate(code)
	{
		document.location.href='/managerHobbyServlet.mo?func=managerHobby_004&from=list&code='+code;
	}

	// 취미 사용 or 삭제 하기
	function goUseYn(code, yn)
	{
		var alertStr = "선택하신 취미를 사용하지 못하게 하시겠습니까?";
		if(yn=='Y')
		{
			alertStr = "선택하신 취미를 사용 하시겠습니까?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerHobbyServlet.mo?func=managerHobby_003&yn="+yn+"&code="+code;
		}
	}

	// 취미 추가
	function goAdd()
	{
		window.open("/common/Progress.jsp", "addHobby", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=400, height=200");
		window.name = "listWin";
		document.addForm.submit();
	}

	// 선택방법 변경
	function selectApply()
	{
		document.selectForm.submit();
	}
	*/

	

</SCRIPT>
<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">현재 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>관리자페이지</font>
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