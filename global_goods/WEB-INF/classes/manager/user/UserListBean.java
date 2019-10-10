package manager.user;

import common.db.*;
import common.main.*;

public class UserListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String sort = (String)inputTable.get("sort");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT ID, PASS, NAME, REG_ID, JUMIN1||'-'||JUMIN2 JUMIN, TO_CHAR(REG_DATE, 'YYYY-MM-DD') REG_DATE, USEYN, ADMINYN FROM MEMBER ORDER BY " + sort);

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}