<%@ page contentType="text/html;charset=euc-kr" %>

<%@ page language="java"%>

<%@ page import="common.conf.*" %>
<%@ page import="java.util.*" %>

<%
System.out.println("adminPage����");
%>



<div id="admin_wrap">

	<a href="/managerOrderServlet.mo?func=managerOrder_001">
		<div class="button red" style="margin-left:30px; margin-top:50px">�ֹ���ȸ����</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_009">
		<div class="button rosy" style="margin-left:30px; margin-top:50px">��ǰ����</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_024">
		<div class="button blue" style="margin-left:30px; margin-top:50px">��ǰ����</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_003">
		<div class="button white" style="margin-left:30px; margin-top:50px">��ǰ���</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_005">
		<div class="button orange" style="margin-left:30px; margin-top:50px">ǰ�� �߰�/����	</div>
	</a>
	<a href="/managerOrderServlet.mo?func=managerOrder_008">
		<div class="button black" style="margin-left:30px; margin-top:50px">ī�װ� �߰�/����</div>
	</a>
	<a href="/managerUserServlet.mo?func=managerUser_001">
		<div class="button gray" style="margin-left:30px; margin-top:50px">����ڰ���</div>
	</a>
	<a href="/managerSupportServlet.mo?func=managerSupport_001">
		<div class="button pink" style="margin-left:30px; margin-top:50px">�Խ��ǰ���</div>
	</a>
	<a href="/managerInterestServlet.mo?func=managerInterest_001">
		<div class="button green" style="margin-left:30px; margin-top:50px">(ȸ�����Կ�)���ɻ�ǰ���� ����Ʈ</div>
	</a>

</div>