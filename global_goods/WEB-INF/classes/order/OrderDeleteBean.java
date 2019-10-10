package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class OrderDeleteBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		String from =(String)inputTable.get("from");
		

		queryBuffer = new StringBuffer("");

		if(from.equals("OrderInfo"))
		{
		queryBuffer.append("UPDATE ORDER_LIST SET ");
		queryBuffer.append("UPD_ID = '"+id+"', UPD_DATE= SYSDATE, UPD_IP = '"+client+"', USEYN = 'N' WHERE CODE = '"+code+"'");
		}
		else
		{
			queryBuffer.append("UPDATE GOODS SET ");
			queryBuffer.append("UPD_ID = '"+id+"', UPD_DATE= SYSDATE, UPD_IP = '"+client+"', DISP_YN = 'N' WHERE CODE = '"+code+"'");
		}

		

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
 
	}
}