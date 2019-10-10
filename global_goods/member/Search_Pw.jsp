<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />



<SCRIPT>
function searchPwAction()
	{
		var f = document.pwSearch;
		if (f.id.value =="")
		{
			window.alert("아이디를 입력해주세요.");
			f.id.focus();
			return false;
		}
		if (f.name.value =="")
		{
			window.alert("이름을 입력해주세요.");
			f.name.focus();
			return false;
		}
		if (f.passQ.value =="000")
		{
			window.alert("질문을 선택해주세요.");
			f.passQ.focus();
			return false;
		}
		if (f.passA.value =="")
		{
			window.alert("질문에 대한 답을 입력해주세요.");
			f.passA.focus();
			return false;
		}
		f.id.value = trim(f.id.value);
		f.name.value = trim(f.name.value);

		window.open("/common/Progress.jsp", "pwSearch", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=350, height=150");

		f.func.value = "member_013";
		f.target = "pwSearch";
		f.submit();
	}
</SCRIPT>

<div><!-- 비밀번호찾기 화면 상단 바 -->
	<img src="/images/member/t_find_pass.png">
</div>
<span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>><A href="/memberServlet.mo?func=member_004">로그인</A>>비밀번호찾기
<table border="0" cellspacing="0" cellpadding="0">
	<tr><td colspan="2" height="20"></td></tr>
	<tr> 
		<td width="10"><img src="/images/common/bul_02_01.gif"></td>
		<td class="font16_title"><font color="333333"><B>비밀번호 찾기</B></font></td>
	</tr>
</table>
<hr color="#eeeeee" noshade>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD align="center" bgcolor="#FFFFFF" height="20"></TD></TR>
	</TABLE>

<div class="nomal_radius searchIdPwDiv">
<table cellspacing="0" cellpadding="10" border="0">
	<form name="pwSearch" method="post" action="/memberServlet.mo">
	<INPUT type="hidden" name="func" value="member_013">
		<tr>
			<td align="left">
				<img src="/images/common/5.gif">&nbsp;<B>비밀번호 찾기 필수정보 입력</B>
			</td>
		</tr>
		<tr>
			<td colspan="2">아이디 : <input type="text" name="id"></td>
		</tr>
		<tr>
			<td colspan="2">이&nbsp;&nbsp;&nbsp;름 : <input type="text" name="name"></td>
		</tr>
		<tr>
			<td colspan="2">비밀번호 질문 : 
				<SELECT name="passQ">
					<OPTION value="000">-----------------선  택------------------</OPTION>
				<%
					ArrayList passQList = (ArrayList)outputTable.get("passQList");
					for(int i = 0 ; i<passQList.size(); i++)
					{
						Hashtable passQTable = (Hashtable)passQList.get(i);
						String code = (String)passQTable.get("CODE");
						String passQ = (String)passQTable.get("PASS_Q");
				%>
					<OPTION value="<%=code%>"><%=passQ%></OPTION>
				<%
					}
				%>
				</SELECT>
			</td>
		</tr>
		<tr>
			<td colspan="2">비밀번호 &nbsp;&nbsp;&nbsp;답 : <INPUT type="text" name="passA" maxlength="40" size="44"></td>
		</tr>
	</form>
</table>
</div>
<table>
	<tr>
		<td align="right">
			<IMG src="/images/common/mem_bt_cancel.gif" border="0" onclick="document.location.href='memberServlet.mo?func=member_004'" style="cursor:hand" align="absmiddle">
		</td>
		<td width="30"></td>
		<td align="left">
			<IMG src="/images/common/mem_bt_ok.gif" border="0" onclick="searchPwAction();" style="cursor:hand" align="absmiddle">
		</td>
	</tr>
</table>