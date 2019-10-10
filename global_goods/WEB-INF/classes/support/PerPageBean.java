package support;

import common.db.*;
import common.main.*;

import java.util.*;

public class PerPageBean extends MainBean
{
	String code;
	public PerPageBean(String code)
	{
		this.code = code;
	}
	public void funcExecute() throws Exception
	{
		
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT PER_PAGE FROM BBS_INFO WHERE CODE = '"+code+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}