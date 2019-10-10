package common.util;

import common.db.*;
import common.main.*;

public class SelectUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String select = (String)inputTable.get("select");
		String menu = (String)inputTable.get("menu");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE MANAGER_SELECT SET ITEM = '" + select + "' WHERE MENU = '" + menu + "'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}