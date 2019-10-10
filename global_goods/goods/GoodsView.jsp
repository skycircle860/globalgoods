<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList goodsList = (ArrayList)outputTable.get("goodsList");
	Hashtable goodsTable = (Hashtable)goodsList.get(0);

	String id = (String)session.getAttribute("id");
	String code = (String)goodsTable.get("CODE");
	String name = (String)goodsTable.get("NAME");
	String company = (String)goodsTable.get("COMPANY");
	String country = (String)goodsTable.get("COUNTRY");
	String quantity = (String)goodsTable.get("QUANTITY");
	String amount = (String)goodsTable.get("GOODS_AMOUNT");
	String amountKo = amount;
	String goodsComment = (String)goodsTable.get("GOODS_COMMENT");
	String parPrice = (String)goodsTable.get("PAR_PRICE");
	String sc_name = (String)goodsTable.get("SC_NAME");
	String sc_code = (String)goodsTable.get("SC_CODE");
	String mc_name = (String)goodsTable.get("MC_NAME");
	String mc_code = (String)goodsTable.get("MC_CODE");

	System.out.println("상세정보 SUB : "+sc_name+" MIDDLE : "+mc_name);
	
	if (amount.equals("0"))
	{
		amountKo = "품절";
	}
	else
	{
		amountKo = "재고있음";
	}

	String loginYn = "N";
	if(session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		loginYn = "Y";
	}
%>

<!-- <script src="../js/jquery-1.6.js" type="text/javascript"></script>
<script src="../js/jquery.jqzoom-core.js" type="text/javascript"></script>

<link rel="stylesheet" href="../css/jquery.jqzoom.css" type="text/css"> -->

<SCRIPT>
	
		
	//상품 즉시구매페이지 가기
	function goodsBuyAction()
	{
		var f = document.goodsPageForm;
		var amount = f.count.value;

		document.location.href="/goodsServlet.mo?func=goods_010&amount="+amount+"&code=<%=code%>";
	}

	function goList()
	{
		//리스트, 서브리스트, 장바구니, 관심상품에 from 달아놓았음. 이거 나중에 꺼내쓰면됨
		//이동시 전에 보던 페이지로 이동할때 사용
		document.location.href="/goodsServlet.mo?func=goods_001&middleCategory=<%=mc_code%>";
	}
	//장바구니에 상품등록
	function goodsCartAction()
	{
		if ('<%=loginYn%>' == 'N')
		{
			if (confirm("로그인이 필요한 메뉴입니다. \n로그인하시겠습니까?"))
			{
				document.location.href="/memberServlet.mo?func=member_004";
			}
			return false;
		}
		var f = document.goodsPageForm;
		f.func.value= "goods_004";
		f.amount.value=f.count.value;
		f.submit();
	}
	function goodsInterestAction(code)
	{
		if ('<%=loginYn%>' == 'N')
		{
			if (confirm("로그인이 필요한 메뉴입니다. \n로그인하시겠습니까?"))
			{
				document.location.href="/memberServlet.mo?func=member_004";
			}
			return false;
		}
		if(confirm("관심상품에 추가하시겠습니까?"))
		{
			document.location.href="/goodsServlet.mo?func=goods_CDH001&code="+code;
		}
	}
	//관리자 상품수정
	function goodsStatus()
	{
		document.location.href='managerOrderServlet.mo?func=managerOrder_024';
	}

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
	

	$(document).ready(function(){
		
		
		$('#price').text(insertComma("<%=parPrice%>"));
		$('#totalPrice').text(insertComma("<%=parPrice%>"));
		
		
		$('.detail_img_s').find('img').each(function(){
			$(this).hide();
		});
		$('.detail_img_s').find('img').eq(0).show();

		
	});


	function next_pic()
	{
		var container = $('.detail_img_s');
		var img = container.find('img');

		var first = img.eq(0);
		var second = img.eq(1);
		

		if (second.attr('src') != undefined)
		{
		//	$("#img_num").html(''+img.attr('img_num'));
			first.fadeOut().appendTo(container);
			second.fadeIn();
			
		}
	}

	function prev_pic()
	{
		var container = $('.detail_img_s');
		var img = container.find('img');

		var last = $('.detail_img_s img:last');
		var first = img.eq(0);

		if (first.attr('src') != last.attr('src'))
		{
		//	$("#img_num").html(''+img.attr('img_num'));
			first.fadeOut()
			last.prependTo(container).fadeIn();
			
		}
	}
	function submenuAction2(subcode, subname)
	{
		//alert(middleCategory);
		//document.location.href="/goodsServlet.mo?func=goods_001?middleCategory="+middleCategory+"";
		document.location.href="/goodsServlet.mo?func=goods_007&middleCategory=<%=mc_code%>&subcode="+subcode+"&subname="+subname+"";
	}
