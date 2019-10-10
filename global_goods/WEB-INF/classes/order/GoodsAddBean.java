package order;

import common.db.*;
import common.main.*;
import common.util.ItemFileManager;

import java.util.*;

public class GoodsAddBean extends MainBean
{


	public void funcExecute() throws Exception
	{

			String id = (String)inputTable.get("id");
			String client = (String)inputTable.get("client");
			String maincategory= (String)inputTable.get("maincategory");
			String middlecategory= (String)inputTable.get("middlecategory");
			String subcategory= (String)inputTable.get("subcategory");
			String name = (String)inputTable.get("name");
			String orgPrice= (String)inputTable.get("orgPrice");
			String parPrice= (String)inputTable.get("parPrice");
			String country= (String)inputTable.get("country");
			String company= (String)inputTable.get("company");
			String goodsComment = (String)inputTable.get("goodsComment");
			String quantity= (String)inputTable.get("quantity");
			String goodsAmount= (String)inputTable.get("goodsAmount");
		
		
		int test = 2;  //subcategory 에 임시로 값을 저장하기 위함. 추후 수정.
		
		String seq = getNextSeq();
		inputTable.put("seq", seq);
		
		String code = seq;
		for (int i = code.length();i<6 ;i++ )
		{
			code = "0"+code;
		}

		code = maincategory+middlecategory+subcategory+code;
		System.out.println("완성된 code값 : "+code);

		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO GOODS (CODE, MAIN_CATEGORY,MIDDLE_CATEGORY, SUB_CATEGORY, GOODS_GROUP,");
		queryBuffer.append("NAME, ORG_PRICE, PAR_PRICE,COUNTRY,COMPANY,GOODS_COMMENT,QUANTITY,GOODS_AMOUNT,REG_ID,REG_DATE,REG_IP,UPD_ID,UPD_DATE,UPD_IP ");
		queryBuffer.append(") VALUES (");
		queryBuffer.append(" '"+code+"', '"+maincategory+"', '"+middlecategory+"','");
		queryBuffer.append(subcategory+"', '"+code+"' ,'"+name+"','"+orgPrice+"','"+parPrice+"','" );
		queryBuffer.append(country+"','"+company+"','"+goodsComment+"','"+quantity+"','"+goodsAmount+"','"+id+"', SYSDATE, '"+client+"', '"+id+"', SYSDATE, '"+client+"'");
		queryBuffer.append(")");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
		

		inputTable.put("code", code);

		System.out.println("ohno2");
		ItemFileManager ifm = new ItemFileManager();
		int uploadCount = ifm.uploadFile(inputTable);
		
		System.out.println(uploadCount);
		inputTable.put("uploadFile", uploadCount+"");

	}

		private String getNextSeq() throws Exception
	{
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT GOODS_SEQ.NEXTVAL NEXT_SEQ FROM DUAL");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		ArrayList seqList =dbe.getDataList();
		Hashtable seqTable = (Hashtable)seqList.get(0);
		return (String)seqTable.get("NEXT_SEQ");
	}

}