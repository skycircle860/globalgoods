package service;

import common.conf.*;
import common.main.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SuperManagerServlet extends MainServlet
{
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		session.setAttribute("category", "middle_category");

		if (func.equals("superMan_001"))
		{
			System.out.println("���۸Ŵ���");
			moveType = "FW";
			mode = "S";
			mainUrl = "/common/adminPage.jsp";
		}
		/*
		//�̵� �޴�
		else if(func.equals("superMan_002"))
		{
			String code = request.getParameter("code");
			inputTable.put("code",code);

			SuperMiddleCategoryListBean smcb = new SuperMiddleCategoryListBean();
			smcb.setDataTable(inputTable);
			smcb.funcExecute();

			ArrayList superMiddlecategoryList = smcb.getDataList();
			outputTable.put("superMiddlecategoryList", superMiddlecategoryList);
	
			moveType = "FW";
			mode = "S";
		}*/
	}
}