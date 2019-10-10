package member;

import java.io.*;
import common.db.*;
import common.main.*;

public class UserOrderUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String client= (String)inputTable.get("client");
		String code=(String)inputTable.get("code");
		String comment = (String)inputTable.get("comment");
	

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE ORDER_LIST SET CANCLEYN='Y', ORDER_COMMENT = '"+comment+"', UPD_ID='"+id+"', UPD_DATE=SYSDATE, UPD_IP='"+client+"' ");
		queryBuffer.append("WHERE MEMBER_ID='"+id+"' AND CODE = '"+code+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}