/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.39
 * Generated at: 2013-06-03 06:14:51 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class Top_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      java.util.Hashtable inputTable = null;
      inputTable = (java.util.Hashtable) _jspx_page_context.getAttribute("inputTable", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (inputTable == null){
        inputTable = new java.util.Hashtable();
        _jspx_page_context.setAttribute("inputTable", inputTable, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      java.util.Hashtable outputTable = null;
      outputTable = (java.util.Hashtable) _jspx_page_context.getAttribute("outputTable", javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      if (outputTable == null){
        outputTable = new java.util.Hashtable();
        _jspx_page_context.setAttribute("outputTable", outputTable, javax.servlet.jsp.PageContext.REQUEST_SCOPE);
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("<SCRIPT>\r\n");
      out.write("\tfunction menuAction(middleCategory)\r\n");
      out.write("\t{\t\r\n");
      out.write("\t\t//alert(middleCategory);\r\n");
      out.write("\t\t//document.location.href=\"/goodsServlet.mo?func=goods_001?middleCategory=\"+middleCategory+\"\";\r\n");
      out.write("\t\tdocument.location.href=\"/goodsServlet.mo?func=goods_001&middleCategory=\"+middleCategory;\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction goodsSearch()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar searchBar = document.getElementById(\"searchBar\");\r\n");
      out.write("\t\tdocument.location.href=\"/goodsServlet.mo?func=goods_001&goodsWord=\"+searchBar.value+\"&section=GN\";\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction goLoginPage()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.location.href=\"/memberServlet.mo?func=member_004\";\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction goJoinPage()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.location.href=\"/memberServlet.mo?func=member_001\";\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction logoutAction()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tif (window.confirm(\"정말 로그아웃 하시겠습니까?\"))\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tdocument.location.href=\"/memberServlet.mo?func=member_006\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\treturn false;\t\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction infoAction()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.location.href=\"/memberServlet.mo?func=member_007\";\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction supprotAcrtion()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.location.href=\"/supportServlet.mo?func=support_002&code=BBS_00000000000000\";\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction log()\r\n");
      out.write("\t{\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction cartAction()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.location.href=\"/goodsServlet.mo?func=goods_005\";\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction adminAction()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.location.href=\"/superManagerServlet.mo?func=superMan_001\";\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction InterestAction()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tdocument.location.href=\"/goodsServlet.mo?func=goods_CDH002\"\r\n");
      out.write("\t}\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("\r\n");
      out.write("<HR id=\"topHr\" noshade>\r\n");
      out.write("\t<DIV id=\"logo\">\r\n");
      out.write("\t\t<A href=\"/goodsServlet.mo?func=goods_001\"><IMG src=\"/images/logo/logo.png\" border=\"0\"></A>\r\n");
      out.write("\t</DIV>\r\n");
      out.write("\t<DIV id=\"mainSearch\">\r\n");
      out.write("\t\t<INPUT id=\"searchBar\" type=\"text\" onkeydown=\"if(event.keyCode == 13){goodsSearch();}\">\r\n");
      out.write("\t\t<IMG src=\"/images/searchBar/searchBarBtn.png\" id=\"topSearchButton\" border=\"0\" onclick=\"goodsSearch();\">\r\n");
      out.write("\t</DIV>\r\n");

	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{

      out.write("\r\n");
      out.write("\t<DIV id=\"topLogout\">\r\n");
      out.write("\t\t<IMG src=\"/images/button/logout.png\" border=\"0\" onclick=\"logoutAction()\"><IMG src=\"/images/button/MyPage.png\" border=\"0\" onclick=\"infoAction()\"><IMG src=\"/images/button/support.png\"\" border=\"0\" onclick=\"supprotAcrtion();\"><IMG src=\"/images/button/cart.png\" border=\"0\" onclick=\"cartAction()\"><IMG src=\"/images/button/interest.png\" border=\"0\" onclick=\"InterestAction()\">");
if(session.getAttribute("adminYn") != null && ((String)session.getAttribute("adminYn")).equals("Y")){
      out.write("<IMG src=\"/images/button/admin.png\" border=\"0\" onclick=\"adminAction()\" style=\"margin-left:-1px;\">");
}
      out.write("\r\n");
      out.write("\t</DIV>\r\n");

	}
	else
	{

      out.write("\r\n");
      out.write("\t<DIV id=\"topLogin\">\r\n");
      out.write("\t\t<IMG src=\"/images/button/login.png\" border=\"0\" onclick=\"goLoginPage();\"><IMG src=\"/images/button/join.png\" border=\"0\" onclick=\"goJoinPage()\"><IMG src=\"/images/button/support2.png\"\" border=\"0\" onclick=\"supprotAcrtion();\">\r\n");
      out.write("\t</DIV>\r\n");

	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<SCRIPT>\r\n");
      out.write("$(document).ready(function(){\r\n");
      out.write("\r\n");
      out.write("\t$('.rollover').each(function(){\r\n");
      out.write("\t\tvar a = $(this);\r\n");
      out.write("\t\tvar img = a.find('IMG');\r\n");
      out.write("\t\tvar src_off = img.attr('src');\r\n");
      out.write("\t\tvar activeCode = a.attr(\"codeInfo\");\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif (activeCode != '");
      out.print(middleCategory);
      out.write("')\r\n");
      out.write("\t\t{\t\t\r\n");
      out.write("\t\t\tvar src_on = src_off.replace(/^(.+)_off(\\.[^\\.]+)$/, '$1_on$2');\r\n");
      out.write("\r\n");
      out.write("\t\t\t$('<IMG />').attr('src', src_on);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\ta.bind('mouseenter focus', function(){\r\n");
      out.write("\t\t\t\timg.attr('src', src_on);\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\ta.bind('mouseleave blur', function(){\r\n");
      out.write("\t\t\t\timg.attr('src', src_off);\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tvar src_select = src_off.replace(/^(.+)_off(\\.[^\\.]+)$/, '$1_select$2');\r\n");
      out.write("\t\t\timg.attr('src', src_select);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("</SCRIPT>\r\n");

	}


      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"menuWrap\">\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('001');\" codeInfo=\"001\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_01_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('002');\" codeInfo=\"002\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_02_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('003');\" codeInfo=\"003\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_03_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('004');\" codeInfo=\"004\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_04_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('005');\" codeInfo=\"005\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_05_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('006');\" codeInfo=\"006\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_06_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('007');\" codeInfo=\"007\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_07_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('008');\" codeInfo=\"008\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_08_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('009');\" codeInfo=\"009\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_09_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("\t<A href=\"JavaScript:menuAction('010');\" codeInfo=\"010\" class=\"rollover topMItem\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<IMG src=\"\\images\\topMenu\\menu_10_off.jpg\" border=\"0\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t</A>\r\n");
      out.write("</div>");
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