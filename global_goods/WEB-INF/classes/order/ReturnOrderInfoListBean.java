package order;

import common.db.*;
import common.main.*;

public class ReturnOrderInfoListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		
		String code = (String)inputTable.get("code");
		
		System.out.println("code =====" + code);
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT a.member_id,a.CODE,TO_CHAR(a.REQUEST_DATE, 'YYYY-MM-DD AM HH:MM') REQUEST_DATE,");
		queryBuffer.append("a.RETURN_STATE,a.ACCOUNT_NUM , b.GOODS_AMOUNT,(b.GOODS_AMOUNT*c.PAR_PRICE) PRICE , a.RETURN_COMMENT , a.RETURN_GOODS_DATE, a.REFUND_DATE, ");
		queryBuffer.append("a.HOME1, a.HOME2, a.HOME3, a.OFFICE1, a.OFFICE2, a.OFFICE3, a.MOBILE1, a.MOBILE2, a.MOBILE3, a.ZIPCODE1, a.ZIPCODE2, a.ADDR1, a.ADDR2 ,");			
		queryBuffer.append("c.GOODS_GROUP,c.NAME, (d.NAME)BANKNAME , (f.NAME)MIDNAME, (g.NAME)SUBNAME ");
		queryBuffer.append("FROM RETURN_LIST a ,RETURN_GOODS_LIST b , GOODS c, BANK_LIST d , MIDDLE_CATEGORY f, SUB_CATEGORY g ");
		queryBuffer.append("WHERE '"+code+"' =a.CODE AND  '"+code+"' = b.RETURN_CODE AND b.GOODS_CODE = c.GOODS_GROUP AND d.CODE = a.BANK_CODE ");
		queryBuffer.append("AND SUBSTR(c.GOODS_GROUP,2,3) = f.CODE AND SUBSTR(c.GOODS_GROUP,5,3) = g.CODE");	
	
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}