package manager.interest;

import common.db.*;
import common.main.*;

public class InterestListBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT CODE, NAME, USEYN, REG_ID, UPD_ID FROM INTEREST ORDER BY CODE");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}