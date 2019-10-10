package goods;

import java.io.*;
import common.db.*;
import common.main.*;
import java.util.*;

public class ShoppingCartUseUpdate extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		ArrayList goodsBuyList = (ArrayList)inputTable.get("goodsBuyList");
		
		for (int i = 0; i < goodsBuyList.size(); i++)
		{
			Hashtable goodsTable = (Hashtable)goodsBuyList.get(i);
			String code = (String)goodsTable.get("code");

			queryBuffer = new StringBuffer("");
		
			queryBuffer.append("DELETE FROM CART_GOODS_LIST WHERE GOODS_CODE = '"+code+"' AND MEMBER_ID = '"+id+"'");
			DBExecute dbe = new DBExecute(queryBuffer.toString());
		}
	}
}