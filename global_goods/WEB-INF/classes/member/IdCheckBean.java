package member;

import java.io.*;
import common.db.*;
import common.main.*;

public class IdCheckBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT ID FROM MEMBER WHERE ID='"+id+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}