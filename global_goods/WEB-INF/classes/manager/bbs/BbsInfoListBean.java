package manager.bbs;

import common.db.*;
import common.main.*;

public class BbsInfoListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT CODE, NAME, USE_YN, PER_PAGE, SEARCH_YN, REPLY_YN, REPLY_SORT, ");
		queryBuffer.append("ADD_YN, ADD_SORT, UPDATE_YN, NUMBER_TYPE, REG_ID , FILE_YN ");
		queryBuffer.append("FROM BBS_INFO ORDER BY CODE");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}