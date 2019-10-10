package goods;

import java.io.*;
import common.db.*;
import common.main.*;

public class GoodsCartAddBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String code = (String)inputTable.get("code");
		String amount = (String)inputTable.get("amount");
		String client = (String)inputTable.get("client");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO CART_GOODS_LIST (SEQ,MEMBER_ID,GOODS_CODE,GOODS_AMOUNT,USE_YN,REG_ID,REG_DATE,REG_IP,UPD_ID,UPD_DATE,UPD_IP");
		queryBuffer.append(")VALUES(CART_GOODS_LIST_SEQ.NEXTVAL,'"+id+"', '"+code+"', '"+amount+"', 'Y', '"+id+"',SYSDATE,'"+client+"', '"+id+"', SYSDATE,'"+client+"')");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}