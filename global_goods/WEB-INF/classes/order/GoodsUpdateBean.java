package order;

import common.db.*;
import common.main.*;
import common.util.ItemFileManager;

import java.util.*;

public class GoodsUpdateBean extends MainBean
{


	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
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
		
		//이미지의 code값도 바꿔줘야함
		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE GOODS SET MAIN_CATEGORY = '"+maincategory+"', ");
		queryBuffer.append("MIDDLE_CATEGORY = '"+middlecategory+"', SUB_CATEGORY ='"+subcategory+"', GOODS_GROUP=CONCAT('"+(maincategory+middlecategory+subcategory)+"', LPAD(GOODS_SEQ.NEXTVAL,6,'0'))");
		queryBuffer.append(" , NAME='"+name+"', ORG_PRICE='"+orgPrice+"', PAR_PRICE='"+parPrice+"',COUNTRY='"+country+"', ");
		queryBuffer.append("COMPANY ='"+company+"',GOODS_COMMENT ='"+goodsComment+"',QUANTITY ='"+quantity+"',GOODS_AMOUNT ='"+goodsAmount+"', ");
		queryBuffer.append(" UPD_ID='"+id+"',UPD_DATE=SYSDATE , UPD_IP='"+client+"' WHERE CODE = '"+code+"'");


		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
		
		inputTable.put("code",code);
		ItemFileManager ifm = new ItemFileManager();
		int deleteCount = ifm.deleteFile(inputTable);
		inputTable.put("deleteFile", deleteCount+"");

		//업로드 파일
		int uploadCount = ifm.uploadFile(inputTable);
		inputTable.put("uploadFile", uploadCount+"");

		System.out.println("GoodsAddBean check");
	}
}