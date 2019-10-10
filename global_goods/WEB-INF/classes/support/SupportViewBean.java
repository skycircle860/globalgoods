package support;

import common.db.*;
import common.main.*;
import java.util.*;

public class SupportViewBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String seq = (String)inputTable.get("seq");
		String code = (String)inputTable.get("code");

		queryBuffer = new StringBuffer("");

		queryBuffer.append("SELECT a.SEQ, a.GROUP_NUM, a.WIDTH, a.STEP, a.TITLE, ");
		queryBuffer.append("a.CONTENT, a.HIT_CNT, a.REG_ID, b.NAME, ");
		queryBuffer.append("TO_CHAR(a.UPD_DATE, 'YYYY-MM-DD AM HH:MI:SS') UPD_DATE, ");
		queryBuffer.append("TO_CHAR(a.REG_DATE, 'YYYY-MM-DD AM HH:MI:SS') REG_DATE ");
		queryBuffer.append("FROM BBS a, MEMBER b ");
		queryBuffer.append("WHERE a.REG_ID=b.ID AND a.SEQ='"+seq+"' AND CODE='"+code+"'");
		
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}
