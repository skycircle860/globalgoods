package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class GoodsSelectBean extends MainBean
{


	public void funcExecute() throws Exception
	{

		String code = (String)inputTable.get("code");
		
		System.out.println("code goodsselectBean == "+code);
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT a.CODE,(b.CODE)MCODE,(c.CODE)SCODE, a.MAIN_CATEGORY,a.MIDDLE_CATEGORY, a.SUB_CATEGORY, ");
		queryBuffer.append("a.NAME, a.DISP_YN , a.ORG_PRICE, a.PAR_PRICE,a.COUNTRY,a.COMPANY,a.GOODS_COMMENT, ");
		queryBuffer.append("a.QUANTITY,a.GOODS_AMOUNT, (b.NAME)MNAME, (c.NAME)SNAME FROM GOODS a ,MIDDLE_CATEGORY b, SUB_CATEGORY c  ");
		queryBuffer.append("WHERE '"+code +"' = a.CODE AND b.CODE = a.MIDDLE_CATEGORY AND c.code = a.SUB_CATEGORY");
		
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();

		
	
		

	}


}