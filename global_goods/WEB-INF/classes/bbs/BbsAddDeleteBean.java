package bbs;

import common.db.*;
import common.main.*;

public class BbsAddDeleteBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		String addSeq = (String)inputTable.get("addSeq");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS_ADD SET ");
		queryBuffer.append("DISP_YN='N', UPD_ID='"+id+"', UPD_DATE=SYSDATE, UPD_IP='"+client+"' ");
		queryBuffer.append("WHERE SEQ="+addSeq);

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}