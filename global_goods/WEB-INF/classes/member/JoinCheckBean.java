package member;

import java.io.*;
import common.db.*;
import common.main.*;

public class JoinCheckBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String jumin1 = (String)inputTable.get("jumin1");
		String jumin2 = (String)inputTable.get("jumin2");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT ID FROM MEMBER WHERE JUMIN1='"+jumin1+"' AND JUMIN2='"+jumin2+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}