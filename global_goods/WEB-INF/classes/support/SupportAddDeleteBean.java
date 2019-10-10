package support;

import common.db.*;
import common.main.*;
import java.util.*;

public class SupportAddDeleteBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String addSeq = (String)inputTable.get("addSeq");
		String client = (String)inputTable.get("client");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS_ADD SET ");
		queryBuffer.append("DISP_YN='N', UPD_ID='"+id+"', UPD_DATE=SYSDATE, UPD_IP='"+client+"' ");
		queryBuffer.append("WHERE SEQ='"+addSeq+"'");
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}