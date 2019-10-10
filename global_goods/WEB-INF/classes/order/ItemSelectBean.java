package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class ItemSelectBean extends MainBean
{
	public void funcExecute() throws Exception
	{

		String maincategory = (String)inputTable.get("maincategory");
		System.out.println("main itemselectbean" + maincategory);
		queryBuffer = new StringBuffer("");

		if (maincategory == null || maincategory.equals("A"))
		{
			queryBuffer.append("SELECT CODE,NAME,MAIN_CATEGORY ,USEYN FROM  MIDDLE_CATEGORY WHERE MAIN_CATEGORY = 'F'");
			System.out.println("item  = A test");	
		}
		else if(maincategory.equals("F") || maincategory.equals("E"))
		{
			queryBuffer.append("SELECT CODE, NAME,MAIN_CATEGORY,USEYN FROM  MIDDLE_CATEGORY  WHERE  MAIN_CATEGORY = '" +maincategory+"'");
			System.out.println("item  else= B test");	
		}

	

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();


	}
}