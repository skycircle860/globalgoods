package manager.support;

import common.db.*;
import common.main.*;

public class SupportInfoViewBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT CODE, NAME, USE_YN, PER_PAGE, SEARCH_YN, REPLY_YN, REPLY_SORT, ");
		queryBuffer.append("ADD_YN, ADD_SORT, UPDATE_YN, NUMBER_TYPE, FILE_YN, ");
		queryBuffer.append("REG_ID, TO_CHAR(REG_DATE, 'YYYY-MM-DD AM HH:MI:SS') REG_DATE, REG_IP, ");
		queryBuffer.append("UPD_ID, TO_CHAR(UPD_DATE, 'YYYY-MM-DD AM HH:MI:SS') UPD_DATE, UPD_IP ");
		queryBuffer.append("FROM BBS_INFO WHERE CODE='" + code + "'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}