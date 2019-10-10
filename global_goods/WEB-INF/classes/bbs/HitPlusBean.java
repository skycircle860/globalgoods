package bbs;

import common.db.*;
import common.main.*;

public class HitPlusBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String seq = (String)inputTable.get("seq");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE BBS SET HIT_CNT=HIT_CNT+1 ");
		queryBuffer.append("WHERE SEQ='"+seq+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}