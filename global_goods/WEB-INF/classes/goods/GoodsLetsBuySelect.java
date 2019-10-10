package goods;

import java.io.*;
import common.db.*;
import common.main.*;

public class GoodsLetsBuySelect extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String code = (String)inputTable.get("code");
		String amount = (String)inputTable.get("amount");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT A.CODE,A.NAME,A.PAR_PRICE,B.PATH,B.SAVE_NAME ");
		queryBuffer.append("FROM GOODS A, GOODS_IMG B ");
		queryBuffer.append("WHERE A.CODE = '"+code+"'  AND A.CODE = B.GOODS_CODE");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}