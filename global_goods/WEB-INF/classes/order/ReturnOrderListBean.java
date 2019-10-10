package order;

import common.db.*;
import common.main.*;

public class ReturnOrderListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		Integer articleStartNum = (Integer)inputTable.get("articleStartNum");
		Integer articleEndNum = (Integer)inputTable.get("articleEndNum");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT j.* FROM (SELECT ROWNUM DATA_NUM,i.* FROM(SELECT ROWNUM DISP_NUM, h.* FROM( ");
		queryBuffer.append("SELECT a.CODE,TO_CHAR(a.REQUEST_DATE, 'YYYY-MM-DD AM HH:MM') REQUEST_DATE, ");
        queryBuffer.append("a.RETURN_STATE,a.ACCOUNT_NUM ,(b.GOODS_AMOUNT*c.PAR_PRICE) PRICE ,c.GOODS_GROUP,c.NAME  ");
		queryBuffer.append("FROM RETURN_LIST a ,RETURN_GOODS_LIST b , GOODS c WHERE a.CODE = b.RETURN_CODE AND b.GOODS_CODE = c.GOODS_GROUP ");
		queryBuffer.append(") h ORDER BY DISP_NUM DESC)i)j WHERE DATA_NUM >= '"+articleStartNum +"' AND DATA_NUM<='"+ articleEndNum+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}