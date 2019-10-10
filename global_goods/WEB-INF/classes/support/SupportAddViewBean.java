package support;

import common.db.*;
import common.main.*;
import java.util.*;

public class SupportAddViewBean extends MainBean
{
	public void funcExecute() throws Exception
	{	
		String code = (String)inputTable.get("code");
		SupportInfomation si = new SupportInfomation(code);
		String seq = (String)inputTable.get("seq");


		queryBuffer = new StringBuffer("");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT a.SEQ, a.CONTENT, a.REG_ID, b.NAME, a.DISP_YN, ");
		queryBuffer.append("TO_CHAR(a.REG_DATE, 'YYYY-MM-DD AM HH:MI:SS') REG_DATE FROM BBS_ADD a, MEMBER b ");
		queryBuffer.append("WHERE a.REG_ID=b.ID AND a.BBS_SEQ='"+seq+"' ");
		queryBuffer.append("ORDER BY a.SEQ "+si.getAddSort());
		
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}
