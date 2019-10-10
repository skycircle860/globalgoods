<%@ page contentType="text/html;charset=euc-kr" %>

<%@ page language="java"%>

<%@ page import="common.conf.*" %>
<%@ page import="java.util.*" %>

<%
System.out.println("adminPage도착");
%>



<div id="admin_wrap">

	<a href="/managerOrderServlet.mo?func=managerOrder_001">
		<div class="button red" style="margin-left:30px; margin-top:50px">주문조회관리</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_009">
		<div class="button rosy" style="margin-left:30px; margin-top:50px">반품관리</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_024">
		<div class="button blue" style="margin-left:30px; margin-top:50px">상품관리</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_003">
		<div class="button white" style="margin-left:30px; margin-top:50px">상품등록</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_005">
		<div class="button orange" style="margin-left:30px; margin-top:50px">품목 추가/제거	</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_008">
		<div class="button black" style="margin-left:30px; margin-top:50px">카테고리 추가/제거</div>
	</a>
	<a href="/managerUserServlet.mo?func=managerUser_001">
		<div class="button gray" style="margin-left:30px; margin-top:50px">사용자관리</div>
	</a>
	<a href="/managerSupportServlet.mo?func=managerSupport_001">
		<div class="button pink" style="margin-left:30px; margin-top:50px">게시판관리</div>
	</a>
	<a href="/managerInterestServlet.mo?func=managerInterest_001">
		<div class="button green" style="margin-left:30px; margin-top:50px">(회원가입용)관심상품관리 리스트</div>
	</a>

</div>