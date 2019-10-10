<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList shoppingCartList = (ArrayList)outputTable.get("shoppingCartList");
%>

<SCRIPT>
	//결재금액 계산
	function resumePrice()
	{
		var f = document.goodsPageForm;
		var amount = f.count.value;
		var price = $('#price').text();
		var inventory = $('#inventory').text();

		price = deleteComma(price);
/*
		재고보다 주문수량이 많으면 얼럿띄움
		if (amount > inventory)
		{
			alert("재고가 부족합니다. 재고를 확인해주세요.");
			f.count.value = inventory;
			return false;
		}
*/
		var totalCash = price * amount;
		$('#totalPrice').text(insertComma(totalCash));
		$('#price').text(insertComma(price));
	}
	function deleteAction(code)
	{
	//	var f = document.shoppingCart;
	//	f.code.value = code;
		
		document.location.href="/goodsServlet.mo?func=goods_006&code="+code;
	}
	function buyAction()
	{
		//체크박스의 갯수를 변수에 담는다.
		
		var f = document.shoppingCart;
		var chklen = f.checkItem.length;
		
		var flag = true;
		
		/**********물품이 1개 일때 에러남...*************/
		//수정수정 체크


		
		//체크박스 갯수만큼 for 문을 돌려 체크된 넘의 value값을 가져온다.
		for(var i = 0; i<chklen; i++)
		{
			var f = document.shoppingCart;

			var amount = f.amount[i].value;
			
			var code = document.getElementsByName("checkItem")[i].value;
			document.getElementsByName("checkItem")[i].value = amount + code;

			if(document.getElementsByName("checkItem")[i].checked == true)
			{
				flag = true;
				//alert(flag);
			}
		}
		if (flag)
		{
			f.func.value = "goods_003";
			f.submit();
		}
		else
		{
			alert("구매하실 상품을 선택해 주세요.");
			return false;
		}
	}
	//체크박스 전체선택
	function allCheck()
	{
		var f = document.shoppingCart;
		var check = true;
		if (f.selectAll.checked ==true)
		{
			check = true;
		}
		else
		{
			check = false;
		}
		var chklen = f.checkItem.length;

		// 체크박스 갯수만큼 for 문을 돌려 체크된 넘의 value값을 가져온다.
		for(i=0; i<chklen; i++)
		{
			f.checkItem[i].checked = check;
		}
	}

	//상품 상세보기
	function viewAction(code)
	{
		document.location.href = "/goodsServlet.mo?func=goods_002&code="+code;
	}
</SCRIPT>
<div><!-- 관심상품 화면 상단 바 -->
	<img src="/images/cart_wish/t_cart.png">
</div>
<span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>장바구니
<table border="0" cellspacing="0" cellpadding="0">
	<tr><td colspan="2" height="20"></td></tr>
	<tr> 
		<td width="10"><img src="/images/common/bul_02_01.gif"></td>
		<td class="font16_title"><font color="333333"><B>장바구니</B></font></td>
	</tr>
</table>
<hr color="#eeeeee" noshade>


<div id="cartWrap">
<TABLE>
	<TR>
		<TD>
			<TABLE width="800" cellspacing="0" >
				<FORM name="shoppingCart" method="POST" action="goodsServlet.mo">
				<INPUT type="hidden" name="from" value="cart_list">
				<INPUT type="hidden" name = "func" value="goods_003">
				<TR>
					<TD width="30px" bgcolor="#eeeeee" height= "40px"  style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0;"><INPUT type="checkbox" name="selectAll" id="selectAll" onclick="allCheck();" checked></TD>
					<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0">상품 이미지</TD>
					<TD width="200px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0">상품명</TD>
					<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0">수량</TD>
					<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0">단품 가격</TD>
					<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0">구매 금액</TD>
					<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0">삭제</TD>
				</TR>
