package common.util;

import common.db.*;
import common.main.*;

public class SelectListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String menu = (String)inputTable.get("menu");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT MENU, ITEM FROM MANAGER_SELECT WHERE MENU='"+menu+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}