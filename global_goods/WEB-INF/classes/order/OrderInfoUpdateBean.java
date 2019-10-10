package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class OrderInfoUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		String state = (String)inputTable.get("state");
		String depositYn = (String)inputTable.get("depositYn");
		String cancleYn = (String)inputTable.get("cancleYn");
		System.out.println("infoUpdateBean" + cancleYn);
		
		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE ORDER_LIST SET ");
		if (cancleYn.equals("Y"))
		{
			queryBuffer.append("CANCLE_DATE =SYSDATE , ");
			System.out.println("cancalYn check");
		}
		
		if (cancleYn.equals("R"))
		{
			queryBuffer.append("REFUND_DATE =SYSDATE , ");
			System.out.println("cancalYn check R");
		}
	
		if (state.equals("S"))
		{
			queryBuffer.append("RECEIVE_DATE = SYSDATE , ");
			System.out.println("state check S");
		}
		if (state.equals("D"))
		{
			queryBuffer.append("DEPOSIT_DATE = SYSDATE , ");
			System.out.println("state check D");
		}
		if (state.equals("R"))
		{
			queryBuffer.append("SEND_DATE =SYSDATE , ");
			System.out.println("state check R");
		}

		queryBuffer.append("UPD_ID = '"+id+"', UPD_DATE= SYSDATE, UPD_IP = '"+client+"', ORDER_STATE = '"+state+"'  , ");
		queryBuffer.append("DEPOSITYN = '"+depositYn+"', CANCLEYN = '"+cancleYn+"' ");
		queryBuffer.append("WHERE CODE = '"+code+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();

	}
}