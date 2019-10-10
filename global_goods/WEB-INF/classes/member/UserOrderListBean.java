package member;

import common.db.*;
import common.main.*;

public class UserOrderListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		

		String id =(String)inputTable.get("id");
		String from = "";
		String code="";
		if (inputTable.get("from") != null)
		{
			from = (String)inputTable.get("from");
			code = (String)inputTable.get("code");

			System.out.println("userOrderListBean check ="+code);
		}


		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT a.CODE,c.NAME,(c.PAR_PRICE * b.GOODS_AMOUNT)PRICE,b.GOODS_AMOUNT,a.ORDER_STATE ,a.ORDER_DATE ");
		queryBuffer.append(", a.DEPOSITYN,a.CANCLEYN , b.GOODS_CODE ");
		queryBuffer.append("FROM ORDER_LIST a, ORDER_GOODS_LIST b, GOODS c ");
		queryBuffer.append(" WHERE a.MEMBER_ID = '"+id+"' AND a.CODE = b.ORDER_CODE AND b.GOODS_CODE = c.CODE");

		if(from.equals("cancle"))
		{
			queryBuffer.append(" AND b.GOODS_CODE = '"+code+"'");
		}

	


		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}