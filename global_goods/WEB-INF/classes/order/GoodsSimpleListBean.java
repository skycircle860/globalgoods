package order;

import common.db.*;
import common.main.*;
import common.util.ItemFileManager;

import java.util.*;

public class GoodsSimpleListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		
		queryBuffer = new StringBuffer("");

//파일꺼내기 ▼
		queryBuffer.append("SELECT ROWNUM, b.*, a.* FROM (SELECT GOODS_CODE, ORG_NAME, SAVE_NAME, ");
		queryBuffer.append("PATH FROM GOODS_IMG WHERE DISPYN='Y') a, (");
//파일꺼내기 ▲
		queryBuffer.append("SELECT ROWNUM DATA_NUM, MIDDLE_CATEGORY, SUB_CATEGORY, MAIN_CATEGORY, CODE, NAME, GOODS_AMOUNT, ORG_PRICE, PAR_PRICE, DISP_YN FROM GOODS ORDER BY CODE ");
//파일꺼내기 ▼
		queryBuffer.append(") b WHERE b.CODE=a.GOODS_CODE(+) ORDER BY ROWNUM");
//파일꺼내기 ▲




		DBExecute dbe = new DBExecute(queryBuffer.toString());
		//파일 꺼내기
		ArrayList tempList = dbe.getDataList();

		String dataNum = "";
		ArrayList fileList = new ArrayList();
		Hashtable goodsTable;
		for(int i=0; i<tempList.size(); i++)
		{
			Hashtable tempTable = (Hashtable)tempList.get(i);
			String tempDataNum = (String)tempTable.get("DATA_NUM");
			String tempOrgName = (String)tempTable.get("ORG_NAME");
			String tempSaveName = (String)tempTable.get("SAVE_NAME");
			String tempPath = (String)tempTable.get("PATH");
			
			System.out.println("tempSaveName : "+tempSaveName);
			if(!dataNum.equals(tempDataNum))
			{
				tempTable.remove("ORG_NAME");
				tempTable.remove("SAVE_NAME");
				tempTable.remove("PATH");

				goodsTable = tempTable;

				fileList = new ArrayList();
				dataNum = tempDataNum;

				goodsTable.put("FILE_LIST", fileList);
				outputList.add(goodsTable);
			}

			Hashtable fileTable = new Hashtable();
			fileTable.put("ORG_NAME", tempOrgName);
			fileTable.put("SAVE_NAME", tempSaveName);
			fileTable.put("PATH", tempPath);

			fileList.add(fileTable);
		}		
	}
}