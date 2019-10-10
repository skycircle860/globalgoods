package service;

import common.conf.*;
import common.main.*;
import manager.support.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ManagerSupportServlet extends MainServlet
{
	public void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception
	{
		/** �Խ��� ���*/
		if(func.equals("managerSupport_001"))
		{
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/support/SupportInfoList.jsp";
		}

		
		//�Խ��� �� ����
		if(func.equals("managerSupport_002"))
		{
			String code = request.getParameter("code");

			inputTable.put("code", code);

			SupportInfoViewBean sivb = new SupportInfoViewBean();
			sivb.setDataTable(inputTable);
			sivb.funcExecute();
			ArrayList supportInfoViewList = sivb.getDataList();

			outputTable.put("supportInfoViewList", supportInfoViewList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/support/SupportInfoView.jsp";
		}
		 //�Խ��� ��� ������ ����/
		if(func.equals("managerSupport_003"))
		{
			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/support/SupportInfoAdd.jsp";
		}
		
		// �Խ��� ���/
		if(func.equals("managerSupport_004"))
		{
			String name = request.getParameter("name");
			String code = request.getParameter("code");
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
			inputTable.put("code", code);
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

			SupportInfoAddBean siab = new SupportInfoAddBean();
			siab.setDataTable(inputTable);
			siab.funcExecute();
			ArrayList resultList = siab.getDataList();

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
			inputTable.put("func", "managerSupport_001");

			moveType = "FW";
			mode = "T";
			stepUrl = "/managerSupportServlet.mo";
		}
		// �Խ��� ���� ������ ����/
		if(func.equals("managerSupport_005"))
		{
			String code = request.getParameter("code");
			String from = request.getParameter("from");

			inputTable.put("code", code);
			inputTable.put("from", from);

			SupportInfoViewBean sivb = new SupportInfoViewBean();
			sivb.setDataTable(inputTable);
			sivb.funcExecute();
			ArrayList supportInfoViewList = sivb.getDataList();

			outputTable.put("supportInfoViewList", supportInfoViewList);

			moveType = "FW";
			mode = "S";
			mainUrl = "/manager/support/SupportInfoUpdate.jsp";
		}
		// �Խ��� ����/
		if(func.equals("managerSupport_006"))
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


			SupportInfoUpdateBean siub = new SupportInfoUpdateBean();
			siub.setDataTable(inputTable);
			siub.funcExecute();
			ArrayList resultList = siub.getDataList();

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
				inputTable.put("func", "managerSupport_001");
			}
			else if(from.equals("info"))
			{
				inputTable.put("func", "managerSupport_002");
				inputTable.put("code", code);
			}

			moveType = "FW";
			mode = "T";
			stepUrl = "/managerSupportServlet.mo";
		}
		// �Խ��� ��� or ����/
		if(func.equals("managerSupport_007"))
		{
			String code = request.getParameter("code");
			String yn = request.getParameter("yn");
			String id = (String)session.getAttribute("id");
			String client = request.getRemoteAddr();

			inputTable.put("code", code);
			inputTable.put("yn", yn);
			inputTable.put("id", id);
			inputTable.put("client", client);

			SupportInfoUseYnBean siuyb = new SupportInfoUseYnBean();
			siuyb.setDataTable(inputTable);
			siuyb.funcExecute();
			ArrayList resultList = siuyb.getDataList();

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
			inputTable.put("func", "managerSupport_001");

			moveType = "FW";
			mode = "T";
			stepUrl = "/managerSupportServlet.mo";

			
		}
	}
}