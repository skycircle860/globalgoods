<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
		System.out.println("test sub jsp========");
		ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");
		ArrayList SubSelectList =(ArrayList)outputTable.get("SubSelectList");

			
		Hashtable subTable =new Hashtable();
		Hashtable itemTable = new Hashtable();

		String maincategory = (String)outputTable.get("maincategory");
		
		String middlecategory =(String)outputTable.get("middlecategory");
	
		System.out.println("middlecategory1 ===="+middlecategory);
		String code ="";
		if(ItemSelectList.size() !=0)
		{
			
		    itemTable = (Hashtable)ItemSelectList.get(0);
			maincategory = (String)itemTable.get("MAIN_CATEGORY");

		}

%>
<style type="text/css">
td
  {
	 height:25px;
	 color:white;
  }


 </style>
<SCRIPT language="JavaScript">

//상품 등록
	function updateAction()
	{


		alert("action");

		var f = document.itemForm;
		var middlecategory = f.middlecategory.value;
		var subcategory = f.subcategory.value;
		var image1 = f.upFile1.value;
		var image2 = f.upFile2.value;
		var image3 = f.upFile3.value;
		var name = f.name.value;
		var orgPrice = f.orgPrice.value;
		var parPrice = f.parPrice.value;
		var country = f.country.value;
		var company = f.company.value;
		var goodsComment = f.goodsComment.value;
		var quantity = f.quantity.value;
		var goodsAmount = f.goodsAmount.value;
		
		if (middlecategory.length < 3)
		{
			window.alert("중분류를 선택해주세요!");
			return false;
		}
		if (subcategory.length < 3)
		{
			window.alert("소분류를 선택해주세요!");
			return false;
		}
		if (image1 == null && image2 == null && image3 == null)
		{
			window.alert("이미지를 등록하세요.");
			return false;
		}
		if (name.length == 0)
		{
			window.alert("상품 이름을 입력해주세요");
			return false;
		}
		if (orgPrice*0 != 0)
		{
			window.alert("상품 원가는 숫자로 입력해주세요");
		}
		if (orgPrice.length == 0)
		{
			window.alert("상품 원가를 입력해주세요");
			return false;
		}
		if (parPrice*0 != 0)
		{
			window.alert("상품 판매가는 숫자로 입력해주세요");
		}
		if (parPrice.length == 0)
		{
			window.alert("상품 판매가를 입력해주세요");
			return false;
		}
		if (country.length == 0)
		{
			window.alert("상품 원산지를 입력해주세요");
			return false;
		}
		if (company.length == 0)
		{
			window.alert("상품 제조사를 입력해주세요");
			return false;
		}
		if (goodsComment.length == 0)
		{
			f.goodsComment.value = "empty";
		}
		if (quantity.length == 0)
		{
			window.alert("상품 내용량을 입력해주세요");
			return false;
		}
		if (goodsAmount*0 != 0)
		{
			window.alert("상품 수량은 숫자로 입력해주세요");
			return false;
		}
		if (goodsAmount.length >3)
		{
			window.alert("상품 수량은 3자리까지만 입력해주세요");
			return false;
		}

		
		f.submit();
		
	}
	function listAction()
	{
		document.location.href="/superManagerServlet.mo?func=superMan_001";
	}



	// 대분류 변경
	function selectApply(code)
	{
		document.location.href="/managerOrderServlet.mo?func=managerOrder_003&maincategory="+code;
	}

	//중분류변경
	function selectApply2()
	{
		var f = document.itemForm;
		var test = f.middlecategory.value;
		//alert(test);
		 document.location.href="/managerOrderServlet.mo?func=managerOrder_003&middlecategory="+test+"&maincategory=<%=maincategory%>";
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
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="550">
		<TR>
			<TD align="center" bgcolor="#74c900" width="300" colspan="6">
				<FONT color="white" size="3"><B>상품등록</B>
			</TD>
		
		</TR>
		
	</TABLE>


	<TABLE cellspacing="0" cellpadding="0">
		<TR><TD height="25"></TD></TR>
	</TABLE>


<FORM name="itemForm" action="/managerOrderServlet.mo"   enctype="multipart/form-data" method="post"><!-- post-->
<INPUT type="hidden" name="func" value="managerOrder_004">
<INPUT type="hidden" name="getFileYn" value="Y">
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#a0c0cb" width="550">
		<TR bgcolor="#74c900" align="center">
			<TD width="100" height="30"><B>대분류선택</B></TD>
			<TD bgcolor="#FFFFFF" width="100" align="left" colspan="3"><font color="black">식품<INPUT type="radio" value = "F" name="maincategory"  onclick="selectApply('F');" <%if(maincategory.equals("F")){%>checked<%}%>><font color="black">잡화<INPUT type="radio" name="maincategory" onclick="selectApply('E');" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100" height="30"><B>중분류선택</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">
			<SELECT name ="middlecategory" onchange="selectApply2();" >
			<OPTION value="">---카테고리---</OPTION>
<%		
				
					System.out.println("middlecategory3 ===="+middlecategory);
					for (int i = 0; i<ItemSelectList.size(); i++)
				   {
					
					itemTable = (Hashtable)ItemSelectList.get(i);	
					String middlename = (String)itemTable.get("NAME");
					
					 code = (String)itemTable.get("CODE");
					System.out.println("code==="+code);
				
					
							/////code = 중분류의 번호. middlecategory = subcategory의 middlecategory 번호.
%>						
					<OPTION value="<%=code%>" <%if(code.equals(middlecategory)){%>selected<%}%>><%=middlename%></OPTION>
				
<%
					}
%>
			</SELECT>
			
			</TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100" ><B>소분류선택</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3">
			<SELECT name ="subcategory" >
			<OPTION value="">---카테고리---</OPTION>
<%		
		
					for (int i = 0; i<SubSelectList.size(); i++)
					{
					 subTable = (Hashtable)SubSelectList.get(i);	
					String subname = (String)subTable.get("NAME");  ////   middle select 의 분류값이 int 로 되어있기 때문에 임시로 name으로 대체하였다.
					String subcode = (String)subTable.get("CODE");
%>
					<OPTION value="<%=subcode%>" ><%=subname%></OPTION>
				
<%
					}
%>
			</SELECT>
		
		
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>이미지등록</B></TD>
			<TD bgcolor="#FFFFFF"  align="left" colspan="3">
				<INPUT type="file" name="upFile1" size="40">
				<INPUT type="file" name="upFile2" size="40">
				<INPUT type="file" name="upFile3" size="40">
			</TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>물품이름</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="name"></TD>
		</TR>
		
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>물품원가</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="orgPrice"></TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>물품 판매가</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="parPrice"></TD>
		</TR>
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>원산지</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="country"></TD>
		</TR>
	
		
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>제조사</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="company"></TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>물품 부가설명</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="goodsComment"></TD>
		</TR>

		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>물품 내용량</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="quantity"></TD>
		</TR>
		<TR bgcolor="#74c900" align="center">
			<TD width="100"><B>물품 수량</B></TD>
			<TD bgcolor="#FFFFFF" width="300" align="left" colspan="3"><INPUT type="text" name="goodsAmount"></TD>
		</TR>



	</TABLE>
</FORM>
	
	
	<TABLE cellspacing="1" cellpadding="3" width="750" >
		<TR><TD height="5"></TD></TR>
		<TR>
			<TD align="center">
				<IMG src="/images/button/Update.png" border="0" onclick="updateAction();" style="cursor:hand" align="absmiddle">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<IMG src="/images/button/List.png" border="0" onclick="listAction();" style="cursor:hand" align="absmiddle">
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