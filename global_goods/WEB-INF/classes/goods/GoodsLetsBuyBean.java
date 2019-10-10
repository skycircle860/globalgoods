package goods;

import java.io.*;
import common.db.*;
import common.main.*;
import java.util.*;

public class GoodsLetsBuyBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT A.CODE, A.NAME, A.PAR_PRICE, C.PATH, C.SAVE_NAME ");
		queryBuffer.append("FROM  GOODS A, GOODS_IMG C ");
		queryBuffer.append("WHERE A.CODE = '"+code+"' AND A.CODE = C.GOODS_CODE ");
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
		
		System.out.println("구매리스트 호출 완료");
	}
}