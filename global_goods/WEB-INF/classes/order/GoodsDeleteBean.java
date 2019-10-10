package order;

import common.db.*;
import common.main.*;

import java.util.*;

public class GoodsDeleteBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String code = (String)inputTable.get("code");
		System.out.println("deletebean code: " + code);
		String disp_yn = (String)inputTable.get("disp_yn");
				
		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE GOODS SET DISP_YN ='" +disp_yn+ "' WHERE CODE = '" + code + "'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}


		