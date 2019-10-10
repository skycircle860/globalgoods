package manager.user;

import java.io.*;
import common.db.*;
import common.main.*;

public class UserUseYnBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String yn = (String)inputTable.get("yn");
		String client = (String)inputTable.get("client");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("UPDATE MEMBER SET USEYN='"+yn+"', UPD_ID='"+id+"', UPD_DATE=SYSDATE, UPD_IP='"+client+"' WHERE ID='"+id+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}