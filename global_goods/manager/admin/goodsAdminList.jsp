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
	// ��� or ���� �ϱ�
	function goodsDisp_YnUpdate(code, disp_yn)
	{
		var alertStr = "�����Ͻ� ��ǰ�� ������� ���ϰ� �Ͻðڽ��ϱ�?";
		if(disp_yn=='Y')
		{
			alertStr = "�����Ͻ� ��ǰ�� ��� �Ͻðڽ��ϱ�?"; 
		}
		if(confirm(alertStr))
		{
			document.location.href="/managerOrderServlet.mo?func=managerOrder_025&disp_yn="+disp_yn+"&code="+code;
		}
	}
</SCRIPT>

<div><!-- ����Ʈ ȭ�� ��� �� -->
	<img src="/images/common/t_admin.png">
</div>
<font color="#000000"><span style="margin-left:30px;">���� ������ : <A href="/goodsServlet.mo?func=goods_001">Ȩ</A>>������������</font>





<TABLE style="margin-left : 50px;" border="0" cellspacing="1" bgcolor="#000000">
	<TR bgcolor="#eeeeee">
		<TD width="50" align="center">
			No.
		</TD>
		<TD width="50">
			�̹���
		</TD>
		<TD width="80">
			Code
		</TD>
		<TD width="150">
			�̸�
		</TD>
		<TD width="50">
			���
		</TD>
		<TD width="70">
			����
		</TD>
		<TD width="70">
			�ǸŰ�
		</TD>
		<TD width="100">
			��ư
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
			<DIV class="button blue small" onclick="goodsModify('goodsItem<%=i%>')">����</DIV>
<%
		
		if(disp_yn.equals("Y"))//�Խ��� ��� ���� ���
		{
%>
			<DIV class="button blue small" onclick="goodsDisp_YnUpdate('<%= code%>', 'N');">����</DIV>
<%
		}
		else if(disp_yn.equals("N"))
		{
%>
			<DIV class="button blue small" onclick="goodsDisp_YnUpdate('<%= code%>', 'Y')">���</DIV>
<%
		}
%>

		</TD>
	</TR>
<%
	}
%>
</TABLE>