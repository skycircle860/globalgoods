<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList interestList = (ArrayList)outputTable.get("interestList");

	ArrayList userInfoList = (ArrayList)outputTable.get("userInfoList");
	Hashtable userInfoTable = (Hashtable)userInfoList.get(0);
	String id = (String)userInfoTable.get("ID");
	String name = (String)userInfoTable.get("NAME");
	String passQ_code = (String)userInfoTable.get("PASS_Q");
	String passA = (String)userInfoTable.get("PASS_A");
	String jumin1 = (String)userInfoTable.get("JUMIN1");
	String home1 = (String)userInfoTable.get("HOME1");
	String home2 = (String)userInfoTable.get("HOME2");
	String home3 = (String)userInfoTable.get("HOME3");
	String office1 = (String)userInfoTable.get("OFFICE1");
	String office2 = (String)userInfoTable.get("OFFICE2");
	String office3 = (String)userInfoTable.get("OFFICE3");
	String mobile1 = (String)userInfoTable.get("MOBILE1");
	String mobile2 = (String)userInfoTable.get("MOBILE2");
	String mobile3 = (String)userInfoTable.get("MOBILE3");
	String zipCode1 = (String)userInfoTable.get("ZIPCODE1");
	String zipCode2 = (String)userInfoTable.get("ZIPCODE2");
	String addr1 = (String)userInfoTable.get("ADDR1");
	String addr2 = (String)userInfoTable.get("ADDR2");
	String email = (String)userInfoTable.get("EMAIL");
	String interest = (String)userInfoTable.get("INTEREST");
	
%>

<style type="text/css">
  .RB{
 
   border-top: 1px solid #e4e4e4;
   border-bottom:1px solid #e4e4e4;
  }

 </style>

<SCRIPT language="JavaScript">
	// 정보확인
	function checkAction()
	{
		document.location.href="/commonServlet.mo";
	}

	// 정보수정 페이지 가기
	function goUpdate()
	{
		document.location.href="/memberServlet.mo?func=member_008";
	}
	//회원탈퇴
	function leaveAction()
	{
		if (confirm("정말 탈퇴하시겠습니까?"))
		{
			document.location.href="/memberServlet.mo?func=member_010";
		}
	}
</SCRIPT>

<div><!-- 내정보 화면 상단 바 -->
	<img src="/images/member/t_mypage.png">
</div>
<span style="margin-left:30px;">현재 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>마이페이지
<table border="0" cellspacing="0" cellpadding="0">
	<tr><td colspan="2" height="20"></td></tr>
	<tr> 
		<td width="10"><img src="/images/common/bul_02_01.gif"></td>
		<td class="font16_title"><font color="333333">My Page</font></td>
	</tr>
</table>
<hr color="#f9f9f9" noshade>

<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<BR>
	<TABLE cellspacing="5" cellpadding="5" bgcolor="#f9f9f9" width="700" style="border: 1px solid #c0c0c0;" align="center">
			<TR>
				<TD width="100" bgcolor="#f9f9f9" align="left" class="RB" height="40"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;아이디</font></TD>
				<TD bgcolor="#FFFFFF" colspan="3"><%= id%></TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left" height="40"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인시 질문</TD>
				<TD bgcolor="#FFFFFF" colspan="3">
					<%
						ArrayList passQList = (ArrayList)outputTable.get("passQList");
						for(int i = 0 ; i<passQList.size(); i++)
						{
							Hashtable passQTable = (Hashtable)passQList.get(i);
							String code = (String)passQTable.get("CODE");
							String passQ = (String)passQTable.get("PASS_Q");
							if(code.equals(passQ_code))
							{
								%>
									<%=passQ%>
								<%
							}
						}
					%>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left" class="RB" height="40"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인시 답변</TD>
				<TD bgcolor="#FFFFFF" width="300" colspan="3"><%=passA%></TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left" height="40"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;이 름</TD>
				<TD bgcolor="#FFFFFF" colspan="3"><%= name%></TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left" class="RB"  height="40"><font color="gray" height="40">&nbsp;&nbsp;&nbsp;&nbsp;주민등록번호</TD>
				<TD bgcolor="#FFFFFF" colspan="3"><%= jumin1%> - *******</TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left" height="40"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;집 전화</TD>
				<TD bgcolor="#FFFFFF" colspan="3">
<%
	if(!home1.equals("000"))
	{
%>
					<%= home1%> - <%= home2%> - <%= home3%>
<%
	}
%>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left" class="RB" height="40"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;직장 전화</TD>
				<TD bgcolor="#FFFFFF" colspan="3">
<%
	if(!office1.equals("000"))
	{
%>
					<%= office1%> - <%= office2%> - <%= office3%>
<%
	}
%>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left" height="40"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;휴대 전화</TD>
				<TD bgcolor="#FFFFFF" colspan="3">
<%
	if(!mobile1.equals("000"))
	{
%>
					<%= mobile1%> - <%= mobile2%> - <%= mobile3%>
<%
	}
%>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left" class="RB" height="40" ><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;주 소</TD>
				<TD bgcolor="#FFFFFF" colspan="3">
					(<%= zipCode1%>-<%= zipCode2%>) <%= addr1%> <%= addr2%>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;이메일</TD>
				<TD bgcolor="#FFFFFF" colspan="3">
<%
	if(!email.equals("empty"))
	{
%>
					<%= email%>
<%
	}
%>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#f9f9f9" align="left" class="RB" height="40"><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;관심 상품</font></TD>
				<TD bgcolor="#FFFFFF" colspan="3">
<%
	int interestCount = 0;
	String interestName = "";
	if(!interest.equals("empty"))
	{
		for(int i=0; i<interestList.size(); i++)
		{
			Hashtable interestTable = (Hashtable)interestList.get(i);
			String code = (String)interestTable.get("CODE");
			if(interest.indexOf(code) != -1)
			{
				interestCount++;
				if(interestCount > 1)
				{
					interestName = interestName + ", ";
				}

				interestName = interestName + interestTable.get("NAME");
			}
		}
	}
	else
	{
		interestName = "<FONT color='red'>미입력</FONT>";
	}
%>
					<%= interestName%>
				</TD>
			</TR>
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="10"></TD></TR>
		<TR>
			<TD align="center">
				<img src="/images/member/mem_bt_edit.gif" onclick="goUpdate();" style="cursor:hand">&nbsp;&nbsp;&nbsp;
				<img src="/images/member/mem_bt_exit.gif" onclick="leaveAction();" style="cursor:hand">&nbsp;&nbsp;&nbsp;
				<img src="/images/common/mem_bt_ok.gif" onclick="checkAction();" style="cursor:hand">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
		<TR>
	</TABLE>
</CENTER>