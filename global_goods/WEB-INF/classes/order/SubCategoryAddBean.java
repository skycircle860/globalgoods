package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class SubCategoryAddBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		System.out.println("sub");

		String id = (String)inputTable.get("id");
		String client = (String)inputTable.get("client");
		
		String subcategory = (String)inputTable.get("subcategory");
		String maincategory = (String)inputTable.get("maincategory");
		String middlecategory = (String)inputTable.get("middlecategory");

		System.out.println("bean test"+middlecategory);
	
		queryBuffer = new StringBuffer("");
		queryBuffer.append("INSERT INTO SUB_CATEGORY (CODE, MAIN_CATEGORY, MIDDLE_CATEGORY, NAME,");
		queryBuffer.append("USEYN,REG_ID,REG_DATE,REG_IP,UPD_ID,UPD_DATE,UPD_IP ");
		queryBuffer.append(") VALUES (");
		queryBuffer.append("LPAD(SUB_CATEGORY_SEQ.NEXTVAL,3,'0'), '"+maincategory+"','"+middlecategory+"','"+subcategory+"','Y','"+id+"', SYSDATE, '"+client+"', '"+id+"', SYSDATE, '"+client+"'");
		queryBuffer.append(")");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();

	}
}