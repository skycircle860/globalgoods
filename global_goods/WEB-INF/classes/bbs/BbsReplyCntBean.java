package bbs;

import common.db.*;
import common.main.*;

public class BbsReplyCntBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String seq = (String)inputTable.get("seq");
		String step = (String)inputTable.get("step");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT B.SEQ FROM BBS A, BBS B WHERE A.GROUP_NUM = B.GROUP_NUM ");
		queryBuffer.append("AND A.SEQ='" + seq + "' AND A.WIDTH<B.WIDTH AND B.DISP_YN='Y'");
		//���� ���̺� �� �ΰ� ����ؼ� �׷���� ���� ���ð����� ����
		if(!step.equals("000"))
		{
			queryBuffer.append(" AND B.STEP LIKE '" + step + "%'");
		}

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}