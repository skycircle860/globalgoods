<%@ page contentType="text/html;charset=euc-kr" %>

<%@ page language="java"%>

<%@ page import="common.conf.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="outputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />
<%
//	System.out.println("레프트메뉴 outputTable : "+outputTable);
	String middleCategory = (String)inputTable.get("middleCategory");
	String subcode = (String)inputTable.get("subcode");
	System.out.println("세션 카테고리 : "+session.getAttribute("category"));
%>
<SCRIPT>
	function goMenu(func)
	{
		document.location.href="/"+func;
	}
	function submenuAction(subcode, subname)
	{
		//alert(middleCategory);
		//document.location.href="/goodsServlet.mo?func=goods_001?middleCategory="+middleCategory+"";
		document.location.href="/goodsServlet.mo?func=goods_007&middleCategory=<%=middleCategory%>&subcode="+subcode+"&subname="+subname+"";
	}


/*LeftMenu Animation*/
$(document).ready(function(){
	$('.leftMenu').hover(function(){
		
		
	},function(){
	
		
	});


	$('div.leftMenu').mouseover(function(){
		var menuDiv = $(this);
		var codeInfo = menuDiv.attr("subcode_info");
		
		if (codeInfo!=null)
		{			
			var img = $(".leftMenuImg");
			img.attr("src", "/images/left_menu/"+codeInfo+".jpg");			
		}
		menuDiv.css('backgroundColor',"#d9ffa4" );
		menuDiv.css('color',"#4c8706" );
	}).mouseout(function(){
		var menuDiv = $(this);
		menuDiv.css('backgroundColor',"#ffffff" );
		menuDiv.css('color',"#666666" );
	
	});

	$('.leftMenu').hover(function(){
		
		
	},function(){
		$(this).animate({ backgroundColor: "olive" }, "slow");
	});
});



</SCRIPT>
<div id="leftMenuWrap">
<%
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		//일반 맴버일때 변화를 주고 싶다면 여기

		if(session.getAttribute("adminYn")!=null && ((String)session.getAttribute("adminYn")).equals("Y"))
		{
			//관리자일때 변화를 주고싶다면 여기
	
%>
<div class="leftMenu" onclick="document.location.href='/managerOrderServlet.mo?func=managerOrder_003'">(관리자)상품등록버튼</div>

<%

		}
	}
%>
<TABLE cellspacing="0" cellpadding="0" border="0" valign="top">

<%
if(((String)session.getAttribute("category")).equals("middle_category"))
	{
%>


	<TR>
		<TD>
				<div class="leftMenu" onclick="document.location.href='/goodsServlet.mo?func=goods_001'">상품 전체 보기</div>
		</TD>
	</TR>
	<TR>
		<TD width="220" align="center">
			<hr noshade color="#eeeeee">
		</TD>
	</TR>

<%
	}

	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		//일반 맴버일때 변화를 주고 싶다면 여기

		if(session.getAttribute("adminYn")!=null && ((String)session.getAttribute("adminYn")).equals("Y"))
		{
			//관리자일때 변화를 주고싶다면 여기
		}
	}



	ArrayList superMiddlecategoryList = null;
	if(outputTable.get("superMiddlecategoryList")!=null)
	{
		superMiddlecategoryList = (ArrayList)outputTable.get("superMiddlecategoryList");
	}
	//System.out.println(superMiddlecategoryList);
	if(((String)session.getAttribute("category")).equals("middle_category") && superMiddlecategoryList!= null && superMiddlecategoryList.size() != 0)
	{
		Hashtable superMiddlecategoryInfoTable = null;

		for(int j =0; j<superMiddlecategoryList.size(); j++)
		{
			superMiddlecategoryInfoTable = (Hashtable)superMiddlecategoryList.get(j);

			String useYn = (String)superMiddlecategoryInfoTable.get("USEYN");
			if(useYn.equals("Y"))
			{
				String sub_code = (String)superMiddlecategoryInfoTable.get("CODE");
				String sub_name = (String)superMiddlecategoryInfoTable.get("NAME");
%>	

	<TR>
		<TD width="220" align="center">
			<div class="leftMenu" subcode_info="<%=sub_code%>" onclick="JavaScript:submenuAction('<%=sub_code%>', '<%=sub_name%>');"><%= sub_name%></div>
		</TD>
	</TR>
	<TR>
		<TD height="1" bgcolor="#eeeeee"></TD>
	</TR>
<%

			}
		}

	
		if(subcode!=null && subcode.length() == 0 )//상단 중분류 눌렀을때의 반응
		{
			Hashtable tempSubTable = (Hashtable)superMiddlecategoryList.get(0);
			String img_code = (String)tempSubTable.get("CODE");
			System.out.println("값이 없을때 체크 : "+img_code);
%>
	<TR>
		<TD><img class="leftMenuImg" src="/images/left_menu/<%=img_code%>.jpg"></TD>
	</TR>	
<%
		}
		else
		{
			
%>
	<TR>
		<TD><img class="leftMenuImg" src="/images/left_menu/<%=subcode%>.jpg"></TD>
	</TR>	
<%
		}
	}
	//고객센터 메뉴
	else if(((String)session.getAttribute("category")).equals("support"))
	{
		ReadConf rc = ReadConf.getReadConf();
		Hashtable confTable = rc.getConfTable();
		ArrayList bbsInfoList = (ArrayList)confTable.get("bbsInfoList");

		for(int i=0; i<bbsInfoList.size(); i++)
		{
			Hashtable bbsInfoTable = (Hashtable)bbsInfoList.get(i);
			String useYn = (String)bbsInfoTable.get("USE_YN");
			if(useYn.equals("Y"))
			{
				String code = (String)bbsInfoTable.get("CODE");
				String name = (String)bbsInfoTable.get("NAME");
				
				if(session.getAttribute("category")!=null && ((String)session.getAttribute("category")).equals("support"))
				{
%>	
		<TR>
			<TD width="220" align="center">
				<div class="leftMenu" onclick="goMenu('supportServlet.mo?func=support_002&code=<%= code%>');"><%= name%></div>
			</TD>
		</TR>
<%
				}

			}
		}
	}
	else
	{
%>
		<TR>
			<TD width="220" align="center">
				상단 메뉴를 클릭하시면<br>
				세부항목이 나옵니다~!
			</TD>
		</TR>
<%
	}
%>
</TABLE>
</div>

<div id="celler_info">
	<img src="/images/left_menu/left_info.jpg">
</div>

<iframe width="220" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=&amp;daddr=37.559879,126.976031&amp;hl=ko&amp;geocode=&amp;sll=37.559884,126.976086&amp;sspn=0.00276,0.005209&amp;mra=mift&amp;mrsp=1&amp;sz=18&amp;ie=UTF8&amp;t=m&amp;start=0&amp;ll=37.559803,126.97556&amp;spn=0.002551,0.002264&amp;z=17&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=&amp;daddr=37.559879,126.976031&amp;hl=ko&amp;geocode=&amp;sll=37.559884,126.976086&amp;sspn=0.00276,0.005209&amp;mra=mift&amp;mrsp=1&amp;sz=18&amp;ie=UTF8&amp;t=m&amp;start=0&amp;ll=37.559803,126.97556&amp;spn=0.002551,0.002264&amp;z=17" style="color:#0000FF;text-align:left">크게 보기</a></small>
