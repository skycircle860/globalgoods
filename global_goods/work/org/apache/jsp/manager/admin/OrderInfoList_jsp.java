/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.39
 * Generated at: 2013-06-05 07:16:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.manager.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class OrderInfoList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=euc-kr");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      java.util.Hashtable outputTable = null;
      outputTable = (java.util.Hashtable) _jspx_page_context.getAttribute("outputTable", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (outputTable == null){
        outputTable = new java.util.Hashtable();
        _jspx_page_context.setAttribute("outputTable", outputTable, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write("\r\n");
      out.write("\r\n");

		ArrayList orderInfoList = (ArrayList)outputTable.get("orderInfoList");

		

	    String check= (String)outputTable.get("state");
		
		
		System.out.println("최상단check==========" +check);


      out.write("\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("  td\r\n");
      out.write("  {\r\n");
      out.write("\t height:25px;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write(" </style>\r\n");
      out.write("<SCRIPT language=\"JavaScript\">\r\n");
      out.write(" //상세정보 업데이트\r\n");
      out.write("\tfunction updateAction()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar f = document.infoForm;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t\tf.submit();\r\n");
      out.write("\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction listAction()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.location.href=\"/managerOrderServlet.mo?func=managerOrder_001\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction deleteAction()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar f = document.infoForm;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tf.func.value=\"managerOrder_022\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(confirm(\"삭제하시겠습니까?\"))\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tf.submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("\r\n");
      out.write("<div><!-- 리스트 화면 상단 바 -->\r\n");
      out.write("\t<img src=\"/images/common/t_admin.png\">\r\n");
      out.write("</div>\r\n");
      out.write("<font color=\"#000000\"><span style=\"margin-left:30px;\">현제 페이지 : <A href=\"/goodsServlet.mo?func=goods_001\">홈</A>>관리자페이지</font>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<CENTER>\r\n");
      out.write("<FORM name=\"infoForm\" method=\"post\" action=\"/managerOrderServlet.mo\">\r\n");
      out.write("\t<TABLE cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("\t\t<TR><TD height=\"25\"></TD></TR>\r\n");
      out.write("\t</TABLE>\r\n");
      out.write("\t<TABLE cellspacing=\"1\" cellpadding=\"5\" bgcolor=\"#74c900\" width=\"550\">\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t\t<TD align=\"center\" bgcolor=\"#74c900\" width=\"300\" colspan=\"6\">\r\n");
      out.write("\t\t\t\t<FONT color=\"white\" size=\"3\"><B>주문 세부 정보</B></FONT>\r\n");
      out.write("\t\t\t</TD>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</TABLE>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<TABLE cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("\t\t<TR><TD height=\"25\"></TD></TR>\r\n");
      out.write("\t</TABLE>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t");

	
		Hashtable orderTable = (Hashtable)orderInfoList.get(0);
		
		String code = (String)orderTable.get("CODE");
		String orderId = (String)orderTable.get("MEMBER_ID");
		String orderDate = (String)orderTable.get("ORDER_DATE");
		String name = (String)orderTable.get("NAME");
		String price = (String)orderTable.get("PAR_PRICE");
		String state = (String)orderTable.get("ORDER_STATE");
		String addr1 = (String)orderTable.get("ADDR1");
		String addr2 = (String)orderTable.get("ADDR2");
		String zipcode1 = (String)orderTable.get("ZIPCODE1");
		String zipcode2 = (String)orderTable.get("ZIPCODE2");
		String home1 = (String)orderTable.get("HOME1");
		String home2 = (String)orderTable.get("HOME2");
		String home3 = (String)orderTable.get("HOME3");
		String office1 = (String)orderTable.get("OFFICE1");
		String office2 = (String)orderTable.get("OFFICE2");
		String office3 = (String)orderTable.get("OFFICE3");
		String mobile1 = (String)orderTable.get("MOBILE1");
		String mobile2 = (String)orderTable.get("MOBILE2");
		String mobile3 = (String)orderTable.get("MOBILE3");
		String comment= (String)orderTable.get("ORDER_COMMENT");
		String midname = (String)orderTable.get("MIDNAME");
		String subname = (String)orderTable.get("SUBNAME");
		String cancleDate = (String)orderTable.get("CANCLE_DATE");
		String depositDate = (String)orderTable.get("DEPOSIT_DATE");
		String sendDate = (String)orderTable.get("RECEIVE_DATE");
		String receiveDate = (String)orderTable.get("SEND_DATE");
		
		String cancleyn = (String)orderTable.get("CANCLEYN");
		String account = (String)orderTable.get("ACCOUNT_NUM");
		String goodsGroup = (String)orderTable.get("GOODS_GROUP");

		String depositYn = (String)orderTable.get("DEPOSITYN");		
		
		String useState ="";
		String usecancleState ="";
	

		if(state.equals("D"))
		{
			useState="입금확인";
		}
		 if(state.equals("S"))
		{
			useState="배송중";
		}
		 if(state.equals("R"))
		{
			useState="배송완료";
		}
		if(cancleyn.equals("Y"))
		{
			usecancleState="취소요청";
		}
		if(cancleyn.equals("R"))
		{
			usecancleState="환불완료";	
		}


		
		String maincategory = "";
		
		if(goodsGroup.startsWith("F"))
		{
			maincategory ="식품";
			System.out.println("maintest=="+maincategory);

		}

		 if(goodsGroup.startsWith("E"))
		{
			maincategory ="잡화";
			System.out.println("maintest=="+maincategory);
		} 

		


      out.write("\r\n");
      out.write("\t<TABLE cellspacing=\"1\" cellpadding=\"4\" bgcolor=\"#74c900\" width=\"550\">\r\n");
      out.write("\t<INPUT type=\"hidden\" name =\"code\" value=\"");
      out.print(code);
      out.write("\">\r\n");
      out.write("\t<INPUT type=\"hidden\" name=\"cancleyn\" value=\"");
      out.print( cancleyn);
      out.write("\">\r\n");
      out.write("\t<INPUT type=\"hidden\" name=\"depositYn\" value=\"");
      out.print( depositYn);
      out.write("\">\r\n");
      out.write("\t<INPUT type=\"hidden\" name=\"from\" value=\"OrderInfo\">\r\n");
      out.write("\t<INPUT type=\"hidden\" name =\"func\" value=\"managerOrder_010\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>주문자 ID</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"100\" align=\"left\" colspan=\"7\">");
      out.print( orderId);
      out.write("</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>주문날짜</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"300\" align=\"left\" colspan=\"7\">");
      out.print( orderDate);
      out.write("</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>상품 이름</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"300\" align=\"left\" colspan=\"7\">");
      out.print( name);
      out.write("&nbsp;(");
      out.print(maincategory);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print(midname);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print(subname);
      out.write(")</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>상품 가격</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\"  align=\"left\" colspan=\"7\">");
      out.print(price);
      out.write("</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>주문자 주소</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"300\" align=\"left\" colspan=\"7\">(");
      out.print(zipcode1);
      out.write('-');
      out.print(zipcode2);
      out.write(") &nbsp;");
      out.print(addr1);
      out.write('-');
      out.print(addr2);
      out.write("</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>휴대폰 번호</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"300\" align=\"left\" colspan=\"7\">\r\n");

	if(!mobile1.equals("000"))
	{

      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.print( mobile1);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print( mobile2);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print( mobile3);
      out.write('\r');
      out.write('\n');

	}
	else
	{

      out.write("\r\n");
      out.write("\t\t\t\t<FONT color='red'>미입력</FONT>\r\n");

	}

      out.write("\r\n");
      out.write("\t\t</TD>\t\t\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>집 전화번호</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"300\" align=\"left\" colspan=\"7\">\r\n");

	if(!home1.equals("000"))
	{

      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.print( home1);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print( home2);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print( home3);
      out.write('\r');
      out.write('\n');

	}
	else
	{

      out.write("\r\n");
      out.write("\t\t\t\t<FONT color='red'>미입력</FONT>\r\n");

	}

      out.write("\r\n");
      out.write("\t\t</TD>\t\t\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>사무실 번호</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"300\" align=\"left\" colspan=\"7\">\r\n");

	if(!office1.equals("000"))
	{

      out.write("\r\n");
      out.write("\t\t\t\t\t");
      out.print( office1);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print( office2);
      out.write(' ');
      out.write('-');
      out.write(' ');
      out.print( office3);
      out.write('\r');
      out.write('\n');

	}
	else
	{

      out.write("\r\n");
      out.write("\t\t\t\t<FONT color='red'>미입력</FONT>\r\n");

	}

      out.write("\r\n");
      out.write("\t\t</TD>\t\t\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>계좌번호</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"300\" align=\"left\" colspan=\"7\" >");
      out.print(account);
      out.write("</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>배송여부</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" align=\"left\" colspan=\"7\">\r\n");
      out.write("\t\t\t입금확인\r\n");
      out.write("\t\t\t<INPUT value=\"D\" type=\"radio\"  name=\"state\" \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t");
if(state.equals("D")){
      out.write("checked");
}
      out.write(">\r\n");
      out.write("\t\t\t배송중\r\n");
      out.write("\t\t\t<INPUT value=\"S\" type=\"radio\"  name=\"state\" \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t");
if(state.equals("S")){
      out.write("checked");
}
      out.write("> \r\n");
      out.write("\t\t\t배송완료 \r\n");
      out.write("\t\t\t<INPUT value=\"R\" type=\"radio\" name=\"state\" \r\n");
      out.write("\t\t\t");
if(state.equals("R")){
      out.write("checked");
}
      out.write(">\r\n");
      out.write("\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t\t취소요청 \r\n");
      out.write("\t\t\t<INPUT value=\"Y\" type=\"checkbox\" name=\"cancleYn\" align=\"right\"\r\n");
      out.write("\t\t\t");
if(cancleyn.equals("Y")){
      out.write("checked");
}
      out.write(">\r\n");
      out.write("\t\t\t환불완료\r\n");
      out.write("\t\t\t<INPUT value=\"R\" type=\"checkbox\" name=\"cancleYn\" align=\"right\"\r\n");
      out.write("\t\t\t");
if(cancleyn.equals("R")){
      out.write("checked");
}
      out.write(">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>부가요청</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"100\" align=\"left\" colspan=\"7\">");
      out.print(comment);
      out.write("</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\" >\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>주문상태</B></TD>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"100\" align=\"left\" colspan=\"3\">");
      out.print(useState);
      out.write("</TD>\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>취소 사유</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"100\" align=\"left\" colspan=\"3\">");
      out.print(comment);
      out.write("</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>주문취소날짜</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"100\" align=\"left\" colspan=\"3\">");
      out.print(cancleDate);
      out.write("</TD>\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>입금날짜</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"100\" align=\"left\" colspan=\"3\">");
      out.print(depositDate);
      out.write("</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR bgcolor=\"#74c900\" align=\"center\">\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>물품발송날짜</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"100\" align=\"left\" colspan=\"3\">");
      out.print(sendDate);
      out.write("</TD>\r\n");
      out.write("\t\t\t<TD width=\"100\"><font color=\"white\"><B>물품수령날짜</B></TD>\r\n");
      out.write("\t\t\t<TD bgcolor=\"#FFFFFF\" width=\"100\" align=\"left\" colspan=\"3\">");
      out.print(receiveDate);
      out.write("</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t</TABLE> \r\n");
      out.write("\t\r\n");
      out.write("\t<TABLE cellspacing=\"1\" cellpadding=\"3\" width=\"750\" >\r\n");
      out.write("\t\t<TR><TD height=\"5\"></TD></TR>\r\n");
      out.write("\t\t<TR>\r\n");
      out.write("\t\t\t<TD align=\"center\">\r\n");
      out.write("\t\t\t\t<IMG src=\"/images/button/Update.png\" border=\"0\" onclick=\"updateAction();\" style=\"cursor:hand\" align=\"absmiddle\">\r\n");
      out.write("\t\t\t</TD>\r\n");
      out.write("\t\t\t<TD align=\"center\">\r\n");
      out.write("\t\t\t\t<IMG src=\"/images/button/List.png\" border=\"0\" onclick=\"listAction();\" style=\"cursor:hand\" align=\"absmiddle\">\r\n");
      out.write("\t\t\t</TD>\r\n");
      out.write("\t\t\t<TD align=\"center\">\r\n");
      out.write("\t\t\t\t<IMG src=\"/images/button/Delete.png\" border=\"0\" onclick=\"deleteAction();\" style=\"cursor:hand\" align=\"absmiddle\">\r\n");
      out.write("\t\t\t</TD>\r\n");
      out.write("\t\t</TR>\r\n");
      out.write("\t\t<TR><TD height=\"3\"></TD></TR>\r\n");
      out.write("\t</TABLE>\r\n");
      out.write("\r\n");
      out.write("\t<TABLE cellspacing=\"0\" cellpadding=\"0\" width=\"700\">\r\n");
      out.write("\t\t<TR><TD height=\"20\"></TD></TR>\r\n");
      out.write("\t</TABLE>\r\n");
      out.write("\t\r\n");
      out.write("\t</FORM>\r\n");
      out.write("</CENTER>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}