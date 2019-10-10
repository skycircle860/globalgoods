package common.util;

import java.io.*;
import common.db.*;
import common.main.*;

public class ZipCodeSearchBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String qt = (String)inputTable.get("qt");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT CODE, ADDR, BUNJI FROM POST_CODE WHERE ADDR LIKE '%"+qt+"%' ORDER BY ADDR");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}