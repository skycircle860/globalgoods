package manager.user;

import java.io.*;
import common.db.*;
import common.main.*;

public class UserInfoBean extends MainBean
{
	public void funcExecute() throws Exception
	{
		String id = (String)inputTable.get("id");

		queryBuffer = new StringBuffer("");
		queryBuffer.append("SELECT ID, PASS, PASS_Q, PASS_A, NAME, JUMIN1, JUMIN2, HOME1, HOME2, HOME3, OFFICE1, OFFICE2, OFFICE3, ");
		queryBuffer.append("MOBILE1, MOBILE2, MOBILE3, ZIPCODE1, ZIPCODE2, ADDR1, ADDR2, EMAIL, INTEREST, ");
		queryBuffer.append("USEYN, ADMINYN, REG_ID, REG_ID, TO_CHAR(REG_DATE, 'YYYY-MM-DD AM HH:MI:SS') REG_DATE, ");
		queryBuffer.append("REG_IP, UPD_ID, TO_CHAR(UPD_DATE, 'YYYY-MM-DD AM HH:MI:SS') UPD_DATE, UPD_IP ");
		queryBuffer.append("FROM MEMBER WHERE ID='"+id+"'");

		DBExecute dbe = new DBExecute(queryBuffer.toString());
		outputList = dbe.getDataList();
	}
}