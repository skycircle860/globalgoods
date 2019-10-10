package goods;

import java.io.*;
import common.db.*;
import common.main.*;

public class GoodsCartSearchBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String id = (String)inputTable.get("id");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT GOODS_CODE FROM CART_GOODS_LIST WHERE MEMEBER_ID = '"+id+"' AND GOODS_CODE='"+code+"' AND USE_YN = 'Y'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}