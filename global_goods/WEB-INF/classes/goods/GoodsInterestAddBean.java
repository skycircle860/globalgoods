package goods;

import java.io.*;
import common.db.*;
import common.main.*;

public class GoodsInterestAddBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String code = (String)inputTable.get("code");
		String client = (String)inputTable.get("client");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO INTEREST_GOODS_LIST (SEQ,MEMBER_ID,GOODS_CODE,USE_YN,REG_ID,REG_DATE,REG_IP,UPD_ID,UPD_DATE,UPD_IP");
		queryBuffer.append(")VALUES(INTEREST_GOODS_LIST_SEQ.NEXTVAL,'"+id+"', '"+code+"', 'Y', '"+id+"',SYSDATE,'"+client+"', '"+id+"', SYSDATE,'"+client+"')");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}