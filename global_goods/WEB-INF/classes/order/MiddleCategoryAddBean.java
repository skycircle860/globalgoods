package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class MiddleCategoryAddBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		System.out.println("middle");

		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
	
		String maincategory = (String)inputTable.get("maincategory");
		String name = (String)inputTable.get("name");
		
	
		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO MIDDLE_CATEGORY (CODE, MAIN_CATEGORY, NAME, ");
		queryBuffer.append("USEYN,REG_ID,REG_DATE,REG_IP,UPD_ID,UPD_DATE,UPD_IP ");
		queryBuffer.append(") VALUES (");
		queryBuffer.append("LPAD(MIDDLE_CATEGORY_SEQ.NEXTVAL,3,'0'), '"+maincategory+"','"+name+"','Y','"+id+"', SYSDATE, '"+client+"', '"+id+"', SYSDATE, '"+client+"'");
		queryBuffer.append(")");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
/*
		ItemFileManager bfm = new ItemFileManager();
		int uploadCount = bfm.uploadFile(inputTable);
		
		System.out.println(uploadCount);
		inputTable.put("uploadFile", uploadCount+"");
*/
	}
}