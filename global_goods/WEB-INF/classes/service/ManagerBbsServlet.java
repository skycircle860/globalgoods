package service;

import common.conf.*;
import common.main.*;
import manager.bbs.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ManagerBbsServlet extends MainServlet
{
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		/** �Խ��� ���*/
		if(func.equals("managerBbs_001"))
		{
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/bbs/BbsInfoList.jsp";
		}
		/** �Խ��� �� ����*/
		if(func.equals("managerBbs_002"))
		{
			String code = request.getParameter("code");

			inputTable.put("code", code);

			BbsInfoViewBean bivb = new BbsInfoViewBean();
			bivb.setDataTable(inputTable);
			bivb.funcExecute();
			ArrayList bbsInfoViewList = bivb.getDataList();

			outputTable.put("bbsInfoViewList", bbsInfoViewList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/bbs/BbsInfoView.jsp";
		}
		/** �Խ��� ��� ������ ����*/
		if(func.equals("managerBbs_003"))
		{
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/bbs/BbsInfoAdd.jsp";
		}
		/** �Խ��� ���*/
		if(func.equals("managerBbs_004"))
		{
			String name = request.getParameter("name");
			String useYn = request.getParameter("useYn");
			String perPage = request.getParameter("perPage");
			String updateYn = request.getParameter("updateYn");
			String searchYn = request.getParameter("searchYn");
			String numberType = request.getParameter("numberType");
			String replyYn = request.getParameter("replyYn");
			String replySort = request.getParameter("replySort");
			String addYn = request.getParameter("addYn");
			String addSort = request.getParameter("addSort");
			String fileYn = request.getParameter("fileYn");

			String id = (String)session.getAttribute("id");
			String client = request.getRemoteAddr();

			inputTable.put("name", entoKo(name));
			inputTable.put("useYn", useYn);
			inputTable.put("perPage", perPage);
			inputTable.put("updateYn", updateYn);
			inputTable.put("searchYn", searchYn);
			inputTable.put("numberType", numberType);
			inputTable.put("replyYn", replyYn);
			inputTable.put("replySort", replySort);
			inputTable.put("addYn", addYn);
			inputTable.put("addSort", addSort);
			inputTable.put("fileYn", fileYn);

			inputTable.put("id", id);
			inputTable.put("client", client);

			BbsInfoAddBean biab = new BbsInfoAddBean();
			biab.setDataTable(inputTable);
			biab.funcExecute();
			ArrayList resultList = biab.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "�Խ����� ���������� ��� �Ǿ����ϴ�.";

				// DB�� �ִ� �޴� ���� �� Loading
				ReadConf rc = ReadConf.getReadConf();
				rc.setReadDBData();
			}
			else
			{
				message = "�Խ��� ��� �� Error�� �߻��Ͽ����ϴ�.";
			}

			inputTable = new Hashtable();
			inputTable.put("func", "managerBbs_001");

			moveType = "FW";
			mode = "T";
			stepUrl = "/managerBbsServlet.mo";
		}
		/** �Խ��� ���� ������ ����*/
		if(func.equals("managerBbs_005"))
		{
			String code = request.getParameter("code");
			String from = request.getParameter("from");

			inputTable.put("code", code);
			inputTable.put("from", from);

			BbsInfoViewBean bivb = new BbsInfoViewBean();
			bivb.setDataTable(inputTable);
			bivb.funcExecute();
			ArrayList bbsInfoViewList = bivb.getDataList();

			outputTable.put("bbsInfoViewList", bbsInfoViewList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/bbs/BbsInfoUpdate.jsp";
		}
		/** �Խ��� ����*/
		if(func.equals("managerBbs_006"))
		{
			String code = request.getParameter("code");
			String from = request.getParameter("from");

			String name = request.getParameter("name");
			String useYn = request.getParameter("useYn");
			String perPage = request.getParameter("perPage");
			String updateYn = request.getParameter("updateYn");
			String searchYn = request.getParameter("searchYn");
			String numberType = request.getParameter("numberType");
			String replyYn = request.getParameter("replyYn");
			String replySort = request.getParameter("replySort");
			String addYn = request.getParameter("addYn");
			String addSort = request.getParameter("addSort");
			String fileYn = request.getParameter("fileYn");

			String id = (String)session.getAttribute("id");
			String client = request.getRemoteAddr();

			inputTable.put("code", code);
			inputTable.put("name", entoKo(name));
			inputTable.put("useYn", useYn);
			inputTable.put("perPage", perPage);
			inputTable.put("updateYn", updateYn);
			inputTable.put("searchYn", searchYn);
			inputTable.put("numberType", numberType);
			inputTable.put("replyYn", replyYn);
			inputTable.put("replySort", replySort);
			inputTable.put("addYn", addYn);
			inputTable.put("addSort", addSort);
			inputTable.put("fileYn", fileYn);

			inputTable.put("id", id);
			inputTable.put("client", client);


			BbsInfoUpdateBean biub = new BbsInfoUpdateBean();
			biub.setDataTable(inputTable);
			biub.funcExecute();
			ArrayList resultList = biub.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "�Խ��� ������ ���������� ���� �Ǿ����ϴ�.";

				// DB�� �ִ� �޴� ���� �� Loading
				ReadConf rc = ReadConf.getReadConf();
				rc.setReadDBData();
			}
			else
			{
				message = "�Խ��� ���� ���� �� Error�� �߻��Ͽ����ϴ�.";
			}

			inputTable = new Hashtable();
			if(from.equals("list"))
			{
				inputTable.put("func", "managerBbs_001");
			}
			else if(from.equals("info"))
			{
				inputTable.put("func", "managerBbs_002");
				inputTable.put("code", code);
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/managerBbsServlet.mo";
		}
		/** �Խ��� ��� or ����*/
		if(func.equals("managerBbs_007"))
		{
			String code = request.getParameter("code");
			String yn = request.getParameter("yn");
			String id = (String)session.getAttribute("id");
			String client = request.getRemoteAddr();

			inputTable.put("code", code);
			inputTable.put("yn", yn);
			inputTable.put("id", id);
			inputTable.put("client", client);

			BbsInfoUseYnBean biuyb = new BbsInfoUseYnBean();
			biuyb.setDataTable(inputTable);
			biuyb.funcExecute();
			ArrayList resultList = biuyb.getDataList();

			int resultCount = Integer.parseInt((String)((Hashtable)resultList.get(0)).get("COUNT"));
			if(resultCount>0)
			{
				message = "�Խ��� ������ ���������� ���� �Ǿ����ϴ�.";

				// DB�� �ִ� �޴� ���� �� Loading
				ReadConf rc = ReadConf.getReadConf();
				rc.setReadDBData();
			}
			else
			{
				message = "�Խ��� ���� ���� �� Error�� �߻��Ͽ����ϴ�.";
			}

			inputTable = new Hashtable();
			inputTable.put("func", "managerBbs_001");

			moveType = "FW";
			mode = "T";
			stepUrl = "/managerBbsServlet.mo";
		}
	}
}