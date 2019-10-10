package member;

import java.io.*;
import java.util.*;
import common.db.*;
import common.main.*;

public class UserReturnOrderInsertBean extends MainBean
{
	
		
	String return_seq = "";
	public void funcExecute() throws Exception
	{
		
		System.out.println("UserReturnOrderInsertBean 2");
		ArrayList tempList = (ArrayList)inputTable.get("tempList");
		Hashtable temptable = (Hashtable)tempList.get(0);
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
        String comment = (String)inputTable.get("comment");
		String bankcode  = (String)inputTable.get("bankcode");
		String account = (String)inputTable.get("account");
		String addr1 = (String)temptable.get("ADDR1");
		String addr2 = (String)temptable.get("ADDR2");
		String zipcode1 = (String)temptable.get("ZIPCODE1");
		String zipcode2 = (String)temptable.get("ZIPCODE2");
		String home1 = (String)temptable.get("HOME1");
		String home2 = (String)temptable.get("HOME2");
		String home3 = (String)temptable.get("HOME3");
		String office1 = (String)temptable.get("OFFICE1");
		String office2 = (String)temptable.get("OFFICE2");	 
		String office3 = (String)temptable.get("OFFICE3");
		String mobile1 = (String)temptable.get("MOBILE1");
		String mobile2 = (String)temptable.get("MOBILE2");
		String mobile3 = (String)temptable.get("MOBILE3");
		String email = (String)temptable.get("EMAIL");

		/*시퀀스 먼저 받아오기*/
		String seq_query = "SELECT RETURN_LIST_SEQ.NEXTVAL SEQ FROM DUAL";
		DBExecute dbe = new DBExecute(seq_query);
		ArrayList seqList= dbe.getDataList();
		Hashtable seqTable = (Hashtable)seqList.get(0);
		return_seq = (String)seqTable.get("SEQ");

		System.out.println("UserReturnOrderInsertBean 3");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO RETURN_LIST (REQUEST_DATE , CODE,MEMBER_ID , RETURN_COMMENT , BANK_CODE , ACCOUNT_NUM, RETURN_STATE, ");
		queryBuffer.append("HOME1,HOME2,HOME3,OFFICE1,OFFICE2,OFFICE3,MOBILE1,MOBILE2,MOBILE3,ZIPCODE1,ZIPCODE2,ADDR1,ADDR2, ");
		queryBuffer.append("REG_ID,REG_DATE,REG_IP,UPD_ID,UPD_DATE,UPD_IP ");
		queryBuffer.append(")VALUES(");
			

		System.out.println("UserReturnOrderInsertBean 4");
		queryBuffer.append("SYSDATE, CONCAT( 'RETURN_' , LPAD('"+return_seq+"',6,'0')) ,  '"+id+"', '"+comment+"', '"+bankcode+"',  ");
		queryBuffer.append(" '"+account+"', 'E' ,  '"+home1+"',  '"+home2+"',  '"+home3+"',  '"+office1+"',  '"+office2+"' ,  '"+office3+"' , " );
		queryBuffer.append(" '"+mobile1+"',  '"+mobile2+"',  '"+mobile3+"', ");
		queryBuffer.append(" '"+zipcode1+"',  '"+zipcode2+"',  '"+addr1+"',  '"+addr2+"', ");
		queryBuffer.append("  '"+id+"', SYSDATE, '"+client+"', '"+id+"', SYSDATE, '"+client+"' ");
		queryBuffer.append(")");
		System.out.println("UserReturnOrderInsertBean 5");
		

		 
		dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();

		int i = insertQuery();

	}


	public int insertQuery() throws Exception
	{
		
		System.out.println("UserReturnOrderInsertBean 6");

		ArrayList tempList = (ArrayList)inputTable.get("tempList");
		Hashtable temptable = (Hashtable)tempList.get(0);
		int i=0;
		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		String amount = (String)temptable.get("GOODS_AMOUNT");
		String goodsCode = (String)temptable.get("GOODS_CODE");

		StringBuffer queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO RETURN_GOODS_LIST (SEQ, RETURN_CODE,GOODS_CODE,GOODS_AMOUNT, REG_ID, REG_IP, UPD_ID, UPD_IP ,REG_DATE ,UPD_DATE) ");
		queryBuffer.append("VALUES (RETURN_GOODS_LIST_SEQ.NEXTVAL, CONCAT( 'RETURN_' , LPAD('"+return_seq+"' ,6,'0')) , '"+goodsCode+"' , '"+amount+"', '"+id+"', '"+client+"', '"+id+"', '"+client+"'");
		queryBuffer.append(", SYSDATE,SYSDATE)");
		
		
		DBExecute dbe = new DBExecute(queryBuffer.toString());
		System.out.println("UserReturnOrderInsertBean 7");
		return i;
		
		
	}

}