</SCRIPT>
<div><!-- 리스트 화면 상단 바 -->
	<img src="/images/goodsList/t_details.png">
</div>
<span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>><A href="JavaScript:menuAction('<%=mc_code%>');"><%=mc_name%></A>><A href="JavaScript:submenuAction2('<%=sc_code%>', '<%=sc_name%>');"><%=sc_name%></A></span>	

	<div class="top_radius">&nbsp;&nbsp;<img src="/images/common/bul_02_01.gif" align="absmiddle">&nbsp;&nbsp;<B><%=mc_name%>/<%=sc_name%></B></div>


<FORM name="goodsPageForm" method="GET" action="/goodsServlet.mo">
	<INPUT type="hidden" name="func" value="goods_003">
	<INPUT type="hidden" name="code" value=<%=code%>>
	<INPUT type="hidden" name="name" value=<%=name%>>
	<INPUT type="hidden" name="company" value=<%=company%>>
	<INPUT type="hidden" name="country" value=<%=country%>>
	<INPUT type="hidden" name="quantity" value=<%=quantity%>>
	<INPUT type="hidden" name="amount" value=<%=amount%>>
	<INPUT type="hidden" name="goodsComment" value=<%=goodsComment%>>
	<INPUT type="hidden" name="parPrice" value=<%=parPrice%>>


