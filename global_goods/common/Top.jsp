<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<SCRIPT>
	function menuAction(middleCategory)
	{	
		//alert(middleCategory);
		//document.location.href="/goodsServlet.mo?func=goods_001?middleCategory="+middleCategory+"";
		document.location.href="/goodsServlet.mo?func=goods_001&middleCategory="+middleCategory;
	}
	function goodsSearch()
	{
		var searchBar = document.getElementById("searchBar");
		document.location.href="/goodsServlet.mo?func=goods_001&goodsWord="+searchBar.value+"&section=GN";
	}

	function goLoginPage()
	{
		document.location.href="/memberServlet.mo?func=member_004";
	}
	function goJoinPage()
	{
		document.location.href="/memberServlet.mo?func=member_001";
	}
	function logoutAction()
	{
		if (window.confirm("정말 로그아웃 하시겠습니까?"))
		{
			document.location.href="/memberServlet.mo?func=member_006";
		}
		return false;	
	}
	function infoAction()
	{
		document.location.href="/memberServlet.mo?func=member_007";
	}
	function supprotAcrtion()
	{
		document.location.href="/supportServlet.mo?func=support_002&code=BBS_00000000000000";
	}
	function log()
	{
	}
	function cartAction()
	{
		document.location.href="/goodsServlet.mo?func=goods_005";
	}
	function adminAction()
	{
		document.location.href="/superManagerServlet.mo?func=superMan_001";
	}
	function InterestAction()
	{
		document.location.href="/goodsServlet.mo?func=goods_CDH002"
	}
</SCRIPT>

<HR id="topHr" noshade>
	<DIV id="logo">
		<A href="/goodsServlet.mo?func=goods_001"><IMG src="/images/logo/logo.png" border="0"></A>
	</DIV>
	<DIV id="mainSearch">
		<INPUT id="searchBar" type="text" onkeydown="if(event.keyCode == 13){goodsSearch();}">
		<IMG src="/images/searchBar/searchBarBtn.png" id="topSearchButton" border="0" onclick="goodsSearch();">
	</DIV>
<%
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
%>
	<DIV id="topLogout">
		<IMG src="/images/button/logout.png" border="0" onclick="logoutAction()"><IMG src="/images/button/MyPage.png" border="0" onclick="infoAction()"><IMG src="/images/button/support.png"" border="0" onclick="supprotAcrtion();"><IMG src="/images/button/cart.png" border="0" onclick="cartAction()"><IMG src="/images/button/interest.png" border="0" onclick="InterestAction()"><%if(session.getAttribute("adminYn") != null && ((String)session.getAttribute("adminYn")).equals("Y")){%><IMG src="/images/button/admin.png" border="0" onclick="adminAction()" style="margin-left:-1px;"><%}%>
	</DIV>
<%
	}
	else
	{
%>
	<DIV id="topLogin">
		<IMG src="/images/button/login.png" border="0" onclick="goLoginPage();"><IMG src="/images/button/join.png" border="0" onclick="goJoinPage()"><IMG src="/images/button/support2.png"" border="0" onclick="supprotAcrtion();">
	</DIV>
<%
	}
%>


<%
//현제누른 메뉴 표시
	ArrayList superMiddlecategoryList = null;
	if(outputTable.get("superMiddlecategoryList")!=null)
	{
		superMiddlecategoryList = (ArrayList)outputTable.get("superMiddlecategoryList");
	}
	//System.out.println(superMiddlecategoryList);
	if(((String)session.getAttribute("category")).equals("middle_category") && superMiddlecategoryList!= null && superMiddlecategoryList.size() != 0)
	{
		String middleCategory = "";
		if (inputTable.get("middleCategory") != null && ((String)inputTable.get("middleCategory")).length()!=0)
		{
			middleCategory = (String)inputTable.get("middleCategory");
		}

		Hashtable middleCategoryTable = (Hashtable)superMiddlecategoryList.get(0);
		String middleCategory_name = (String)middleCategoryTable.get("MIDDLE_CATEGORY_NAME");
		String middleCategory_code = (String)middleCategoryTable.get("MIDDLE_CATEGORY_CODE");
%>

<SCRIPT>
$(document).ready(function(){

	$('.rollover').each(function(){
		var a = $(this);
		var img = a.find('IMG');
		var src_off = img.attr('src');
		var activeCode = a.attr("codeInfo");
		
		
		if (activeCode != '<%=middleCategory%>')
		{		
			var src_on = src_off.replace(/^(.+)_off(\.[^\.]+)$/, '$1_on$2');

			$('<IMG />').attr('src', src_on);
			
			a.bind('mouseenter focus', function(){
				img.attr('src', src_on);
			});
			
			a.bind('mouseleave blur', function(){
				img.attr('src', src_off);
			});
		}
		else
		{
			var src_select = src_off.replace(/^(.+)_off(\.[^\.]+)$/, '$1_select$2');
			img.attr('src', src_select);
		}
	});
	
});

</SCRIPT>
<%
	}

%>

<div id="menuWrap">
	<A href="JavaScript:menuAction('001');" codeInfo="001" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_01_off.jpg" border="0">
		
	</A>
	<A href="JavaScript:menuAction('002');" codeInfo="002" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_02_off.jpg" border="0">
		
	</A>
	<A href="JavaScript:menuAction('003');" codeInfo="003" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_03_off.jpg" border="0">
		
	</A>
	<A href="JavaScript:menuAction('004');" codeInfo="004" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_04_off.jpg" border="0">
		
	</A>
	<A href="JavaScript:menuAction('005');" codeInfo="005" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_05_off.jpg" border="0">
		
	</A>
	<A href="JavaScript:menuAction('006');" codeInfo="006" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_06_off.jpg" border="0">
		
	</A>
	<A href="JavaScript:menuAction('007');" codeInfo="007" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_07_off.jpg" border="0">
		
	</A>
	<A href="JavaScript:menuAction('008');" codeInfo="008" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_08_off.jpg" border="0">
		
	</A>
	<A href="JavaScript:menuAction('009');" codeInfo="009" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_09_off.jpg" border="0">
		
	</A>
	<A href="JavaScript:menuAction('010');" codeInfo="010" class="rollover topMItem">
		
			<IMG src="\images\topMenu\menu_10_off.jpg" border="0">
		
	</A>
</div>