<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	ArrayList shoppingCartList = (ArrayList)outputTable.get("shoppingCartList");
	ArrayList userInfoList = (ArrayList)outputTable.get("userInfoList");
	ArrayList bankList = (ArrayList)outputTable.get("bankList");
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

	//주소지의 값이 변경되면 기본주소지와 새주소지 테이블이 뿌려지는 스크립트
	function addrChange()
	{
		var f = document.addrSelect;

		if(document.getElementsByName("shoppingAddress")[0].checked)
		{
			newAddrTable.style.display = "none";
			defaultAddrTable.style.display = "";
			document.shoppingCart.whereInven.value="Y";
		}
		else
		{
			defaultAddrTable.style.display = "none";
			newAddrTable.style.display = "";
			document.shoppingCart.whereInven.value="N";
		}
	}

	//선불과 착불여부를 체크한다.
	function inventoryChange()
	{
		var f = document.addrSelect;
		
		if(document.getElementsByName("inventorySelect")[0].checked)
		{
			inventory.style.display = "";
		}
		else
		{
			inventory.style.display = "none";
		}

		
	}
	

	//결제방법 체크
	function payWayChoice()
	{
		var f = document.payWayForm;
		
		
		if(f.payway[0].checked)
		{
			payCashInfo.style.display = "none";
			payCard.style.display = "";
		}
		else
		{
			payCard.style.display = "none";
			payCashInfo.style.display = "";
		}
	}
	//구매좀하자
	function buyAction()
	{
		//체크박스의 갯수를 변수에 담는다.
		
		var f = document.shoppingCart;

		var pwf = document.payWayForm;

		var daf = document.defaultAddrForm;
		var naf = document.newAddrForm;

		var pbcf = document.payByCardForm;


		var chklen = document.getElementsByName("checkItem").length;

		if (f.comment.value == null)
		{
			f.comment.value = "";
		}

		if (f.cardCheckYn.value == "Y")
		{
			var flag = true;
			//체크박스 갯수만큼 for 문을 돌려 체크된 넘의 value값을 가져온다.
			
			for(var i = 0; i<chklen; i++)
			{
				var amount = document.getElementsByName("amount")[i].value;
				var code = "";

				code = document.getElementsByName("code")[i].value;

				document.getElementsByName("checkItem")[i].value = amount + code;

				if(document.getElementsByName("checkItem")[i].checked == true)
				{
					flag = true;
				}
			}
			if (flag)
			{
				for (var i = 0; i < 2; i++)
				{
					if (document.getElementsByName("payway")[i].checked == true)
					{
						f.whereCash.value = document.getElementsByName("payway")[i].value;
					}
				}
				for (var i = 0; i < 2; i++)
				{
					if (document.getElementsByName("shoppingAddress")[i].checked == true)
					{
						var whereAddr = document.getElementsByName("shoppingAddress")[i].value;
						f.whereAddr.value = whereAddr;
						if (whereAddr == 'defaultAddr')
						{
							f.name.value = daf.name.value;
							f.zipCode1.value = daf.zipCode1.value;
							f.zipCode2.value = daf.zipCode2.value;
							f.addr1.value = daf.addr1.value;
							f.addr2.value = daf.addr2.value;
							f.home1.value = daf.home1.value;
							f.home2.value = daf.home2.value;
							f.home3.value = daf.home3.value;
							f.mobile1.value = daf.mobile1.value;
							f.mobile2.value = daf.mobile2.value;
							f.mobile3.value = daf.mobile3.value;
							f.office1.value = daf.office1.value;
							f.office2.value = daf.office2.value;
							f.office3.value = daf.office3.value;
							f.comment.value = daf.comment.value;
						}
						else if (whereAddr == 'newAddr')
						{
							f.zipCode1.value = naf.zipCode1.value;
							f.zipCode2.value = naf.zipCode2.value;
							f.addr1.value = naf.addr1.value;
							f.addr2.value = naf.addr2.value;
							f.home1.value = naf.home1.value;
							f.home2.value = naf.home2.value;
							f.home3.value = naf.home3.value;
							f.mobile1.value = naf.mobile1.value;
							f.mobile2.value = naf.mobile2.value;
							f.mobile3.value = naf.mobile3.value;
							f.office1.value = naf.office1.value;
							f.office2.value = naf.office2.value;
							f.office3.value = naf.office3.value;
							f.comment.value = naf.comment.value;
						}
					}
					else if (document.getElementsByName("inventorySelect")[i].checked == true)
					{
						f.whereInven.value = document.getElementsByName("inventorySelect")[i].value;
					}
				}
				for (var i = 0; i < 2; i++)
				{
					if (document.getElementsByName("inventorySelect")[i].checked == true)
					{
						f.whereInven.value = document.getElementsByName("inventorySelect")[i].value;
					}
				}

				if (f.cn1.value != pbcf.cn1.value)
				{
					alert("카드 입력정보가 변경되었습니다. 다시 확인해 주시기 바랍니다.");
					cardCheckYn = "N";
					return false;
				}
				else if (f.cn2.value != pbcf.cn2.value)
				{
					alert("카드 입력정보가 변경되었습니다. 다시 확인해 주시기 바랍니다.");
					cardCheckYn = "N";
					return false;
				}
				else if (f.cn3.value != pbcf.cn3.value)
				{
					alert("카드 입력정보가 변경되었습니다. 다시 확인해 주시기 바랍니다.");
					cardCheckYn = "N";
					return false;
				}
				else if (f.cn4.value != pbcf.cn4.value)
				{
					alert("카드 입력정보가 변경되었습니다. 다시 확인해 주시기 바랍니다.");
					cardCheckYn = "N";
					return false;
				}
				else if (f.card_end_month.value != pbcf.card_end_month.value)
				{
					alert("카드 입력정보가 변경되었습니다. 다시 확인해 주시기 바랍니다.");
					cardCheckYn = "N";
					return false;
				}
				else if (f.card_end_year.value != pbcf.card_end_year.value)
				{
					alert("카드 입력정보가 변경되었습니다. 다시 확인해 주시기 바랍니다.");
					cardCheckYn = "N";
					return false;
				}
				else if (f.card_pw.value != pbcf.card_pw.value)
				{
					alert("카드 입력정보가 변경되었습니다. 다시 확인해 주시기 바랍니다.");
					cardCheckYn = "N";
					return false;
				}
				else if (f.card_jumin1.value != pbcf.card_jumin1.value)
				{
					alert("카드 입력정보가 변경되었습니다. 다시 확인해 주시기 바랍니다.");
					cardCheckYn = "N";
					return false;
				}
				else if (f.card_jumin2.value != pbcf.card_jumin2.value)
				{
					alert("카드 입력정보가 변경되었습니다. 다시 확인해 주시기 바랍니다.");
					cardCheckYn = "N";
					return false;
				}

				f.func.value = "goods_008";
				f.submit();
			}
			else
			{
				alert("구매하실 상품을 선택해 주세요.");
				return false;
			}
		}
		else
		{
			alert("카드정보를 입력해 주세요.");
			return false;
		}
	}

	// 카드 검사
	function cardCheckAction()
	{
		var f = document.payByCardForm;

		if(f.cn1.value=="")
		{
			window.alert(" 카드 번호를 입력하세요.");
			return false;
		}
		else if(!isNum(f.cn1.value))
		{
			window.alert("카드번호는 숫자만 입력 가능합니다.");
			f.cn1.select();
			return false;
		}
		else if(f.cn1.value.length!=4)
		{
			window.alert(" 카드번호의 길이를 확인하세요.");
			f.cn1.select();
			return false;
		}
		
		if(f.cn2.value=="")
		{	f.cn1.select();
			window.alert(" 카드 번호를 입력하세요.");
			f.cn2.select();
			return false;
		}
		else if(!isNum(f.cn2.value))
		{
			window.alert("카드번호는 숫자만 입력 가능합니다.");
			f.cn2.select();
			return false;
		}
		else if(f.cn2.value.length!=4)
		{
			window.alert(" 카드번호의 길이를 확인하세요.");
			f.cn2.select();
			return false;
		}
		else if(!isNum(f.cn3.value))
		{
			window.alert("카드번호는 숫자만 입력 가능합니다.");
			f.cn3.select();
			return false;
		}
		
		if(f.cn3.value=="")
		{
			window.alert(" 카드 번호를 입력하세요.");
			f.cn3.select();
			return false;
		}
		else if(f.cn3.value.length!=4)
		{
			window.alert("세번째 카드번호의 길이를 확인하세요.");
			f.cn3.select();
			return false;
		}


		if(!isNum(f.cn4.value))
		{
			window.alert("카드번호는 숫자만 입력 가능합니다.");
			f.cn4.select();
			return false;
		}

		else if(f.cn4.value=="")
		{
			window.alert(" 카드 번호를 입력하세요.");
			f.cn4.select();
			return false;
		}
		else if(f.cn4.value.length!=4)
		{
			window.alert("네번째 카드번호의 길이를 확인하세요.");
			f.cn4.select();
			return false;
		}
		//비밀번호 체크
		if(f.card_pw.value=="")
		{
			window.alert("비밀번호를 입력하세요.");
			f.card_pw.select();
			return false;
		}
		else if(!isNum(f.card_pw.value))
		{
			window.alert("비밀번호는 숫자만 입력 가능합니다.");
			f.card_pw.select();
			return false;
		}

		// 주민번호 체크
		if(f.card_jumin1.value=="")
		{
			window.alert("주민등록번호 앞자리를 입력하세요.");
			f.card_jumin1.select();
			return false;
		}
		else if(f.card_jumin2.value=="")
		{
			window.alert("주민등록번호 뒷자리를 입력하세요.");
			f.card_jumin2.select();
			return false;
		}
		else if(f.card_jumin1.value.length!=6)
		{
			window.alert("주민등록번호 앞자리의 길이를 확인하세요.");
			f.card_jumin1.select();
			return false;
		}
		else if(f.card_jumin2.value.length!=7)
		{
			window.alert("주민등록번호 뒷자리의 길이를 확인하세요.");
			f.card_jumin2.select();
			return false;
		}
		else if(!isNum(f.card_jumin1.value))
		{
			window.alert("주민등록번호는 숫자만 입력 가능합니다.");
			f.card_jumin1.select();
			return false;
		}
		else if(!isNum(f.card_jumin2.value))
		{
			window.alert("주민등록번호는 숫자만 입력 가능합니다.");
			f.card_jumin2.select();
			return false;
		}

		for (var i = 0;i<2 ;i++ )
		{
			var f = document.shoppingCart;
			var pbcf = document.payByCardForm;

			if (document.getElementsByName("payway")[i].checked == true)
			{
				f.whereCash.value = document.getElementsByName("payway")[i].value;

				if (f.whereCash.value == "card")
				{
					f.cn1.value= pbcf.cn1.value;
					f.cn2.value= pbcf.cn2.value;
					f.cn3.value= pbcf.cn3.value;
					f.cn4.value= pbcf.cn4.value;
					f.card_end_month.value= pbcf.card_end_month.value;
					f.card_end_year.value= pbcf.card_end_year.value;
					f.card_pw.value= pbcf.card_pw.value;
					f.card_jumin1.value= pbcf.card_jumin1.value;
					f.card_jumin2.value= pbcf.card_jumin2.value;
				}
				
			}
		}
		ajaxCardCheck();
	}

	function ajaxCardCheck()
	{
		$.ajax({
			type: "POST", 
			url: "/goodsServlet.mo",
			dataType: "text",
			data: "func=goods_009&cn1=" + $('#cn1').val() +"&cn2=" + $('#cn2').val() +"&cn3=" + $('#cn3').val() +"&cn4=" + $('#cn4').val() +"&card_end_month=" + $('#card_end_month').val() +"&card_end_year=" + $('#card_end_year').val() +"&card_pw=" + $('#card_pw').val() +"&card_jumin1=" + $('#card_jumin1').val() +"&card_jumin2=" + $('#card_jumin2').val(), 
			success: function(text){
				var resultText = trim(text);
				var resultArr = resultText.split("^");
				var resultCode = resultArr[0];
				var resultCard = resultArr[1];
				var resultMessage = "<FONT color='red'>"+resultCard +"</FONT>";
				if(resultCode=="1")
				{
					$('#cardCheckYn').attr('value', 'Y');
				}
				else
				{
					$('#cardCheckYn').attr('value', 'N');
				}
				$('#cardCheckMessage').html(resultMessage);
			}
		});
	}

	// 우편번호 검색
	function searchZipCodeAction()
	{
		window.open("/commonServlet.mo?func=common_001", "zipSearchOpen", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=420, height=500");
	}
</SCRIPT>
<div><!-- 관심상품 화면 상단 바 -->
	<img src="/images/order/t_order.png">
</div>
<span style="margin-left:30px;">현제 페이지 : <A href="/goodsServlet.mo?func=goods_001">홈</A>>구매페이지
<table border="0" cellspacing="0" cellpadding="0">
	<tr><td colspan="2" height="20"></td></tr>
	<tr> 
		<td width="10"><img src="/images/common/bul_02_01.gif"></td>
		<td class="font16_title"><font color="333333"><B>구매페이지</B></font></td>
	</tr>
</table>
<hr color="#eeeeee" noshade>




<div id="buyWrap">
<TABLE>
	<FORM name="shoppingCart" method="POST" action="goodsServlet.mo">
		<INPUT type="hidden" name="func" value="goods_007">
		<INPUT type="hidden" name="whereInven" value="">



<!-- 추가한 인풋 -->


	<INPUT type="hidden" name="whereAddr" value="">
	<INPUT type="hidden" name="whereCash" value="">
	<INPUT type="hidden" name="name" value="">
	<INPUT type="hidden" name="zipCode1" value="">
	<INPUT type="hidden" name="zipCode2" value="">
	<INPUT type="hidden" name="addr1" value="">
	<INPUT type="hidden" name="addr2" value="">
	<INPUT type="hidden" name="home1" value="">
	<INPUT type="hidden" name="home2" value="">
	<INPUT type="hidden" name="home3" value="">
	<INPUT type="hidden" name="mobile1" value="">
	<INPUT type="hidden" name="mobile2" value="">
	<INPUT type="hidden" name="mobile3" value="">
	<INPUT type="hidden" name="office1" value="">
	<INPUT type="hidden" name="office2" value="">
	<INPUT type="hidden" name="office3" value="">
	<INPUT type="hidden" name="comment" value="">
	<!--결제방법-->
	<INPUT type="hidden" name="cn1" value="">
	<INPUT type="hidden" name="cn2" value="">
	<INPUT type="hidden" name="cn3" value="">
	<INPUT type="hidden" name="cn4" value="">
	<INPUT type="hidden" name="card_end_month" value="">
	<INPUT type="hidden" name="card_end_year" value="">
	<INPUT type="hidden" name="card_pw" value="">
	<INPUT type="hidden" name="card_jumin1" value="">
	<INPUT type="hidden" name="card_jumin2" value="">
	<INPUT type="hidden" name="cardCheckYn" id="cardCheckYn" value="N">
	

<!-- 추가한 인풋 -->






	<TR>
		<TD><div class="buy_title"><img src="/images/common/5.gif">&nbsp;&nbsp;주문상품</div></TD>
	</TR>
	<TR>
		<TD>
			<TABLE width="800" cellspacing="0" >
				<TR>
					<TD width="30px" bgcolor="#eeeeee" height= "40px"  style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0;"><INPUT type="checkbox" name="selectAll" onclick="allCheck()" checked></TD>
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
		ArrayList goodsBuyList = new ArrayList();
		Hashtable goodsBuyTable = new Hashtable();
		for (int i = 0; i < shoppingCartList.size(); i++)
		{
			goodsBuyList = (ArrayList)shoppingCartList.get(i);
			goodsBuyTable = (Hashtable)goodsBuyList.get(0);

			String goodsName = (String)goodsBuyTable.get("NAME");
			String code = (String)goodsBuyTable.get("GOODS_CODE");
			if (code == null)
			{
				code = (String)goodsBuyTable.get("CODE");
			}
			String amount = (String)goodsBuyTable.get("GOODS_AMOUNT");
			String parPrice = (String)goodsBuyTable.get("PAR_PRICE");//판매가
			String imgPath = (String)goodsBuyTable.get("PATH");
			String imgName = (String)goodsBuyTable.get("SAVE_NAME");
			String img = imgPath + "/" + imgName;

			img = img.substring(img.indexOf("upfile"));

			int totalPrice = Integer.parseInt(amount) * Integer.parseInt(parPrice);
			wholPrice = wholPrice + totalPrice;
			
			/*
			if (amount.equals("0"))
			{
				amountKo = "품절";
			}
			else
			{
				amountKo = "재고있음";
			}

			checkItem,name,zipcode1,zipcode2,addr1,addr2,home1,home2,home3,mobile1,mobile2,mobile3,office1,office2,office3,
			cn1,cn2,cn3,cn4,month,year,
			*/
%>				
				<INPUT type="hidden" name="code" value="<%=code%>">
				<TR>
					<TD><INPUT class="checkboxSelect" type="checkbox" name="checkItem" id="checkItem" value="<%=code%>" checked></TD>
					<TD><img src=<%=img%> width="100" height="100"></TD>
					<TD><%=goodsName%></TD>
					<TD><INPUT type="text" name="amount" value = <%=amount%> size="1"></TD>
					<TD><SPAN id="parPrice"><%=parPrice%></SPAN></TD>
					<TD><SPAN id="totalPrice"><%=totalPrice%></SPAN></TD>
					<TD><INPUT type="button" value="delete" onclick="deleteAction('<%=code%>');"></TD>
				</TR>
				<TR><TD colspan="7"><hr noshade color="#eeeeee"></TD></TR>
<%
		}
%>
				<TR>
					<TD width="700" bgcolor="#eeeeee" colspan="6"></TD>
					<TD width="100" bgcolor="#eeeeee"><B>총 금액 : <SPAN id="totalPrice"><%=wholPrice%></SPAN></B></TD>
				</TR>
				<TR><TD colspan="7" height="30"></TD></TR>
<%
	}
	Hashtable userInfoTable = (Hashtable)userInfoList.get(0);
	String name = (String)userInfoTable.get("NAME");
	String zipCode1 = (String)userInfoTable.get("ZIPCODE1");
	String zipCode2 = (String)userInfoTable.get("ZIPCODE2");
	String addr1 = (String)userInfoTable.get("ADDR1");
	String addr2 = (String)userInfoTable.get("ADDR2");

	if (addr2 == "" || addr2 == null)
	{
		addr2 = "";
	}

	String home1 = (String)userInfoTable.get("HOME1");
	String home2 = (String)userInfoTable.get("HOME2");
	String home3 = (String)userInfoTable.get("HOME3");
	String office1 = (String)userInfoTable.get("OFFICE1");
	String office2 = (String)userInfoTable.get("OFFICE2");
	String office3 = (String)userInfoTable.get("OFFICE3");
	String mobile1 = (String)userInfoTable.get("MOBILE1");
	String mobile2 = (String)userInfoTable.get("MOBILE2");
	String mobile3 = (String)userInfoTable.get("MOBILE3");

	if (home1.equals("000"))
	{
		home2 = "";
		home3 = "";
	}
	else if (office1.equals("000"))
	{
		office2 = "";
		office3 = "";
	}
	else if (mobile1.equals("000"))
	{
		mobile2 = "";
		mobile3 = "";
	}
