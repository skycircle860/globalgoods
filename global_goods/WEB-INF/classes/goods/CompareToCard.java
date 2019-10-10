package goods;

import java.io.*;
import common.db.*;
import common.main.*;
import java.util.*;

public class CompareToCard extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");

		String cn1 = (String)inputTable.get("cn1");
		String cn2 = (String)inputTable.get("cn2");
		String cn3 = (String)inputTable.get("cn3");
		String cn4 = (String)inputTable.get("cn4");
		String month = (String)inputTable.get("month");
		String year = (String)inputTable.get("year");
		String pass = (String)inputTable.get("pass");
		String jumin1 = (String)inputTable.get("jumin1");
		String jumin2 = (String)inputTable.get("jumin2");

		System.out.println(jumin1);

		queryBuffer = new StringBuffer("");
	
		queryBuffer.append("SELECT * FROM CARD_LIST ");
		queryBuffer.append("WHERE CARD_NUM1 = '"+cn1+"' AND CARD_NUM2 = '"+cn2+"' AND CARD_NUM3 = '"+cn3+"' AND CARD_NUM4 = '"+cn4+"' AND CARD_END_MONTH = '"+month+"'");
		queryBuffer.append("AND CARD_END_YEAR = '"+year+"' AND CARD_PASSWORD = '"+pass+"' AND CARD_JUMIN1 = '"+jumin1+"' AND CARD_JUMIN2 = '"+jumin2+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}