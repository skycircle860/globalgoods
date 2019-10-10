<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java"%>
<%@ page import="support.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />




<SCRIPT>
	function goodsModify(formName)
	{
		var f = eval("document."+formName);
		f.submit();
	}
	// 사용 or 삭제 하기
	function goodsDisp_YnUpdate(code, disp_yn)
	{
		var alertStr = "선택하신 상품을 사용하지 못하게 하시겠습니까?";
		if(disp_yn=='Y')
		{
			alertStr = "선택하신 상품을 사용 하시겠습니까?"; 
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerOrderServlet.mo?func=managerOrder_025&disp_yn="+disp_yn+"&code="+code;
		}
	}
</SCRIPT>

<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>관리자페이지</font>





<TABLE style="margin-left : 50px;" border="0" cellspacing="1" bgcolor="#000000">
	<TR bgcolor="#eeeeee">
		<TD width="50" align="center">
			No.
		</TD>
		<TD width="50">
			이미지
		</TD>
		<TD width="80">
			Code
		</TD>
		<TD width="150">
			이름
		</TD>
		<TD width="50">
			재고
		</TD>
		<TD width="70">
			원가
		</TD>
		<TD width="70">
			판매가
		</TD>
		<TD width="100">
			버튼
		</TD>
	</TR>
<%
	ArrayList ReturnGoodsSimpleList = (ArrayList)outputTable.get("ReturnGoodsSimpleList");

	Hashtable ReturnGoodsSimpleTable = new Hashtable();
	for (int i = 0; i<ReturnGoodsSimpleList.size(); i++)
	{
		ReturnGoodsSimpleTable = (Hashtable)ReturnGoodsSimpleList.get(i);
		
		String sub_category = (String)ReturnGoodsSimpleTable.get("SUB_CATEGORY");
		String main_category = (String)ReturnGoodsSimpleTable.get("MAIN_CATEGORY");
		String middle_category = (String)ReturnGoodsSimpleTable.get("MIDDLE_CATEGORY");
		String rownum = (String)ReturnGoodsSimpleTable.get("ROWNUM");
		String code = (String)ReturnGoodsSimpleTable.get("CODE");
		String name = (String)ReturnGoodsSimpleTable.get("NAME");
		String goods_amount = (String)ReturnGoodsSimpleTable.get("GOODS_AMOUNT");
		String org_price = (String)ReturnGoodsSimpleTable.get("ORG_PRICE");
		String par_price = (String)ReturnGoodsSimpleTable.get("PAR_PRICE");
		ArrayList file_list = (ArrayList)ReturnGoodsSimpleTable.get("FILE_LIST");

		Hashtable imgTable = (Hashtable)file_list.get(0);
		String path = (String)imgTable.get("PATH");
		String save_name = (String)imgTable.get("SAVE_NAME");

		String disp_yn = (String)ReturnGoodsSimpleTable.get("DISP_YN");

		path = path+"/"+save_name;
		path = path.substring(path.indexOf("upfile"));

		
		String bgcolor = "#FFFFFF";

		if(disp_yn.equals("N"))
		{
			bgcolor = "#666666";
		}

%>
<FORM name="goodsItem<%=i%>" action="/managerOrderServlet.mo">
	<INPUT type="hidden" name="func" value="managerOrder_019">
	<INPUT type="hidden" name="subcategory" value="<%=sub_category%>">
	<INPUT type="hidden" name="maincategory" value="<%=main_category%>">
	<INPUT type="hidden" name="middlecategory" value="<%=middle_category%>">
	<INPUT type="hidden" name="code" value="<%=code%>">	
	<INPUT type="hidden" name="disp_yn" value="<%=disp_yn%>">
	<INPUT type="hidden" name="from" value="simpleList">	
</FORM>


	<TR bgcolor="<%= bgcolor%>">
		<TD width="50" align="center">
			<%=i%>
		</TD>
		<TD width="50" align="center">
			<img src="<%=path%>" width="50" height="50">
		</TD>
		<TD width="100" align="center">
			<%=code%>
		</TD>
		<TD width="200">
			&nbsp;&nbsp;&nbsp;<b><%=name%></b>
		</TD>
		<TD width="50" align="center">
			<%=goods_amount%>
		</TD>
		<TD width="70" align="center">
			<%=org_price%>
		</TD>
		<TD width="70" align="center">
			<%=par_price%>
		</TD>
		<TD width="100" align="center">
			<DIV class="button blue small" onclick="goodsModify('goodsItem<%=i%>')">수정</DIV>
<%
		
		if(disp_yn.equals("Y"))//게시판 사용 비사용 토글
		{
%>
			<DIV class="button blue small" onclick="goodsDisp_YnUpdate('<%= code%>', 'N');">삭제</DIV>
<%
		}
		else if(disp_yn.equals("N"))
		{
%>
			<DIV class="button blue small" onclick="goodsDisp_YnUpdate('<%= code%>', 'Y')">사용</DIV>
<%
		}
%>

		</TD>
	</TR>
<%
	}
%>
</TABLE>