<DIV id="goods_detail_wrap">
	<div class="detail_img_s">
	<%
		ArrayList goodsImgList = (ArrayList)goodsTable.get("FILE_LIST");
		
		for(int i = 0; i<goodsImgList.size() ; i++)
		{	//System.out.println(goodsImgList.get(i));
			Hashtable goodsImgTable = (Hashtable)goodsImgList.get(i);
			String path = (String)goodsImgTable.get("PATH");
			String saveName = (String)goodsImgTable.get("SAVE_NAME");
			saveName = "/"+saveName;
			path = "/"+path.substring(path.indexOf("upfile"));
			
			System.out.println("이미지경로 : "+path+saveName);
			
	%>
			
			<A href="/goodsServlet.mo?func=goods_kww001&imgSrc=<%=path%>&imgName=<%=saveName%>&name=<%=name%>" target="_blank"><img src="<%=path+saveName%>" img_num="<%=i+1%>" border="0"></A>	
		
	<%
		}
	%>

	</div>
	<div style="margin-top:390px; margin-left:40px; position:absolute;"><font color="#c9c9c9"><h5>이미지를 클릭하시면 원본이미지를 보실수 있습니다!!</h4></font></div>


	<div class="right_arrow" onclick="next_pic();">
		<img src="/images/common/right_arrow.jpg" style="cursor:hand;">
	</div>
	<span id="img_num">
	
	</span>
	<div class="left_arrow" onclick="prev_pic();">
		<img src="/images/common/left_arrow.jpg" style="cursor:hand;">
	</div>
	<DIV id="goods_detail">

		<TABLE cellspacing="0" cellpadding="0" height="410">
			<TR>
				<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0;">
					<img src="/images/common/5.gif" style="margin-left:10px">&nbsp;&nbsp;상품명</TD>
				<TD width="400px"  style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0;">&nbsp;&nbsp;&nbsp;<%=name%></TD>
			</TR>
			<TR>
				<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;">
					<img src="/images/common/5.gif" style="margin-left:10px">&nbsp;&nbsp;제조사</TD>
				<TD width="400px"  style="border-bottom: 1px solid #c0c0c0;">&nbsp;&nbsp;&nbsp;<%=company%></TD>
			</TR>
			<TR>
				<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;">
					<img src="/images/common/5.gif" style="margin-left:10px">&nbsp;&nbsp;원산지</TD>
				<TD width="400px"  style="border-bottom: 1px solid #c0c0c0;">&nbsp;&nbsp;&nbsp;<%=country%></TD>
			</TR>
			<TR>
				<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;">
					<img src="/images/common/5.gif" style="margin-left:10px">&nbsp;&nbsp;내용량</TD>
				<TD width="400px"  style="border-bottom: 1px solid #c0c0c0;">&nbsp;&nbsp;&nbsp;<%=quantity%></TD>
			</TR>
			<TR>
				<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;">
					<img src="/images/common/5.gif" style="margin-left:10px">&nbsp;&nbsp;상품정보</TD>
				<TD width="400px"  style="border-bottom: 1px solid #c0c0c0;"><%=goodsComment%></TD>
			</TR>
			<TR>
				<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;">
					<img src="/images/common/5.gif" style="margin-left:10px">&nbsp;&nbsp;재고</TD>
				<TD width="400px"  style="border-bottom: 1px solid #c0c0c0;"><SPAN id="inventory">&nbsp;&nbsp;&nbsp;<%=amountKo%></SPAN></TD>
			</TR>
			<TR>
				<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;">
					<img src="/images/common/5.gif" style="margin-left:10px">&nbsp;&nbsp;구매수량</TD>
				<TD width="400px"  style="border-bottom: 1px solid #c0c0c0;">&nbsp;&nbsp;&nbsp;<input type="text" name="count" id="count" value="1" size="1" onkeyup="resumePrice();"></TD>
			</TR>
			<TR>
				<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;" >
					<img src="/images/common/5.gif" style="margin-left:10px">&nbsp;&nbsp;가격</TD>
				<TD width="400px"  style="border-bottom: 1px solid #c0c0c0;">&nbsp;&nbsp;&nbsp;<SPAN id="price"></SPAN><SPAN>원</SPAN></TD>
			</TR>
			<TR>
				<TD width="100px" bgcolor="#eeeeee" height= "40px" style="border-bottom: 1px solid #c0c0c0;">
					<img src="/images/common/5.gif" style="margin-left:10px">&nbsp;&nbsp;총 결재금액</TD>
				<TD width="400px"  style="border-bottom: 1px solid #c0c0c0;">&nbsp;&nbsp;&nbsp;<FONT color="red" size="3"><B><SPAN id="totalPrice"></SPAN></B></FONT><SPAN>원</SPAN></TD>
			</TR>
		</TABLE>
	</DIV>
	<DIV id="goodsViewButton">
		<img src="/images/goodsView/bt_cart.png" onclick="goodsCartAction();">
		<img src="/images/goodsView/bt_buy.gif" onclick="goodsBuyAction();">
		<img src="/images/goodsView/bt_wish.png" onclick="goodsInterestAction('<%=code%>');">
		<img src="/images/goodsView/cart_bt_goshopping.gif" height="40" onclick="goList();">
<%
if(session.getAttribute("adminYn")!=null && ((String)session.getAttribute("adminYn")).equals("Y"))
		{
%>
		<input type="button" value="상품관리페이지가기" onclick="goodsStatus()">
<%
		}
%>
	</DIV>
</DIV>
</FORM>
<div align="center" style="margin-top:600px; margin-left:50px; border: 5px #eeeeee solid; padding=10px;">
	<img src="/images/goodsView/bgbinfo.jpg">
</div>