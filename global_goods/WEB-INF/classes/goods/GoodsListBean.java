package goods;

import java.io.*;
import common.db.*;
import common.main.*;
import common.util.ItemFileManager;
import java.util.*;

public class GoodsListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		//검색용 String ▼
		String goodsWord = (String)inputTable.get("goodsWord");
		String section = (String)inputTable.get("section");

		//검색용 String ▲


		String middleCategory = (String)inputTable.get("middleCategory");
		String alignSelect = (String)inputTable.get("alignSelect");
		
		
		System.out.println("*********GoodsListBean**********");
		System.out.println("goodsWord :\t\t"+goodsWord);
		System.out.println("section :\t\t"+section);
		System.out.println("middleCategory :\t"+middleCategory);
		System.out.println("alignSelect :\t\t"+alignSelect);
		System.out.println("*********GoodsListBean**********");

		if (alignSelect.equals("PAR_PRICE_LOW"))
		{
			alignSelect = "PAR_PRICE DESC";
		}
		else if (alignSelect.equals("PAR_PRICE_HIGH"))
		{
			alignSelect = "PAR_PRICE ASC";
		}

		queryBuffer = new StringBuffer("");
//검색기능 추가▼
		queryBuffer.append("SELECT c.* FROM (");
//검색기능 추가▲

//파일꺼내기 ▼
		queryBuffer.append("SELECT b.*, a.* FROM (SELECT GOODS_CODE, ORG_NAME, SAVE_NAME, ");
		queryBuffer.append("PATH FROM GOODS_IMG WHERE DISPYN='Y') a, (");
//파일꺼내기 ▲

		queryBuffer.append("SELECT ROWNUM DATA_NUM, CODE,SUB_CATEGORY,NAME,QUANTITY, ");
		queryBuffer.append("ORG_PRICE,PAR_PRICE, COUNTRY,COMPANY,GOODS_COMMENT,GOODS_HIT, DISP_YN, ");
		queryBuffer.append("REG_ID, UPD_DATE FROM GOODS "); 
		//미들카테고리
		if (!middleCategory.equals(""))
		{
			queryBuffer.append("WHERE MIDDLE_CATEGORY='"+middleCategory+"' AND DISP_YN = 'Y' ");
		}

//파일꺼내기 ▼
		queryBuffer.append(") b WHERE b.CODE=a.GOODS_CODE(+) ");
		
		//정렬
		if (!alignSelect.equals(""))
		{
			if (alignSelect.equals("GOODS_HIT"))
			{
				queryBuffer.append("ORDER BY "+alignSelect+" DESC ");
			}
			else
			{
				queryBuffer.append("ORDER BY "+alignSelect);
			}
		}
		else
		{
			queryBuffer.append("ORDER BY NAME");
		}
//파일꺼내기 ▲


//검색기능 추가▼
		queryBuffer.append(") c ");
		if (section.equals("GN"))	//이름
		{
			queryBuffer.append(" WHERE c.NAME LIKE '%"+goodsWord+"%' AND c.DISP_YN='Y' ");
		}
		else if (section.equals("GC"))	//회사
		{
			queryBuffer.append(" WHERE c.COMPANY LIKE '%"+goodsWord+"%' AND c.DISP_YN='Y' ");
		}	
		else if (section.equals("OC"))	//나라
		{
			queryBuffer.append(" WHERE c.COUNTRY LIKE '%"+goodsWord+"%' AND c.DISP_YN='Y' ");
		}
//검색기능 추가▲
		
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		

		//파일 꺼내기
		ArrayList tempList = dbe.getDataList();

		/*
		System.out.println("**************여기는 ListBean***********");
		System.out.println("*****************************************");
		System.out.println("tempList : "+tempList);
		System.out.println("****************************************");
		*/

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
			
		//	System.out.println("tempSaveName : "+tempSaveName);
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