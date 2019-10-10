package member;

import common.db.*;
import common.main.*;

public class UserAccountSelectBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT CODE,NAME FROM BANK_LIST ");

		

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}