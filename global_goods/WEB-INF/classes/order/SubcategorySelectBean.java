package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class SubcategorySelectBean extends MainBean
{
	public void funcExecute() throws Exception
	{

		String maincategory = (String)inputTable.get("maincategory");
		String middlecategory = (String)inputTable.get("middlecategory");
		System.out.println("main middlecategory" + middlecategory);
		queryBuffer = new StringBuffer("");
		

		if (middlecategory.equals("A"))
		{
			queryBuffer.append("SELECT CODE, NAME,USEYN ,MIDDLE_CATEGORY FROM  SUB_CATEGORY  ");
			System.out.println("item  = A test");	
		}

		else
		{
			queryBuffer.append("SELECT CODE, NAME,USEYN ,MIDDLE_CATEGORY FROM  SUB_CATEGORY  WHERE  MIDDLE_CATEGORY = '" +middlecategory+"'");
			System.out.println("item  else= B test");	
		}

	

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();


	}
}