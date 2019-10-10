package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class ReturnOrderInfoUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		String state = (String)inputTable.get("state");
		
		System.out.println("state = ==== returnorder"+state);

		
		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE RETURN_LIST SET ");
		if(state.equals("R"))
		{
			queryBuffer.append(" RETURN_GOODS_DATE = SYSDATE, ");
		}
		if(state.equals("F"))
		{
			queryBuffer.append(" REFUND_DATE = SYSDATE ,");
		}

		queryBuffer.append("UPD_ID = '"+id+"', UPD_DATE= SYSDATE, UPD_IP = '"+client+"', RETURN_STATE = '"+state+"' WHERE CODE = '"+code+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
/*
		ItemFileManager bfm = new ItemFileManager();
		int uploadCount = bfm.uploadFile(inputTable);
		
		System.out.println(uploadCount);
		inputTable.put("uploadFile", uploadCount+"");
*/
	}
}