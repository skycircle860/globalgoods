<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page language="java" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" type="java.util.Hashtable" />

<%
	String imgSrc = (String)inputTable.get("imgSrc");
	String imgName = (String)inputTable.get("imgName");
	String name = (String)inputTable.get("name");
	System.out.println(imgSrc+imgName);
%>
<div id="detail_popup">
	<font color="#0033ff"><h3><%=name%></h3></font>
	<a href="JavaScript:self.close();"><img src="<%=imgSrc+imgName%>" border="0"></a>
	<h4><p>이미지를 누르시면 창이 닫힙니다.</p></h4>
</div>