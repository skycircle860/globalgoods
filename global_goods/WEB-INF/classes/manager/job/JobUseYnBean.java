package manager.job;

import common.db.*;
import common.main.*;

public class JobUseYnBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String yn = (String)inputTable.get("yn");
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE JOB SET USEYN='" + yn + "', UPD_ID='" + id + "', UPD_DATE=SYSDATE, UPD_IP='" + client + "' WHERE CODE = '" + code + "'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}