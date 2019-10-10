package support;

import common.db.*;
import common.main.*;

public class SupportAddWriteBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String content = (String)inputTable.get("content");
		String client = (String)inputTable.get("client");
		String seq = (String)inputTable.get("seq");

		content = content.replaceAll("'", "''");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO BBS_ADD (");
		queryBuffer.append("SEQ, BBS_SEQ, CONTENT, REG_ID, REG_IP, UPD_ID, UPD_IP");
		queryBuffer.append(") VALUES (");
		queryBuffer.append("BBS_ADD_SEQ.NEXTVAL, "+seq+", '"+content+"', '"+id+"', '"+client+"', '"+id+"', '"+client+"'");
		queryBuffer.append(")");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}