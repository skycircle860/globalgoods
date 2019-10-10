package order;

import common.db.*;
import common.main.*;

public class MiddleUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String name = (String)inputTable.get("name");
		String yn = (String)inputTable.get("useYn");
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		String maincategory = (String)inputTable.get("maincategory");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE MIDDLE_CATEGORY SET NAME = '" + name + "',MAIN_CATEGORY = '"+maincategory+"', USEYN='" + yn + "', UPD_ID='" + id + "', UPD_DATE=SYSDATE, UPD_IP='" + client + "' WHERE CODE = '" + code + "'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}