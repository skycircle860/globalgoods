package order;

import common.db.*;
import common.main.*;

public class OrderInfoListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		
		String code = (String)inputTable.get("code");
		
		System.out.println("code =====" + code);
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT a.CODE,TO_CHAR(a.ORDER_DATE, 'YYYY-MM-DD AM HH:MM') ORDER_DATE, a.MEMBER_ID,");
		queryBuffer.append("a.ORDER_STATE,a.DEPOSITYN,a.ZIPCODE1, a.ZIPCODE2, a.ADDR1, a.ADDR2, a.ACCOUNT_NUM, a.ORDER_COMMENT, a.CANCLEYN, ");
		queryBuffer.append("a.HOME1, a.HOME2, a.HOME3, a.OFFICE1, a.OFFICE2, a.OFFICE3, a.MOBILE1, a.MOBILE2, a.MOBILE3, a.CANCLE_DATE,a.DEPOSIT_DATE,a.SEND_DATE,a.RECEIVE_DATE ,");
		queryBuffer.append("c.PAR_PRICE ,c.GOODS_GROUP,c.NAME  , (f.NAME)MIDNAME, (g.NAME)SUBNAME  FROM ORDER_LIST a ,ORDER_GOODS_LIST b , GOODS c, MIDDLE_CATEGORY f, SUB_CATEGORY g ");
		queryBuffer.append("WHERE '"+code+"' = a.CODE AND '"+code+"' = b.ORDER_CODE AND b.GOODS_CODE = c.GOODS_GROUP ");
		queryBuffer.append("AND SUBSTR(c.GOODS_GROUP,2,3) = f.CODE AND SUBSTR(c.GOODS_GROUP,5,3) = g.CODE");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}