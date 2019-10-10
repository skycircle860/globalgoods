<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		System.out.println("test sub jsp========");
		ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");
		ArrayList SubSelectList =(ArrayList)outputTable.get("SubSelectList");
		
	
		String maincategory = (String)outputTable.get("maincategory");
		
	
		Hashtable itemTable = new Hashtable();
		Hashtable subTable =new Hashtable();

		String middlecategory =(String)outputTable.get("middlecategory");
		String from = "S";

		System.out.println("middlecategory1 ===="+middlecategory);
		
		if(ItemSelectList.size() !=0)
		{
			
		    itemTable = (Hashtable)ItemSelectList.get(0);
			maincategory = (String)itemTable.get("MAIN_CATEGORY");

		}
		
	

		if(SubSelectList.size() !=0)
		{
			subTable = (Hashtable)ItemSelectList.get(0);
			

			System.out.println("middlecategory2 ===="+middlecategory);
		}



		
		

		System.out.println("test sub jsp========");
		
		//Hashtable itemTable = (Hashtable)ItemSelectList.get(i);

		
%>


<style type="text/css">
  td
  {
	 height:25px;
  }

 </style>
<SCRIPT language="JavaScript">




	
	function goUseYn(code, yn)
	{
		var alertStr = "선택하신 서브카테고리를 사용하지 못하게 하시겠습니까?";
		if(yn=='Y')
		{
			alertStr = "선택하신 서브카테고리를 사용 하시겠습니까?";
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerOrderServlet.mo?func=managerOrder_015&yn="+yn+"&code="+code;
		}
	}


	function addSubCategoryAction()
	{
		//alert("addcategory");
		var f= document.itemForm;
		var middlecategory = f.middlecategory.value;
		
		//alert(middlecategory);
		
		var subcategory = f.subcategory.value;
		
		if (middlecategory.length < 3)
		{
			alert("중분류를 반드시 선택해 주세요!");
			return false;
		}
		if (subcategory.length == 0)
		{
			alert("소분류 이름을 입력해 주세요!");
			return false;
		}

		document.location.href="/managerOrderServlet.mo?func=managerOrder_011&subcategory="+subcategory +"&middlecategory="+middlecategory+"&maincategory=<%=maincategory%>";
	}




	// 대분류 변경
	function selectApply(code)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_008&maincategory="+code;
		
	}

	//중분류변경

	function selectApply2()
	{
		//alert("apply2");
	

		var f = document.itemForm;
		var test = f.middlecategory.value;
		//alert(test);
		f.submit();


	}


	

	
	// 상세정보 페이지 가기
	function goDetailInfo(code)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_017&code="+code;
	}
</SCRIPT>
<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">현재 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>관리자페이지</font>
<CENTER>
	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="550">
		<TR>
			<TD align="center" bgcolor="#74c900" width="300" colspan="6">
				<FONT color="white" size="3"><B>카테고리 추가/제거</B></FONT>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>


<FORM name="itemForm" action="/managerOrderServlet.mo">
	<INPUT type="hidden" name="func" value="managerOrder_008">
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="550">
		<TR bgcolor="#74c900" align="center" width="100">
			<TD ><font color="white"><B>대분류선택</B></font></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="4">식품<INPUT type="radio" value = "F" name="maincategory"  onclick="selectApply('F');" <%if(maincategory.equals("F")){%>checked<%}%>>잡화<INPUT type="radio" name="maincategory" onclick="selectApply('E');" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD ><font color="white"><B>중분류선택</B></font></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="4">
		
	<!--------------------------------카테고리--------------------------------->
	<!--------------------------------카테고리--------------------------------->
	<!--------------------------------카테고리--------------------------------->
	<!--------------------------------카테고리--------------------------------->
	<!--------------------------------카테고리--------------------------------->

			<SELECT name ="middlecategory" onchange="selectApply2();" >
			<OPTION value="">---카테고리---</OPTION>
<%		
				
					System.out.println("middlecategory3 ===="+middlecategory);
					for (int i = 0; i<ItemSelectList.size(); i++)
				   {
					
					itemTable = (Hashtable)ItemSelectList.get(i);	
					String middlename = (String)itemTable.get("NAME");
					
					String code = (String)itemTable.get("CODE");
					System.out.println("code==="+code);
				
					
							/////code = 중분류의 번호. middlecategory = subcategory의 middlecategory 번호.
%>						
					<OPTION value="<%=code%>" <%if(code.equals(middlecategory) ){%>selected<%}%>><%=middlename%></OPTION>
				
<%
					}
%>
			</SELECT>
		
			</TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD ><font color="white"><B>소분류추가</B></font></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="4">
			<INPUT type="text" name="subcategory" >
			<IMG src="/images/button/button_add.gif" onclick="addSubCategoryAction();" align="absmiddle">
			</TD>
			
		</TR>
	</TABLE>
	
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
	
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="550">
		<TR bgcolor="#74c900" align="center">
			<TD ><font color="white"><B>CODE</B></font></TD>
			<TD ><font color="white"><B>NAME</B></font></TD>
			<TD ><font color="white"><B>사용여부</B></font></TD>
			<TD ><font color="white"><B>기능</B></font></TD>
		</TR>
<%
	if(SubSelectList.size()==0)
	{
%>
		<TR><TD align="center" bgcolor="#FFFFFF" colspan="6"><B>설정된 직업 정보가 없습니다.</B></TD></TR>
<%
	}

	System.out.println("jsp if확인");
                                                       
	if(SubSelectList.size() !=0)                           ////////////////////        카테고리 리스트 출력
	{
		for(int i=0; i<SubSelectList.size(); i++)
		{

			
			subTable = (Hashtable)SubSelectList.get(i);
			String subcode = (String)subTable.get("CODE");
			String name = (String)subTable.get("NAME");
			String useYn = (String)subTable.get("USEYN");
			//System.out.println("subcode ======="+subcode);	
				
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
				<TD><A href="javascript:goDetailInfo('<%= subcode%>')"><%= subcode%></A></TD>
				<TD><A href="javascript:goDetailInfo('<%= subcode%>')"><%= name%></A></TD>
				<TD><B><%= useKor%></B></TD>
				<TD>
					<IMG src="/images/button/sbut_update.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUpdate('<%= subcode%>')">
	<%
			if(useYn.equals("Y"))
			{
	%>
					<IMG src="/images/button/sbut_delete.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= subcode%>', 'N');">
	<%
			}
			else
			{
	%>
					<IMG src="/images/button/sbut_use.gif" align="absmiddle" border="0" style="cursor:hand" onClick="goUseYn('<%= subcode%>', 'Y');">
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
