<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		
		ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");
		Hashtable itemTable = new Hashtable();

		String maincategory = (String)outputTable.get("maincategory");
	
		System.out.println(maincategory);
		if(ItemSelectList.size() !=0)
		{
			
		    itemTable = (Hashtable)ItemSelectList.get(0);
			maincategory = (String)itemTable.get("MAIN_CATEGORY");

		}

	
		

		String from = "M";

		System.out.println("test t ========");
		//Hashtable itemTable = (Hashtable)ItemSelectList.get(i);

		
%>
<style type="text/css">
  td
  {
	 height:20px;
	 color:white;
  }

 </style>

<SCRIPT language="JavaScript">

var categorymain = "";
//상품 등록
	function updateAction()
	{
	
		var f = document.itemForm;
		


		f.submit();
		
	}

	
	function goUseYn(code, yn)
	{
		var alertStr = "선택하신 카테고리를 사용하지 못하게 하시겠습니까?";
		if(yn=='Y')
		{
			alertStr = "선택하신 카테고리를 사용 하시겠습니까?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerOrderServlet.mo?func=managerOrder_007&yn="+yn+"&code="+code+"&maincategory=<%=maincategory%>";
		}
	}



	function addCategoryAction()
	{
		

		var f= document.itemForm;
		var middlecategory = f.middlecategory.value;
		
		if (middlecategory.length == 0)
		{
			alert('중분류명을 반드시 입력해 주세요!');
			return false;
		}
		document.location.href="/managerOrderServlet.mo?func=managerOrder_006&middlecategory="+middlecategory+"&maincategory=<%=maincategory%>";
	}


	// 대분류 변경
	function selectApply(code)
	{
	
		document.location.href="/managerOrderServlet.mo?func=managerOrder_005&maincategory="+code;
		
	}

	
	function goUpdate(code)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_012&code="+code;
	}

	
	// 상세정보 페이지 가기
	function goDetailInfo(code)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_014&code="+code;
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
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="550">
		<TR>
			<TD align="center" bgcolor="#74c900" colspan="6">
				<FONT color="white" size="3"><B>품목 추가 제거</B></FONT>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>

<FORM name="itemForm" action="/managerOrderServlet.mo">
<INPUT type="hidden" name="func" value="managerOrder_004">
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="550">
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>대분류선택</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="4"><FONT color="black">식품</FONT><INPUT type="radio" value = "F" name="maincategory"  onclick="selectApply('F');" <%if(maincategory.equals("F")){%>checked<%}%>><FONT color="black">잡화</FONT><INPUT type="radio" name="maincategory" onclick="selectApply('E');" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>중분류추가</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="4">
			<INPUT type="text" name="middlecategory" >
			<IMG src="/images/button/button_add.gif" onclick="addCategoryAction();" align="absmiddle">
			</TD>
			
		</TR>
	</TABLE>
	
	<TABLE cellspacing="0" cellpadding="0" width="550">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="550" align="center">
		<TR bgcolor="#74c900" align="center">
			<TD width="100" align="center"><B>CODE</B></TD>
			<TD width="100" align="center"><B>NAME</B></TD>
			<TD width="100" align="center"><B>사용여부</B></TD>
			<TD width="100" align="center"><B>기능</B></TD>
		</TR>

	<%
	if(ItemSelectList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><B>설정된 직업 정보가 없습니다.</B></TD></TR>
<%
	}

	else
	{

	for(int i=0; i<ItemSelectList.size(); i++)
	{

		
		 itemTable = (Hashtable)ItemSelectList.get(i);
		String code = (String)itemTable.get("CODE");
		String name = (String)itemTable.get("NAME");
		String useYn = (String)itemTable.get("USEYN");

		String bgcolor = "#FFFFFF";
		if(useYn.equals("N"))
		{
			bgcolor = "#E0E0E0";
		}

		String useKor = "사용중";
		if(useYn.equals("N"))
		{
			useKor = "미사용";
		}
%>
		<TR bgcolor="<%= bgcolor%>" align="center">
			<TD><A href="javascript:goDetailInfo('<%= code%>')"><FONT color="black"><%= code%></FONT></A></TD>
			<TD><A href="javascript:goDetailInfo('<%= code%>')"><FONT color="black"><%= name%></FONT></A></TD>
			<TD><B><FONT color="black"><%= useKor%></FONT></B></TD>
			<TD>
				<IMG src="/images/button/sbut_update.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUpdate('<%= code%>')">
<%
		if(useYn.equals("Y"))
		{
%>
				<IMG src="/images/button/sbut_delete.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= code%>', 'N');">
<%
		}
		else
		{
%>
				<IMG src="/images/button/sbut_use.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= code%>', 'Y');">
<%
		}
%>
			</TD>
		</TR>
<%
	}
	}
%>

	</TABLE>
	</FORM>


	


	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>
<FORM name="addForm" method="post" action="/managerHobbyServlet.mo" target="addHobby">
	<INPUT type="hidden" name="func" value="managerHobby_006">
</FORM>