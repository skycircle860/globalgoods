package order;

import common.db.*;
import common.main.*;

public class SubInfoBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT a.CODE, a.MAIN_CATEGORY, a.MIDDLE_CATEGORY, a.NAME, a.USEYN, a.REG_ID, a.REG_IP, ");
		queryBuffer.append("TO_CHAR(a.REG_DATE, 'YYYY-MM-DD AM HH:MM') REG_DATE, ");
		queryBuffer.append("a.UPD_IP, a.UPD_DATE, a.UPD_ID, b.NAME MIDDLE_CATEGORY_NAME FROM SUB_CATEGORY a, MIDDLE_CATEGORY b ");
		queryBuffer.append("WHERE a.CODE ='"+code+"' AND b.CODE = a.MIDDLE_CATEGORY");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}