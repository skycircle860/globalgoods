package service;

import common.main.*;
import common.util.*;
import manager.interest.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ManagerInterestServlet extends MainServlet
{
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		// ���ɻ� ���
		if(func.equals("managerInterest_001"))
		{
			InterestListBean Ilb = new InterestListBean();
			Ilb.funcExecute();
			ArrayList interestList = Ilb.getDataList();

			//���� �ߺ�����
			/*inputTable.put("menu", "INTEREST");
			SelectListBean slb = new SelectListBean();
			slb.setDataTable(inputTable);
			slb.funcExecute();
			ArrayList selectList = slb.getDataList();

			outputTable.put("hobbyList", hobbyList);*/

			outputTable.put("interestList", interestList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/interest/InterestList.jsp";
		}

		
		//  �� ���� ����
		else if(func.equals("managerInterest_002"))
		{
			String code = request.getParameter("code");

			inputTable.put("code", code);

			InterestInfoBean Iib = new InterestInfoBean();
			Iib.setDataTable(inputTable);
			Iib.funcExecute();
			ArrayList interestInfoList = Iib.getDataList();

			outputTable.put("interestInfoList", interestInfoList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/interest/InterestInfo.jsp";
		}
	
		// ���ɻ� ��� or ���� �ϱ�
		else if(func.equals("managerInterest_003"))
		{
			String code = request.getParameter("code");
			String from = request.getParameter("from");
			String yn = request.getParameter("yn");
			String client = request.getRemoteAddr();

			inputTable.put("id", session.getAttribute("id"));
			inputTable.put("code", code);
			inputTable.put("client", client);
			inputTable.put("yn", yn);

			InterestUseYnBean Iuyb = new InterestUseYnBean();
			Iuyb.setDataTable(inputTable);
			Iuyb.funcExecute();
			ArrayList resultList = Iuyb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "�۾��� ���������� ����Ǿ����ϴ�.";
			}
			else
			{
				message = "�۾� ������ Error�� �߻��Ͽ����ϴ�.";
			}

			stepUrl = "/managerInterestServlet.mo?func=managerInterest_001";
			moveType = "FW";
			mode = "T";
		}
		
		// ���ɻ� ���� ������ ����
		else if(func.equals("managerInterest_004"))
		{
			String code = request.getParameter("code");
			String from = request.getParameter("from");

			inputTable.put("code", code);
			inputTable.put("from", from);

			InterestInfoBean Iib = new InterestInfoBean();
			Iib.setDataTable(inputTable);
			Iib.funcExecute();
			ArrayList interestInfoList = Iib.getDataList();

			outputTable.put("interestInfoList", interestInfoList);

			mainUrl = "/manager/interest/InterestUpdate.jsp";
			moveType = "FW";
			mode = "S";
		}
		// ���ɻ� ����
		else if(func.equals("managerInterest_005"))
		{
			String code = request.getParameter("code");
			String name = entoKo(request.getParameter("name"));
			String from = request.getParameter("from");
			String yn = request.getParameter("yn");
			String client = request.getRemoteAddr();

			inputTable.put("id", session.getAttribute("id"));
			inputTable.put("code", code);
			inputTable.put("name", name);
			inputTable.put("yn", yn);
			inputTable.put("client", client);

			InterestUpdateBean Iub = new InterestUpdateBean();
			Iub.setDataTable(inputTable);
			Iub.funcExecute();
			ArrayList resultList = Iub.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "���ɻ簡 ���������� ���� �Ǿ����ϴ�.";
			}
			else
			{
				message = "���ɻ� ������ Error�� �߻��Ͽ����ϴ�.";
			}

			if(from.equals("list"))
			{
				stepUrl = "/managerInterestServlet.mo?func=managerInterest_001";
			}
			else if(from.equals("info"))
			{
				stepUrl = "/managerInterestServlet.mo?func=managerInterest_002&code="+code;
			}

			moveType = "FW";
			mode = "T";
		}
		// ���ɻ� �߰� ������ ����
		else if(func.equals("managerInterest_006"))
		{
			moveType = "FW";
			mode = "P";
			mainUrl = "/manager/interest/InterestAdd.jsp";
		}
		// ���ɻ� �߰�
		else if(func.equals("managerInterest_007"))
		{
			String name = entoKo(request.getParameter("name"));
			String client = request.getRemoteAddr();

			inputTable.put("id", session.getAttribute("id"));
			inputTable.put("name", name);
			inputTable.put("client", client);

			InterestAddBean Iab = new InterestAddBean();
			Iab.setDataTable(inputTable);
			Iab.funcExecute();
			ArrayList resultList = Iab.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "���ɻ簡 ���������� �߰� �Ǿ����ϴ�.";
			}
			else
			{
				message = "���ɻ� �߰��� Error�� �߻��Ͽ����ϴ�.";
			}

			stepUrl = "/managerInterestServlet.mo?func=managerInterest_001";
			moveType = "FW";
			mode = "T";
		}
		/*// ���ɻ� ���� ��� ����
		else if(func.equals("managerInterest_008"))
		{
			String select = request.getParameter("select");

			inputTable.put("menu", "INTEREST");

			SelectUpdateBean sub = new SelectUpdateBean();
			sub.setDataTable(inputTable);
			sub.funcExecute();
			ArrayList resultList = sub.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "���������� ���� �Ǿ����ϴ�.";
			}
			else
			{
				message = "������ Error�� �߻��Ͽ����ϴ�.";
			}

			stepUrl = "/managerHobbyServlet.mo?func=managerInterest_001";
			moveType = "FW";
			mode = "T";
		}*/
	}
}