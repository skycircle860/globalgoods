package goods;

import java.io.*;
import common.db.*;
import common.main.*;
import java.util.*;

public class GoodsBuyBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String name = (String)inputTable.get("name");
		String mobile1 = (String)inputTable.get("mobile1");
		String mobile2 = (String)inputTable.get("mobile2");
		String mobile3 = (String)inputTable.get("mobile3");
		String home1 = (String)inputTable.get("home1");
		String home2 = (String)inputTable.get("home2");
		String home3 = (String)inputTable.get("home3");
		String office1 = (String)inputTable.get("office1");
		String office2 = (String)inputTable.get("office2");
		String office3 = (String)inputTable.get("office3");
		String zipCode1 = (String)inputTable.get("zipCode1");
		String zipCode2 = (String)inputTable.get("zipCode2");
		String addr1 = (String)inputTable.get("addr1");
		String addr2 = (String)inputTable.get("addr2");
		String client = (String)inputTable.get("client");

		String selectApproval = (String)inputTable.get("selectApproval");

		//ORDER_LIST의 시퀀스값 불러오기
		String seqQuery = "SELECT ORDER_LIST_SEQ.NEXTVAL SEQ FROM DUAL";
		queryBuffer = new StringBuffer("");
		queryBuffer.append(seqQuery.toString());
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		
		ArrayList seqList = dbe.getDataList();
		Hashtable seqTable = (Hashtable)seqList.get(0);
		String seq = (String)seqTable.get("SEQ");

		//ORDER_GOODS_LIST에 데이터 추가
		ArrayList goodsBuyList = (ArrayList)inputTable.get("goodsBuyList");

		System.out.println("goodsBuyList::::::::::::::::::::::::::::::::::"+goodsBuyList.size());

		for (int i = 0; i < goodsBuyList.size(); i++)
		{
			Hashtable goodsBuyTable = (Hashtable)goodsBuyList.get(i);
			String code = (String)goodsBuyTable.get("code");
			String amount = (String)goodsBuyTable.get("amount");

			queryBuffer = new StringBuffer("");
			queryBuffer.append("INSERT INTO ORDER_GOODS_LIST (");
			queryBuffer.append("SEQ, ORDER_CODE, GOODS_CODE, GOODS_AMOUNT, REG_ID, REG_DATE, REG_IP, UPD_ID, UPD_DATE, UPD_IP");
			queryBuffer.append(") VALUES (");
			queryBuffer.append("ORDER_GOODS_LIST_SEQ.NEXTVAL, CONCAT('ORDER_', LPAD("+seq+",6,'0')),'"+code+"', '"+amount+"','"+id+"', SYSDATE,'"+client+"', '"+id+"', SYSDATE,'"+client+"')");

			dbe = new DBExecute(queryBuffer.toString());
		}

		//ORDER_LIST에 데이터 추가
		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO ORDER_LIST (");
		queryBuffer.append("CODE, MEMBER_ID, NAME, MOBILE1, MOBILE2, MOBILE3, HOME1, HOME2, HOME3, OFFICE1, OFFICE2, OFFICE3, ZIPCODE1, ZIPCODE2, ADDR1, ADDR2, ORDER_STATE, ORDER_DATE , REG_ID, REG_DATE, REG_IP, UPD_ID, UPD_DATE, UPD_IP");
		queryBuffer.append(") VALUES (");
		queryBuffer.append("CONCAT('ORDER_', LPAD("+seq+",6,'0')), '"+id+"', '"+name+"', '"+mobile1+"', '"+mobile2+"', '"+mobile3+"', '"+home1+"', '"+home2+"', '"+home3+"', '"+office1+"', '"+office2+"', ");
		queryBuffer.append("'"+office3+"', '"+zipCode1+"', '"+zipCode2+"', '"+addr1+"', '"+addr2+"', 'O', SYSDATE, '"+id+"', SYSDATE,'"+client+"', '"+id+"', SYSDATE,'"+client+"'");
		queryBuffer.append(")");

		dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}