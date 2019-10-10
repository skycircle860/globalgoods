package order;

import common.db.*;
import common.main.*;

public class OrderListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String sort = (String)inputTable.get("sort");

		Integer articleStartNum = (Integer)inputTable.get("articleStartNum");
		Integer articleEndNum = (Integer)inputTable.get("articleEndNum");
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT j.* FROM (SELECT ROWNUM DATA_NUM,i.* FROM(SELECT ROWNUM DISP_NUM, h.* FROM( ");
		queryBuffer.append("SELECT a.CODE,TO_CHAR(a.ORDER_DATE, 'YYYY-MM-DD AM HH:MM') ORDER_DATE, a.CANCLEYN,a.USEYN,");
		queryBuffer.append("a.ORDER_STATE,a.DEPOSITYN,(b.GOODS_AMOUNT*c.PAR_PRICE) PRICE ,c.GOODS_GROUP,c.NAME ");
		queryBuffer.append("FROM ORDER_LIST a ,ORDER_GOODS_LIST b , GOODS c WHERE a.CODE = b.ORDER_CODE AND b.GOODS_CODE = c.GOODS_GROUP ");
		queryBuffer.append(") h ORDER BY DISP_NUM DESC)i)j WHERE DATA_NUM >= '"+articleStartNum +"' AND DATA_NUM<='"+ articleEndNum+"'");
		
		/*
		if(sort.equals("A"))
		{
			queryBuffer.append("ORDER BY ORDER_DATE");
		}
		if(sort.equals("C"))
		{
			queryBuffer.append("ORDER BY  ORDER_STATE");
		}
		if(sort.equals("S"))
		{
			queryBuffer.append("ORDER BY  ORDER_STATE DESC");
		}
		if(sort.equals("R"))
		{
			queryBuffer.append("AND ORDER_STATE = 'R'");
		}


	*/


		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}