package goods;

import java.io.*;
import common.db.*;
import common.main.*;
import java.util.*;

public class GoodsBuyUpdateBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		ArrayList goodsBuyList = (ArrayList)inputTable.get("goodsBuyList");
		String id = (String)inputTable.get("id");

		for (int i = 0; i < goodsBuyList.size(); i++)
		{
			
			Hashtable goodsTable = (Hashtable)goodsBuyList.get(i);
			String amount = (String)goodsTable.get("amount");
			String code = (String)goodsTable.get("code");

			queryBuffer = new StringBuffer("");
			queryBuffer.append("UPDATE CART_GOODS_LIST SET CHK_YN = 'Y', GOODS_AMOUNT = '"+amount+"' ");
			queryBuffer.append("WHERE MEMBER_ID = '"+id+"' AND GOODS_CODE = '"+code+"'");
			DBExecute dbe = new DBExecute(queryBuffer.toString());
		}
		System.out.println("CHK_YN='Y' 업데이트 완료");
	}
}