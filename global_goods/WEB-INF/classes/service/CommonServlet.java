package service;

import common.main.*;
import common.util.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CommonServlet extends MainServlet
{
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		moveType = "SR";
		mode = "S";
		
		session.setAttribute("category", "");


		/** 우편번호 검색 페이지 가기*/
		if(func.equals("common_001"))
		{
			moveType = "FW";
			mode = "P";
			mainUrl = "/common/ZipCodeSearch.jsp";
		}
		/** 우편번호 검색*/
		else if(func.equals("common_002"))
		{
			String qt = request.getParameter("qt");

			inputTable = new Hashtable();
			inputTable.put("qt", entoKo(qt));

			ZipCodeSearchBean zcsb = new ZipCodeSearchBean();
			zcsb.setDataTable(inputTable);
			zcsb.funcExecute();
			ArrayList zipCodeList = zcsb.getDataList();

			outputTable.put("zipCodeList", zipCodeList);
			outputTable.put("inputTable", inputTable);

			moveType = "FW";
			mode = "P";
			mainUrl = "/common/ZipCodeSearch.jsp";
		}
	}
}