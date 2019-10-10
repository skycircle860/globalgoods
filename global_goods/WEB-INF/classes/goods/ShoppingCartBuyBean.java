package goods;

import java.io.*;
import common.db.*;
import common.main.*;
import java.util.*;

public class ShoppingCartBuyBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		ArrayList goodsBuyList = (ArrayList)inputTable.get("goodsBuyList");
		String id = (String)inputTable.get("id");

		ArrayList tempList = new ArrayList();
		ArrayList goodsList = new ArrayList();
		for (int i = 0 ; i < goodsBuyList.size(); i++)
		{
			Hashtable goodsTable = (Hashtable)goodsBuyList.get(i);
			String code = (String)goodsTable.get("code");
			queryBuffer = new StringBuffer("");
			queryBuffer.append("SELECT A.GOODS_CODE, A.GOODS_AMOUNT, B.NAME,B.PAR_PRICE, C.PATH, C.SAVE_NAME ");
			queryBuffer.append("FROM CART_GOODS_LIST A, GOODS B, GOODS_IMG C ");
			queryBuffer.append("WHERE A.MEMBER_ID='"+id+"' AND A.USE_YN='Y' AND A.CHK_YN = 'Y' AND A.GOODS_CODE='"+code+"' AND A.GOODS_CODE = B.CODE AND A.GOODS_CODE = C.GOODS_CODE");
		
			DBExecute dbe = new DBExecute(queryBuffer.toString());
			tempList = dbe.getDataList();
			goodsList.add(tempList);
		}

		System.out.println("구매리스트 호출 완료");

		outputList = goodsList;
	}
}