%>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD>
			<TABLE width="800" cellspacing="0" >
				<TR>
					<TD><div class="buy_title"><img src="/images/common/5.gif">&nbsp;&nbsp;배송지 입력</div></TD>
				</TR>
				<TR><TD><hr noshade color="#eeeeee"></TD></TR>
				<TR>
					<TD>
					
						<TABLE>
						<FORM name="addrSelect">
							<TR>
								<TD>
									배송지 선택
								</TD>
								<TD>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type="radio" name="shoppingAddress" id="shoppingAddress" value="defaultAddr" onclick="addrChange()" checked>&nbsp;&nbsp;기본 배송지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<INPUT type="radio" name="shoppingAddress"  id="shoppingAddress" value="newAddr"  onclick="addrChange()">&nbsp;&nbsp;새로운 배송지
								</TD>
							</TR>
							<TR>
								<TD>
									배송비 선택
								</TD>
								<TD>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type="radio" name="inventorySelect" id="inventorySelect" value="Y" onclick="inventoryChange()" checked>&nbsp;&nbsp;선불&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<INPUT type="radio" name="inventorySelect"  id="inventorySelect" value="N"  onclick="inventoryChange()">&nbsp;&nbsp;착불&nbsp;&nbsp; <SPAN id="inventory" style=""> [<font color="red">선불</font>은 배송비로 2,500원이 추가됩니다.]</SPAN>
								</TD>
							</TR>
						</FORM>
						</TABLE>
					
					</TD>
				</TR>
				<TR>
					<TD>
						<TABLE name="defaultAddrTable" id="defaultAddrTable" style="">
							<FORM name="defaultAddrForm">
							<TR>
								<TD>
									받으시는 분
								</TD>
								<TD>
									<INPUT type="text" name="name" value="<%=name%>" readonly>
								</TD>
							</TR>
							<TR>
								<TD rowspan="3"  align="top">
									배송지
								</TD>
								<TD>
									<INPUT type="text" name="zipCode1" value="<%=zipCode1%>" size="1" readonly> - <INPUT type="text" name="zipCode2" value="<%=zipCode2%>" size="1" readonly>
								</TD>
							</TR>
							<TR>
								<TD>
									<INPUT type="text" name="addr1" value="<%=addr1%>" size="35" readonly>
								</TD>
							</TR>
							<TR>
								<TD>
									<INPUT type="text" name="addr2" value="<%=addr2%>" size="35" readonly>
								</TD>
							</TR>
							<TR>
								<TD>
									휴대전화
								</TD>
								<TD>
									<SELECT name="mobile1">
										<OPTION value="000" <%if(mobile1.equals("000")){%>selected<%}%>>--선택--</OPTION>
										<OPTION value="010" <%if(mobile1.equals("010")){%>selected<%}%>>010</OPTION>
										<OPTION value="011" <%if(mobile1.equals("011")){%>selected<%}%>>011</OPTION>
										<OPTION value="016" <%if(mobile1.equals("016")){%>selected<%}%>>016</OPTION>
										<OPTION value="017" <%if(mobile1.equals("017")){%>selected<%}%>>017</OPTION>
										<OPTION value="018" <%if(mobile1.equals("018")){%>selected<%}%>>018</OPTION>
										<OPTION value="019" <%if(mobile1.equals("019")){%>selected<%}%>>019</OPTION>
									</SELECT>
									- <INPUT type="text" name="mobile2" maxlength="4" size="5" value="<%=mobile2%>">
									- <INPUT type="text" name="mobile3" maxlength="4" size="5" value="<%=mobile3%>">
								</TD>
							</TR>
							<TR>
								<TD>
									집전화
								</TD>
								<TD>
									<SELECT name="home1">
										<OPTION value="000" <%if(home1.equals("000")){%>selected<%}%>>--선택--</OPTION>
										<OPTION value="02"  <%if(home1.equals("02")){%>selected<%}%>>02</OPTION>
										<OPTION value="031" <%if(home1.equals("031")){%>selected<%}%>>031</OPTION>
										<OPTION value="032" <%if(home1.equals("032")){%>selected<%}%>>032</OPTION>
										<OPTION value="033" <%if(home1.equals("033")){%>selected<%}%>>033</OPTION>
										<OPTION value="041" <%if(home1.equals("041")){%>selected<%}%>>041</OPTION>
										<OPTION value="042" <%if(home1.equals("042")){%>selected<%}%>>042</OPTION>
										<OPTION value="043" <%if(home1.equals("043")){%>selected<%}%>>043</OPTION>
										<OPTION value="051" <%if(home1.equals("051")){%>selected<%}%>>051</OPTION>
										<OPTION value="052" <%if(home1.equals("052")){%>selected<%}%>>052</OPTION>
										<OPTION value="053" <%if(home1.equals("053")){%>selected<%}%>>053</OPTION>
										<OPTION value="054" <%if(home1.equals("054")){%>selected<%}%>>054</OPTION>
										<OPTION value="055" <%if(home1.equals("055")){%>selected<%}%>>055</OPTION>
										<OPTION value="061" <%if(home1.equals("061")){%>selected<%}%>>061</OPTION>
										<OPTION value="062" <%if(home1.equals("062")){%>selected<%}%>>062</OPTION>
										<OPTION value="063" <%if(home1.equals("063")){%>selected<%}%>>063</OPTION>
										<OPTION value="064" <%if(home1.equals("064")){%>selected<%}%>>064</OPTION>
									</SELECT>
									- <INPUT type="text" name="home2" maxlength="4" size="5" value="<%=home2%>">
									- <INPUT type="text" name="home3" maxlength="4" size="5" value="<%=home3%>">
								</TD>
							</TR>
							<TR>
								<TD>
									직장전화
								</TD>
								<TD>
									<SELECT name="office1">
										<OPTION value="000" <%if(office1.equals("000")){%>selected<%}%>>--선택--</OPTION>
										<OPTION value="02"  <%if(office1.equals("02")){%>selected<%}%>>02</OPTION>
										<OPTION value="031" <%if(office1.equals("031")){%>selected<%}%>>031</OPTION>
										<OPTION value="032" <%if(office1.equals("032")){%>selected<%}%>>032</OPTION>
										<OPTION value="033" <%if(office1.equals("033")){%>selected<%}%>>033</OPTION>
										<OPTION value="041" <%if(office1.equals("041")){%>selected<%}%>>041</OPTION>
										<OPTION value="042" <%if(office1.equals("042")){%>selected<%}%>>042</OPTION>
										<OPTION value="043" <%if(office1.equals("043")){%>selected<%}%>>043</OPTION>
										<OPTION value="051" <%if(office1.equals("051")){%>selected<%}%>>051</OPTION>
										<OPTION value="052" <%if(office1.equals("052")){%>selected<%}%>>052</OPTION>
										<OPTION value="053" <%if(office1.equals("053")){%>selected<%}%>>053</OPTION>
										<OPTION value="054" <%if(office1.equals("054")){%>selected<%}%>>054</OPTION>
										<OPTION value="055" <%if(office1.equals("055")){%>selected<%}%>>055</OPTION>
										<OPTION value="061" <%if(office1.equals("061")){%>selected<%}%>>061</OPTION>
										<OPTION value="062" <%if(office1.equals("062")){%>selected<%}%>>062</OPTION>
										<OPTION value="063" <%if(office1.equals("063")){%>selected<%}%>>063</OPTION>
										<OPTION value="064" <%if(office1.equals("064")){%>selected<%}%>>064</OPTION>
									</SELECT>
									- <INPUT type="text" name="office2" maxlength="4" size="5" value="<%=office2%>">
									- <INPUT type="text" name="office3" maxlength="4" size="5" value="<%=office3%>">
								</TD>
							</TR>
							<TR>
								<TD>배송시 요청사항</TD>
								<TD><TEXTAREA name="comment" rows="4" cols="35"></TEXTAREA></TD>
							</TR>
							</FORM>
						</TABLE>

						<TABLE name="newAddrTable" id="newAddrTable" style="display:none">
							<FORM name="newAddrForm">
							<TR>
								<TD>
									받으시는 분
								</TD>
								<TD>
									<INPUT type="text" name="newBuyMember" value="" >
								</TD>
							</TR>
							<TR>
								<TD rowspan="3">
									배송지
								</TD>
								<TD>
									<INPUT type="text" name="newZipCode1" size="1" value=""> - <INPUT type="text" name="newZipCode1" size="1" value="" >
								</TD>
							</TR>
							<TR>
								<TD>
									<INPUT type="text" name="newAddr1" size="35" value="" >
								</TD>
							</TR>
							<TR>
								<TD>
									<INPUT type="text" name="newAddr2" size="35" value="" >
								</TD>
							</TR>
							<TR>
								<TD>
									휴대전화
								</TD>
								<TD>
									<SELECT name="newMobile1">
										<OPTION value="000">--선택--</OPTION>
										<OPTION value="010">010</OPTION>
										<OPTION value="011">011</OPTION>
										<OPTION value="016">016</OPTION>
										<OPTION value="017">017</OPTION>
										<OPTION value="018">018</OPTION>
										<OPTION value="019">019</OPTION>
									</SELECT>
									- <INPUT type="text" name="newMobile2" maxlength="4" size="5" value="">
									- <INPUT type="text" name="newMobile3" maxlength="4" size="5" value="">
								</TD>
							</TR>
							<TR>
								<TD>
									집전화
								</TD>
								<TD>
									<SELECT name="newHome1">
										<OPTION value="000">--선택--</OPTION>
										<OPTION value="02" >02</OPTION>
										<OPTION value="031">031</OPTION>
										<OPTION value="032">032</OPTION>
										<OPTION value="033">033</OPTION>
										<OPTION value="041">041</OPTION>
										<OPTION value="042">042</OPTION>
										<OPTION value="043">043</OPTION>
										<OPTION value="051">051</OPTION>
										<OPTION value="052">052</OPTION>
										<OPTION value="053">053</OPTION>
										<OPTION value="054">054</OPTION>
										<OPTION value="055">055</OPTION>
										<OPTION value="061">061</OPTION>
										<OPTION value="062">062</OPTION>
										<OPTION value="063">063</OPTION>
										<OPTION value="064">064</OPTION>
									</SELECT>
									- <INPUT type="text" name="newHome2" maxlength="4" size="5" value="">
									- <INPUT type="text" name="newHome3" maxlength="4" size="5" value="">
								</TD>
							</TR>
							<TR>
								<TD>
									직장전화
								</TD>
								<TD>
									<SELECT name="newOffice1">
										<OPTION value="000">--선택--</OPTION>
										<OPTION value="02">02</OPTION>
										<OPTION value="031">031</OPTION>
										<OPTION value="032">032</OPTION>
										<OPTION value="033">033</OPTION>
										<OPTION value="041">041</OPTION>
										<OPTION value="042">042</OPTION>
										<OPTION value="043">043</OPTION>
										<OPTION value="051">051</OPTION>
										<OPTION value="052">052</OPTION>
										<OPTION value="053">053</OPTION>
										<OPTION value="054">054</OPTION>
										<OPTION value="055">055</OPTION>
										<OPTION value="061">061</OPTION>
										<OPTION value="062">062</OPTION>
										<OPTION value="063">063</OPTION>
										<OPTION value="064">064</OPTION>
									</SELECT>
									- <INPUT type="text" name="newOffice2" maxlength="4" size="5" value="">
									- <INPUT type="text" name="newOffice3" maxlength="4" size="5" value="">
								</TD>
							</TR>
							<TR>
								<TD>배송시 요청사항</TD>
								<TD><TEXTAREA name="newComment" rows="4" cols="35"></TEXTAREA></TD>
							</TR>
							</FORM>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD>
					</TD>
					<TD>
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD colspan="7" height="20" bgcolor="#eeeeee" style="border-bottom: 1px solid #c0c0c0;border-top: 1px solid #c0c0c0"></TD>
	</TR>
	<TR>
		<TD>
			<TABLE width="800" cellspacing="0">
				<TR><TD height="30"></TD></TR>
				<TR>
					<TD><div class="buy_title"><img src="/images/common/5.gif">&nbsp;&nbsp;결재 방법</div></TD>
				</TR>
				<TR>
					<TD>
						<TABLE cellspacing="0" cellpadding="0" width="800" border="1">
							<FORM name="payWayForm">
								<tr>
									<td><input type="radio" id ="card" name="payway" value="card"  onclick="payWayChoice();" checked>&nbsp;신용카드 결재 &nbsp;&nbsp;&nbsp;
										<input type="radio" id ="cash" name="payway" value="cash"  onclick="payWayChoice();">&nbsp;무통장 입금
									</td>
								</tr>
							</form>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD height="15">
					</TD>
				</TR>
				<TR>
					<TD>
						<TABLE cellspacing="0" cellpadding="0" width="800" bgcolor="#FFFFFF" id="payCard" style="">
							<FORM name="payByCardForm">
							<tr>
								<td width="100"> 카드 번호 </td>
								<td>
									<input type="text" size="4" name="cn1" id="cn1" maxlength="4">
									- <input type="text" size="4" name="cn2" id="cn2" maxlength="4">
									- <input type="text" size="4" name="cn3" id="cn3" maxlength="4"> 
									- <input type="text" size="4" name="cn4" id="cn4" maxlength="4">
								</td>
							</tr>
							<tr>
								<td width="100"> 유효 기간 </td>
								<td>
									<SELECT name="card_end_month" id="card_end_month">
									<%
										for(int i =0 ; i<12; i++)
										{
									%>
										<OPTION value=<%= i+1%>><%= i+1%></OPTION>
									<%
										}
									%>
									</select>&nbsp;월
									&nbsp;&nbsp;&nbsp;&nbsp;
									<SELECT name="card_end_year" id="card_end_year">
									<%
										for(int j =2013 ; j<2024; j++)
										{
									%>

										<OPTION value=<%= j%>><%= j%></OPTION>
									<%
										}
									%>
									</select>&nbsp;년

								</td>
							</tr>

							<tr>
								<td width="100"> 비밀 번호 </td>
								<td>
									<input type="password" size="4"  name="card_pw" id="card_pw" maxlength="4"  >
								</td>
							</tr>
							
							<tr>
								<TD>주민 번호</TD>
								<TD>
									<INPUT type="text" name="card_jumin1" size="9" maxlength="6" id="card_jumin1">
									- <INPUT type="password" name="card_jumin2" size="13" maxlength="7" id="card_jumin2">
								</TD>
							</tr>
							<tr>
								<td width> 할부 기간 </td>
								<td>
									<input type="text" class ="cardPeriod" name="cardPeriod" value="일시불" size="5" readonly>
									<INPUT type="button" value="카드검사" onclick="cardCheckAction();"> <SPAN id ="cardCheckMessage"></SPAN>
								</td>
							</tr>
							<TR><TD height="10"></TD>
							</FORM>
						</table>
						<!----------------------------- 무통장 결제 선택시  ----------------------->
						<table id="payCashInfo" style="display:none">
							<tr>
								<td>아래 계좌로 입금해 주십시오.</td>
							</tr>
							<TR><TD height="15"></TD></TR>
							<TR>
								<TD>
									<TABLE>
										<tr>
											<td>결재금액 </td> <td><SPAN id="totalPrice"></SPAN></td>
										</tr>
										<tr>
											<td> 입 금 은 행 </td> <td> 국민은행</td>
										</tr>
										<tr>
											<td> 계 좌 번 호 </td> <td> 0000-000-000000</td>
										</tr>
										<tr>
											<td> 예 금 주 명 </td> <td> 영남상사</td>
										</tr>
										<tr>
											<td> 입 금 자 명 </td> <td> ㅁㄴㄹㅇ!!!!</td>
										</tr>
										<tr>
											<td> 결 제 금 액 </td> <td>  adsasd원</td>
										</tr>
									</table>
								</TD>
							</TR>
							<TR><TD height="10"></TD></TR>
						</table>
					</TD>
				<TR>
					<td>
						<input type="button" value="구매하기" id="pay" onclick="buyAction();">
						<input type="button" value="취소하기" id="cancle" onclick="GoCancle();">
					</td>
				</TR>
				</TR>
			</TABLE>
		</TD>
	</TR>
	</FORM>
</TABLE>
</div>