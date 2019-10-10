package support;

import common.db.*;
import common.main.*;
import java.util.*;

public class SupportDeleteBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String seq = (String)inputTable.get("seq");
		String client = (String)inputTable.get("client");
		String code = (String)inputTable.get("code");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS SET ");
		queryBuffer.append("DISP_YN='N', UPD_ID='"+id+"', UPD_DATE=SYSDATE, UPD_IP='"+client+"' ");
		queryBuffer.append("WHERE SEQ='"+seq+"' AND CODE='"+code+"'");
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}