<%
	if (shoppingCartList.size() == 0)
	{
%>
		<TR>
			<TD colspan="7" align="center" valign="middle" height="50"> 장바구니에 등록된 물품이 없습니다.</TD>
		</TR>
<%
	}
	else
	{

		int wholPrice = 0;
		for (int i = 0; i < shoppingCartList.size(); i++)
		{
			Hashtable goodsTable = (Hashtable)shoppingCartList.get(i);

			String id = (String)goodsTable.get("MEMBER_ID");
			String code = (String)goodsTable.get("GOODS_CODE");
			String input_amount = (String)goodsTable.get("SELECT_GOODS_AMOUNT");//입력한 양
			String amount = (String)goodsTable.get("GOODS_AMOUNT");//재고양
			String parPrice = (String)goodsTable.get("PAR_PRICE");//판매가


			ArrayList img_list = (ArrayList)goodsTable.get("FILE_LIST");
			Hashtable img_table = (Hashtable)img_list.get(0);

			String imgPath = (String)img_table.get("PATH");
			String imgName = (String)img_table.get("SAVE_NAME");
			String img = imgPath + "/" + imgName;
			System.out.println("img : "+img);
			img = "/"+img.substring(img.indexOf("upfile"));
			System.out.println("img 주소 : "+img);
			String goods_name = (String)goodsTable.get("GOODS_NAME");
			
			String amountKo = "";
			String country = (String)goodsTable.get("COUNTRY");
			String comment = (String)goodsTable.get("GOODS_COMMENT");

			int totalPrice = Integer.parseInt(input_amount) * Integer.parseInt(parPrice);
			wholPrice = wholPrice + totalPrice;
			if (amount.equals("0"))
			{
				amountKo = "품절";
			}
			else
			{
				amountKo = "재고있음";
			}
%>				
				
					<INPUT type="hidden" name="id" value="<%=id%>">
					<INPUT type="hidden" name="code" value="<%=code%>">
					<INPUT type="hidden" name="input_amount" value="<%=input_amount%>">
					<INPUT type="hidden" name="img" value="<%=img%>">
				
				<!-- <TR>
					<TD align="center"><INPUT class="checkboxSelect" type="checkbox" name="checkItem" value="<%=i%>" checked></TD>
					<TD><img src=<%=img%> width="100" height="100" onclick="viewAction('<%=code%>')"></TD>
					<TD><a href="javascript:viewAction('<%=code%>')"><%=goods_name%></a></TD>
					<TD><INPUT type="text" name="amount<%=i%>" value = <%=input_amount%> size="1"></TD>
					<TD><SPAN id="parPrice<%=i%>"><%=parPrice%></SPAN></TD>
					<TD><SPAN id="totalPrice<%=i%>"><%=totalPrice%></SPAN></TD>
					<TD align="center"><a href="JavaScript:deleteAction('<%=code%>');"><img src="/images/cart_wish/cart_bt_seldel.gif" border="0"></a></TD>
				</TR> -->
				<TR>
					<TD><INPUT type="checkbox" name="checkItem" value="<%=code%>" checked></TD>
					<TD><img src=<%=img%> width="100" height="100"></TD>
					<TD><%=goods_name%></TD>
					<TD><INPUT type="text" name="amount" value = <%=input_amount%> size="1"></TD>
					<TD><SPAN id="parPrice<%=i%>"><%=parPrice%></SPAN></TD>
					<TD><SPAN id="totalPrice<%=i%>"><%=totalPrice%></SPAN></TD>
					<TD><INPUT type="button" value="delete" onclick="deleteAction('<%=code%>');"></TD>
				</TR>
			
			<TR bgcolor="#eeeeee">
				<TD colspan="7" height="5"></TD>
			</TR>
<%
		}
%>
				<TR bgcolor="#eeeeee">
					<TD width="700" colspan="6"></TD>
					<TD width="100"><B>총 금액 : <%=wholPrice%></B></TD>
				</TR>
				<TR>
					<TD colspan="7" align="right">
						<a href="/commonServlet.mo"><img src="/images/cart_wish/cart_bt_goshopping.gif" border="0"></a>
						<a href="JavaScript:buyAction();"><img src="/images/cart_wish/cart_bt_order.gif" border="0"></a>
					</TD>
				</TR>
				<TR bgcolor="#eeeeee">
					<TD colspan="7" height="10"></TD>
				</TR>
<%
	}
%>				
					
				</FORM>
			</TABLE>
		</TD>
	</TR>
</TABLE>
</div>