<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList SubInfoList = (ArrayList)outputTable.get("SubInfoList");
	Hashtable categoryTable = (Hashtable)SubInfoList.get(0);

	//String from = (String)inputTable.get("from");

	String code = (String)categoryTable.get("CODE");
	String useYn = (String)categoryTable.get("USEYN");
	String maincategory = (String)categoryTable.get("MAIN_CATEGORY");
	String middleCategory_name = (String)categoryTable.get("MIDDLE_CATEGORY_NAME");
	String middleCategory_code = (String)categoryTable.get("MIDDLE_CATEGORY");
	String useMainText = "";

	System.out.println("여기는 섭카테고리 업뎃 code : "+code);

	if(maincategory.equals("F"))
	{
		useMainText ="식품";
	}
	else
	{
		useMainText="잡화";
	}

	
	
	String useKor = "사용중";
	if(useYn.equals("N"))
	{
		useKor = "미사용";
	}
%>

<style type="text/css">
  td
  {
	 height:25px;
  }

 </style>

<SCRIPT language="JavaScript">
	// 직업 목록 페이지 가기
	function goList()
	{
		document.location.href="/managerHobbyServlet.mo?func=managerHobby_001";
	}

	// 직업 수정 취소 버튼
	function cancelAction()
	{
		alert("<%=code%>");
		document.location.href="/managerOrderServlet.mo?func=managerOrder_017&code=<%=code%>";
	}

	// 직업 수정
	function updateAction()
	{
		var f = document.updateForm;
		if(trim(f.name.value)=="")
		{
			window.alert("직업의 이름을 입력하세요.");
			f.name.select();
			return false;
		}

		alert("submit 전");
		f.name.value = trim(f.name.value);
		f.submit();
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
	<TABLE cellspacing="1" cellpadding="5" bgcolor="#74c900" width="250">
		<TR>
			<TD align="center" bgcolor="#74c900" width="250">
				<FONT color="white" size="3"><B>카테고리 수정</B></FONT></FONT>
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="600">
		<TR>
			<TD align="right">
				<IMG src="/images/button/button_all_list.gif" border="0" onclick="goList();" style="cursor:hand" align="absmiddle" onClick="goList();">
			</TD>
		</TR>
		<TR><TD height="3"></TD></TR>
	</TABLE>
	<TABLE cellspacing="1" cellpadding="4" bgcolor="#74c900" width="600">
		<FORM name="updateForm" method="post" action="/managerOrderServlet.mo" onSubmit="updateAction(); return false;">
			<INPUT type="hidden" name="func" value="managerOrder_016">
			<INPUT type="hidden" name="code" value="<%= code%>">
			
			<TR>
				<TD width="150" bgcolor="#74c900" align="center"><FONT color="white"><B>CODE</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= code%></TD>
			</TR>
			
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>상품 분류</B></FONT></TD>
				<TD bgcolor="#FFFFFF" width="100" align="left">식품<INPUT type="radio" value = "F" name="maincategory" <%if(maincategory.equals("F")){%>checked<%}%>>잡화<INPUT type="radio" name="maincategory" value="E" <%if(maincategory.equals("E")){%>checked<%}%>></TD>
			</TR>

			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>상품 중분류</B></FONT></TD>
				<TD bgcolor="#FFFFFF" width="100" align="left">
				<SELECT name ="middlecategory">
					<OPTION value="blank">---카테고리---</OPTION>
<%
					ArrayList ItemSelectList = (ArrayList)outputTable.get("ItemSelectList");

					for (int i = 0; i<ItemSelectList.size(); i++)
					{
					
						Hashtable itemTable = (Hashtable)ItemSelectList.get(i);	
						String middlename = (String)itemTable.get("NAME");
						
						String middle_code = (String)itemTable.get("CODE");
						System.out.println("middle_code==="+middle_code+"\n"+middleCategory_code);
				
					
						////code = 중분류의 번호. middlecategory = subcategory의 middlecategory 번호.
%>						
						<OPTION value="<%=middle_code%>" <%if(middle_code.equals(middleCategory_code) ){%>selected<%}%>><%=middlename%></OPTION>
				
<%
					}
%>
				</SELECT>
			</TR>
		
			<TR>

				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>NAME</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><INPUT type="text" name="name" value="<%= categoryTable.get("NAME")%>"></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>사용 여부</B></FONT></TD>
				<TD bgcolor="#FFFFFF">
					<SELECT name="yn">
						<OPTION value="Y" <%if(useYn.equals("Y")){%>selected<%}%>>사용</OPTION>
						<OPTION value="N" <%if(useYn.equals("N")){%>selected<%}%>>미사용</OPTION>
					</SELECT>
				</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>작성자 (IP)</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= categoryTable.get("REG_ID")%> (<%= categoryTable.get("REG_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>작성일</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= categoryTable.get("REG_DATE")%></TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>최종 수정자 (IP)</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= categoryTable.get("UPD_ID")%> (<%= categoryTable.get("UPD_IP")%>)</TD>
			</TR>
			<TR>
				<TD bgcolor="#74c900" align="center"><FONT color="white"><B>최종 수정일</B></FONT></TD>
				<TD bgcolor="#FFFFFF"><%= categoryTable.get("UPD_DATE")%></TD>
			</TR>
		</FORM>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="5"></TD></TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR>
			<TD align="center">
				<IMG src="/images/button/but_update.gif" border="0" align="absmiddle" alt="수정" style="cursor:hand" onClick="updateAction();">
				&nbsp;&nbsp;
				<IMG src="/images/button/but_cancel1.gif" border="0" align="absmiddle" alt="취소" style="cursor:hand" onClick="cancelAction();">
			</TD>
		</TR>
	</TABLE>
	<TABLE cellspacing="0" cellpadding="0" width="700">
		<TR><TD height="20"></TD></TR>
	</TABLE>
</CENTER>