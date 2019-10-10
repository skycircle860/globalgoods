package goods;

import java.io.*;
import common.db.*;
import common.main.*;
import java.util.*;

public class GoodsCartDeleteBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		String id = (String)inputTable.get("id");
		
		queryBuffer = new StringBuffer("");
		
		queryBuffer.append("DELETE FROM CART_GOODS_LIST WHERE GOODS_CODE = '"+code+"' AND MEMBER_ID = '"+id+"'");
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}