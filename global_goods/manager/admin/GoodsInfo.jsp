<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		
		ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");
		Hashtable itemTable = (Hashtable)ItemSelectList.get(0);
		String maincategory = (String)itemTable.get("MAIN_CATEGORY");
			

		System.out.println(maincategory);
		//Hashtable itemTable = (Hashtable)ItemSelectList.get(i);

		
%>
<SCRIPT language="JavaScript">

//상품 등록
	function updateAction()
	{
		alert("action");
		var f = document.itemForm;
		

		f.submit();
		
	}
/*
	// 정보확인
	function checkAction()
	{
		document.location.href="/commonServlet.mo";
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
*/
	// 선택방법 변경
	function selectApply(code)
	{
		
		alert(code);
		
		document.location.href="/managerItemServlet.mo?func=managerItem_001&maincategory="+code;
		
	}
	

	
	// 상세정보 페이지 가기
	function goDetailInfo(seq)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_002&seq="+seq;
	}
</SCRIPT>


<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>관리자페이지</font>


<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#7682EB" width="550">
		<TR>
			<TD align="center" bgcolor="#FFFFFF" width="300" colspan="6">
				<FONT color="blue" size="3"><B>상품등록</B></FONT>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
<%
			String test = "testggggggf";
			String test2 = "dfsfadf";
%>

<FORM name="itemForm" action="/managerOrderServlet.mo">
<INPUT type="hidden" name="func" value="managerOrder_004">
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#7682EB" width="550">
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>대분류선택</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3">식품<INPUT type="radio" value = "F" name="maincategory"  onclick="selectApply('F');" <%if(maincategory.equals("F")){%>checked<%}%>>잡화<INPUT type="radio" name="maincategory" onclick="selectApply('E');" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>중분류선택</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">
			<SELECT name ="middlecategory" >
<%		
		
					for (int i = 0; i<ItemSelectList.size(); i++)
					{
					itemTable = (Hashtable)ItemSelectList.get(i);	
					String middlecategory = (String)itemTable.get("NAME");  ////   middle select 의 분류값이 int 로 되어있기 때문에 임시로 name으로 대체하였다.

%>
					<OPTION value="<%=middlecategory%>" ><%=middlecategory%></OPTION>
				
<%
					}
%>
			</SELECT>
			
			</TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>소분류선택</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="subcategory"><IMG src="/images/button/button_add.gif" style="cursor:hand" ></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>이미지등록</B></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="3"><INPUT type="file" name="upFile" size="40"></TD>
		</TR>

		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>이름등록</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="itemtext"></TD>
		</TR>
		
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>가격등록</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="price"></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>원산지등록</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="country"></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>사이즈등록</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="size"></TD>
		</TR>
		
		<TR bgcolor="#99ffcc" align="center">
			<TD width="100"><B>부가설명</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="comment"></TD>
		</TR>

	</FORM>

	</TABLE>
	
	
	<TABLE cellspacing="1" cellpadding="3" width="750" >
		<TR><TD height="5"></TD></TR>
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_ok.gif" border="0" onclick="updateAction();" style="cursor:hand" align="absmiddle">
			</TD>
			<TD align="center">
				<IMG src="/images/button/but_ok.gif" border="0" onclick="checkAction();" style="cursor:hand" align="absmiddle">
			</TD>
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