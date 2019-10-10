package manager.bbs;

import common.db.*;
import common.main.*;

public class BbsInfoUseYnBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String yn = (String)inputTable.get("yn");
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS_INFO SET USE_YN='" + yn + "', UPD_ID='" + id + "', ");
		queryBuffer.append("UPD_DATE=SYSDATE, UPD_IP='" + client + "' WHERE CODE = '" + code + "'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}