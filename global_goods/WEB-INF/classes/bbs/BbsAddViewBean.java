package bbs;

import common.db.*;
import common.main.*;

public class BbsAddViewBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		BbsInfomation bi = new BbsInfomation(code);

		String seq = (String)inputTable.get("seq");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT a.SEQ, a.CONTENT, a.REG_ID, b.NAME, ");
		queryBuffer.append("TO_CHAR(a.REG_DATE, 'YYYY-MM-DD AM HH:MI:SS') REG_DATE FROM BBS_ADD a, MEMBER b ");
		queryBuffer.append("WHERE a.REG_ID=b.ID AND a.DISP_YN='Y' AND a.BBS_SEQ='"+seq+"' ");
		queryBuffer.append("ORDER BY a.SEQ "+bi.getAddSort());

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}