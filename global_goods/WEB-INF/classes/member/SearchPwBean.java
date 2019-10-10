package member;

import java.io.*;
import common.db.*;
import common.main.*;

public class SearchPwBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");
		String name = (String)inputTable.get("name");
		String passQ = (String)inputTable.get("passQ");
        String passA = (String)inputTable.get("passA");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT PASS, NAME FROM MEMBER WHERE ID='"+id+"' AND NAME='"+name+"' AND PASS_Q='"+passQ+"' AND PASS_A='"+passA+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}