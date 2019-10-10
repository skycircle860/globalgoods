package order;

import common.db.*;
import common.main.*;

public class MiddleInfoBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT CODE, MAIN_CATEGORY,NAME,USEYN,REG_ID,REG_IP,");
		queryBuffer.append("TO_CHAR(REG_DATE, 'YYYY-MM-DD AM HH:MM') REG_DATE,");
		queryBuffer.append("UPD_IP,UPD_DATE,UPD_ID FROM MIDDLE_CATEGORY ");
		queryBuffer.append("WHERE CODE ='"+code+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}